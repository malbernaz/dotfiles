local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local action_set = require("telescope.actions.set")
local utils = require("telescope.utils")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values
local scan = require("plenary.scandir")
local Path = require("plenary.path")

local os_sep = Path.path.sep

local M = {}

function M.file_browser(opts)
  opts = opts or {}

  local rename_loaded_buffers = function(old_name, new_name)
    for _, buf in pairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(buf) then
        if vim.api.nvim_buf_get_name(buf) == old_name then
          vim.api.nvim_buf_set_name(buf, new_name)
          vim.api.nvim_buf_call(buf, function()
            vim.cmd("silent! w!")
          end)
        end
      end
    end
  end

  local is_dir = function(value)
    return value:sub(-1, -1) == os_sep
  end

  opts.depth = opts.depth or 1
  opts.cwd = opts.cwd and vim.fn.expand(opts.cwd) or vim.loop.cwd()
  opts.hidden = true
  opts.new_finder = opts.new_finder
    or function(path)
      opts.cwd = path
      local data = {}

      scan.scan_dir(path, {
        hidden = opts.hidden or false,
        add_dirs = true,
        depth = opts.depth,
        on_insert = function(entry, typ)
          table.insert(data, typ == "directory" and (entry .. os_sep) or entry)
        end,
      })
      table.insert(data, 1, ".." .. os_sep)

      local maker = function()
        local mt = {}
        mt.cwd = opts.cwd
        mt.display = function(entry)
          local hl_group
          local display = utils.transform_path(opts, entry.value)
          if is_dir(entry.value) then
            display = display .. os_sep
            if not opts.disable_devicons then
              display = (opts.dir_icon or "") .. " " .. display
              hl_group = "Default"
            end
          else
            display, hl_group = utils.transform_devicons(
              entry.value,
              display,
              opts.disable_devicons
            )
          end

          if hl_group then
            return display, { { { 1, 3 }, hl_group } }
          else
            return display
          end
        end

        mt.__index = function(t, k)
          local raw = rawget(mt, k)
          if raw then
            return raw
          end

          if k == "path" then
            local retpath = Path:new({ t.cwd, t.value }):absolute()
            if not vim.loop.fs_access(retpath, "R", nil) then
              retpath = t.value
            end
            if is_dir(t.value) then
              retpath = retpath .. os_sep
            end
            return retpath
          end

          return rawget(t, rawget({ value = 1 }, k))
        end

        return function(line)
          local tbl = { line }
          tbl.ordinal = Path:new(line):make_relative(opts.cwd)
          return setmetatable(tbl, mt)
        end
      end

      return finders.new_table({ results = data, entry_maker = maker() })
    end

  pickers.new(opts, {
    prompt_title = "File Browser",
    finder = opts.new_finder(opts.cwd),
    previewer = conf.file_previewer(opts),
    sorter = conf.file_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      action_set.select:replace_if(function()
        return is_dir(action_state.get_selected_entry().path)
      end, function()
        local new_cwd = vim.fn.expand(action_state.get_selected_entry().path:sub(1, -2))
        local current_picker = action_state.get_current_picker(prompt_bufnr)
        current_picker.cwd = new_cwd
        current_picker:refresh(opts.new_finder(new_cwd), { reset_prompt = true })
      end)

      local create_new_file = function()
        local current_picker = action_state.get_current_picker(prompt_bufnr)
        local file = action_state.get_current_line()
        if file == "" then
          print(
            "To create a new file or directory(add "
              .. os_sep
              .. " at the end of file) "
              .. "write the desired new into the prompt and press <C-e>. "
              .. "It works for not existing nested input as well."
              .. "Example: this"
              .. os_sep
              .. "is"
              .. os_sep
              .. "a"
              .. os_sep
              .. "new_file.lua"
          )
          return
        end

        local fpath = current_picker.cwd .. os_sep .. file
        if not is_dir(fpath) then
          actions.close(prompt_bufnr)
          Path:new(fpath):touch({ parents = true })
          vim.cmd(string.format(":e %s", fpath))
        else
          Path:new(fpath:sub(1, -2)):mkdir({ parents = true })
          local new_cwd = vim.fn.expand(fpath)
          current_picker.cwd = new_cwd
          current_picker:refresh(opts.new_finder(new_cwd), { reset_prompt = true })
        end
      end

      local rename_file = function()
        local current_picker = action_state.get_current_picker(prompt_bufnr)
        local entry = action_state.get_selected_entry(prompt_bufnr)
        local old_name = Path:new(entry.value)
        local new_name = Path:new(vim.fn.input("New Name: ", old_name:make_relative()))
        local new_cwd = vim.fn.expand("%:p:h")

        if new_name:exists() then
          print(string.format("%s already exists! Skipping.", new_name.filename))
          return
        end

        old_name:rename({ new_name = new_name.filename })
        rename_loaded_buffers(old_name:absolute(), new_name:absolute())

        if current_picker:is_multi_selected(entry) then
          current_picker._multi:drop(entry)
        end

        current_picker.cwd = new_cwd
        current_picker:refresh(opts.new_finder(new_cwd), { reset_prompt = true })
      end

      local delete_file = function()
        local current_picker = action_state.get_current_picker(prompt_bufnr)
        local entry = action_state.get_selected_entry(prompt_bufnr)
        local file_path = Path:new(entry.value)
        local new_cwd = vim.fn.expand("%:p:h")

        if is_dir(entry.value) then
          file_path:rmdir()
        else
          file_path:rm()
        end

        current_picker.cwd = new_cwd
        current_picker:refresh(opts.new_finder(new_cwd), { reset_prompt = true })
      end

      local navigate_back = function()
        local current_picker = action_state.get_current_picker(prompt_bufnr)
        local new_cwd = vim.fn.expand(current_picker.cwd .. os_sep .. "/..")
        current_picker.cwd = new_cwd
        current_picker:refresh(opts.new_finder(new_cwd), { reset_prompt = true })
      end

      map("i", "<c-e>", create_new_file)
      map("n", "<c-e>", create_new_file)
      map("i", "<c-r>", rename_file)
      map("n", "<c-r>", rename_file)
      map("i", "<c-d>", delete_file)
      map("n", "<c-d>", delete_file)
      map("i", "<c-b>", navigate_back)
      map("n", "<c-b>", navigate_back)

      return true
    end,
  }):find()
end

return M
