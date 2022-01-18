return function()
  local yanil = require("yanil")
  local git = require("yanil/git")
  local decorators = require("yanil/decorators")
  local devicons = require("yanil/devicons")
  local canvas = require("yanil/canvas")
  local tree = require("yanil/sections/tree"):new()
  local utils = require("malbernaz.utils")
  local fns = require("malbernaz.filetree.fns")
  local git_decorator = require("malbernaz.filetree.decorators")

  yanil.setup({
    git = {
      icons = {
        Unstaged = "●",
        Staged = "●",
        Unmerged = "●",
        Renamed = "●",
        Untracked = "U",
        Modified = "M",
        Deleted = "●",
        Dirty = "●",
        Ignored = "●",
        Clean = "●",
        Unknown = "●",
      },
    },
  })

  tree:setup({
    draw_opts = {
      decorators = {
        decorators.space,
        decorators.pretty_indent,
        devicons.decorator(),
        decorators.space,
        decorators.default,
        decorators.executable,
        decorators.readonly,
        decorators.link_to,
        git_decorator,
      },
    },
    filters = {
      function(name)
        local patterns = {
          "^%.git$",
          "%.pyc",
          "^__pycache__$",
          "^%.idea$",
          "^%.iml$",
          "^%.DS_Store$",
          "%.o$",
          "%.d$",
        }

        for _, pat in ipairs(patterns) do
          if string.find(name, pat) then
            return true
          end
        end
      end,
    },
    keymaps = {
      ["]c"] = git.jump_next,
      ["[c"] = git.jump_prev,
      ["A"] = fns.create_node,
      ["D"] = fns.delete_node,
      ["M"] = fns.move_node,
      ["C"] = fns.copy_node,
      ["R"] = fns.refresh_and_focus,
      ["P"] = fns.go_to_parent_node,
      ["gd"] = fns.git_diff,
      ["U"] = utils.noop,
    },
  })

  local loaded = false
  canvas.register_hooks({
    on_exit = function()
      vim.wo.cursorlineopt = "number"
      vim.wo.signcolumn = "yes"
    end,
    on_enter = function()
      vim.wo.cursorlineopt = "line"
      vim.wo.signcolumn = "no"
      vim.cmd([[ silent vertical resize 45 ]])

      if not loaded then
        git.update(tree.cwd)
        loaded = true
      end
    end,
  })

  canvas.setup({
    sections = { tree },
    autocmds = {
      {
        event = "User",
        pattern = "YanilGitStatusChanged",
        cmd = function()
          git.refresh_tree(tree)
        end,
      },
      {
        event = "User",
        pattern = "FugitiveChanged",
        cmd = function()
          git.refresh_tree(tree)
        end,
      },
    },
  })

  utils.map("n", "<leader>n", ":YanilToggle<cr>")
end
