local loop = vim.loop
local api = vim.api
local git = require("yanil/git")
local utils = require("utils")

local open_mode = loop.constants.O_CREAT + loop.constants.O_WRONLY + loop.constants.O_TRUNC

local M = {}

local function clear_prompt()
  vim.api.nvim_command("normal :esc<CR>")
  vim.api.nvim_command("normal :esc<CR>")
end

local function clear_buffer(path)
  for _, buf in pairs(api.nvim_list_bufs()) do
    if api.nvim_buf_get_name(buf) == path then
      api.nvim_command(":bwipeout! " .. buf)
    end
  end
end

local function create_dirs_if_needed(dirs)
  local parentDir = vim.fn.fnamemodify(dirs, ":h")
  local dir_split = vim.split(parentDir, "/")

  local directories = ""
  for _, dir in ipairs(dir_split) do
    directories = directories .. dir .. "/"
    local stats = loop.fs_stat(directories)
    if stats == nil then
      loop.fs_mkdir(directories, 493)
    end
  end
end

-- Create Node
function M.create_node(tree, node)
  node = node:is_dir() and node or node.parent
  local msg_tag = "Enter the dir/file name to be created. Dirs end with a '/'\n"
  local msg = string.format("Add a childnode \n%s \n%s", string.rep("=", 58), msg_tag)
  local ans = vim.fn.input(msg, node.abs_path)

  local refresh = vim.schedule_wrap(function()
    tree:refresh(nil, {}, function()
      tree.root:load(true)
    end)
    git.update(tree.cwd)
    tree:go_to_node(tree.root:find_node_by_path(ans))
    clear_prompt()
    print("Created " .. ans .. " successfully")
  end)

  local function file_writer(path)
    create_dirs_if_needed(path)
    local fd = loop.fs_open(path, "w", open_mode)
    if not fd then
      api.nvim_err_writeln("Could not create file " .. path)
      return
    end
    loop.fs_chmod(path, 420)
    loop.fs_close(fd)
  end

  if not ans or ans == "" then
    return
  end

  if loop.fs_stat(ans) then
    clear_prompt()
    print("File already exists")
    return
  end

  if vim.endswith(ans, "/") then
    create_dirs_if_needed(ans)
  else
    file_writer(ans)
  end
  refresh()
end

-- Delete Node
function M.delete_node(tree, node)
  if node == tree.root then
    return
  end

  if node:is_dir() then
    node:load()
  end

  local msg_tag = string.format("Are you sure you want to delete (y/n) \n%s: ", node.abs_path)

  if node:is_dir() and #node.entries > 0 then
    msg_tag = "Warning, directory is not empty \n" .. msg_tag
  end

  local msg = string.format("Delete the current node \n%s \n%s", string.rep("=", 58), msg_tag)
  local answer = vim.fn.input(msg)

  clear_prompt()
  if answer:lower() ~= "y" then
    print("Operation canceld")
    return
  end

  local function delete_dir(cwd)
    local handle = loop.fs_scandir(cwd)
    if type(handle) == "string" then
      return api.nvim_err_writeln(handle)
    end

    while true do
      local name, t = loop.fs_scandir_next(handle)
      if not name then
        break
      end

      local new_cwd = cwd .. "/" .. name
      if t == "directory" then
        local success = delete_dir(new_cwd)
        if not success then
          print("failed to delete ", new_cwd)
          return false
        end
      else
        clear_buffer(new_cwd)
        local success = loop.fs_unlink(new_cwd)
        if not success then
          return false
        end
      end
    end
    return loop.fs_rmdir(cwd)
  end

  if node.entries then
    local success = delete_dir(node.abs_path:sub(1, -2))
    if not success then
      return api.nvim_err_writeln("Could not remove " .. node.name)
    end
  else
    local success = loop.fs_unlink(node.abs_path)
    if not success then
      return api.nvim_err_writeln("Could not remove " .. node.name)
    end
    clear_buffer(node.abs_path)
  end

  local next_node = tree:find_neighbor(node, -1)
  local path = next_node.abs_path
  local refresh = vim.schedule_wrap(function()
    tree:refresh(tree.root, {}, function()
      git.update(tree.cwd)
      tree.root:load(true)
    end)
    tree:go_to_node(tree.root:find_node_by_path(path))
    print("Deleted " .. node.name .. " successfully")
  end)
  refresh()
end

-- Move Node
function M.move_node(tree, node)
  -- node = node:is_dir() and node or node.parent
  local msg_tag = "Enter the new path for the node:"
  local msg = string.format("Rename/Move the current node \n%s \n%s", string.rep("=", 58), msg_tag)

  local original_location = node.abs_path
  local destination = vim.fn.input(msg, original_location, "file")

  clear_prompt()
  -- If cancelled
  if not destination or destination == "" then
    print("Operation canceld")
    return
  end

  -- If aleady exists
  if loop.fs_stat(destination) then
    print(destination, "is already exists")
    return
  end

  local refresh = vim.schedule_wrap(function()
    tree:refresh(nil, {}, function()
      tree.root:load(true)
    end)
    git.update(tree.cwd)
    tree:go_to_node(tree.root:find_node_by_path(destination))
  end)

  create_dirs_if_needed(destination)
  loop.fs_rename(original_location, destination, function(err)
    if err then
      print("Could not move the files")
      return
    else
      print("Moved " .. node.name .. " successfully")
    end
    refresh()
  end)
end

-- Copy Node
function M.copy_node(tree, node)
  -- node = node:is_dir() and node or node.parent
  local msg_tag = "Enter the new path for the node:"
  local msg = string.format("Copy the node \n%s \n%s", string.rep("=", 58), msg_tag)
  local ans = vim.fn.input(msg, node.abs_path)
  clear_prompt()

  local refresh = vim.schedule_wrap(function()
    tree:refresh(nil, {}, function()
      tree.root:load(true)
    end)
    git.update(tree.cwd)
    -- tree:go_to_node(tree.root:find_node_by_path(ans))
    print("Created " .. ans .. " successfully")
  end)

  if not ans or ans == "" then
    return
  end
  if loop.fs_stat(ans) then
    print("Node already exists")
    return
  end

  loop.fs_copyfile(node.abs_path, ans)
  local handle
  handle = loop.spawn("cp", { args = { "-r", node.abs_path, ans } }, function(code)
    handle:close()
    if code ~= 0 then
      print("copy failed")
      return
    end
    refresh()
  end)
end

-- REFRESH
function M.refresh_and_focus(tree, node)
  tree:refresh(nil, {}, function()
    tree.root:load(true)
  end)
  git.update(tree.cwd)
  tree:go_to_node(tree.root:find_node_by_path(node.abs_path))
end

function M.go_to_parent_node(tree, node)
  if not node.parent then
    return
  end
  tree:go_to_node(node.parent)
end

function M.git_diff(_, node)
  local diff = git.diff(node)
  if not diff then
    return
  end

  -- content
  local bufnr = api.nvim_create_buf(false, true)
  local winnr = utils.floating_window_big(bufnr)

  utils.set_buf(bufnr, "filetype", "diff")
  utils.set_buf(bufnr, "bufhidden", "wipe")
  api.nvim_win_set_option(winnr, "cursorline", true)
  api.nvim_win_set_option(winnr, "cursorlineopt", "number")
  api.nvim_win_set_option(winnr, "number", true)
  api.nvim_buf_set_lines(bufnr, 0, -1, false, diff)

  api.nvim_command(
    string.format([[command! -buffer Apply lua require("yanil/git").apply_buf(%d)]], bufnr)
  )
end

return M
