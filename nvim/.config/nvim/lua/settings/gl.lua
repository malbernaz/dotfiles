local gl = require("galaxyline")
local utils = require("utils")
local condition = require("galaxyline.condition")
local diagnostic = require("galaxyline.provider_diagnostic")
local icons = require("galaxyline.provider_fileinfo")

icons.define_file_icon()

local gls = gl.section
gl.short_line_list = { "packer", "NvimTree", "LspTrouble" }

local colors = {
  bg = "#252526",
  fg = "#d4d4d4",
  blue = "#0c7d9d",
  green = "#587c0c",
  purple = "#c586c0",
  orange = "#d18616",
  red = "#f14c4c",
  yellow = "#cca700",
  white = "#ffffff",
}

-- Local helper functions
local buffer_not_empty = function()
  return not utils.is_buffer_empty()
end

local checkwidth = function()
  return utils.has_width_gt(35) and buffer_not_empty()
end

local is_file = function()
  return vim.bo.buftype ~= "nofile"
end

local function has_value(tab, val)
  for _, value in ipairs(tab) do
    if value[1] == val then
      return true
    end
  end
  return false
end

local mode_color = function()
  local mode_colors = {
    [110] = colors.green,
    [105] = colors.blue,
    [99] = colors.green,
    [116] = colors.blue,
    [118] = colors.purple,
    [22] = colors.purple,
    [86] = colors.purple,
    [82] = colors.red,
    [115] = colors.red,
    [83] = colors.red,
  }

  local color = mode_colors[vim.fn.mode():byte()]
  if color ~= nil then
    return color
  else
    return colors.purple
  end
end

local function get_current_file_name()
  local file = vim.fn.expand("%:t")
  if vim.fn.empty(file) == 1 then
    return ""
  end
  if vim.bo.modifiable then
    if vim.bo.modified then
      return file .. "  "
    end
  end
  return file .. " "
end

local function split(str, sep)
  local res = {}
  local n = 1
  for w in str:gmatch("([^" .. sep .. "]*)") do
    res[n] = res[n] or w -- only set once (so the blank after a string is ignored)
    if w == "" then
      n = n + 1
    end -- step forwards on a blank but not a string
  end
  return res
end

local function get_basename(file)
  return file:match("^.+/(.+)$")
end

local GetGitRoot = function()
  local git_dir = require("galaxyline.provider_vcs").get_git_dir()
  if not git_dir then
    return ""
  end

  local git_root = git_dir:gsub("/.git/?$", "")
  return get_basename(git_root)
end

local LspCheckDiagnostics = function()
  if
    #vim.lsp.get_active_clients() > 0
    and diagnostic.get_diagnostic_error() == nil
    and diagnostic.get_diagnostic_warn() == nil
    and diagnostic.get_diagnostic_info() == nil
    and require("lsp-status").status() == " "
  then
    return " "
  end
  return ""
end

-- Left side
gls.left[1] = {
  ViMode = {
    provider = function()
      local aliases = {
        [110] = "NORMAL",
        [105] = "INSERT",
        [99] = "COMMAND",
        [116] = "TERMINAL",
        [118] = "VISUAL",
        [22] = "V-BLOCK",
        [86] = "V-LINE",
        [82] = "REPLACE",
        [115] = "SELECT",
        [83] = "S-LINE",
      }
      vim.api.nvim_command("hi GalaxyViMode guibg=" .. mode_color())
      local alias = aliases[vim.fn.mode():byte()]
      local mode
      if alias ~= nil then
        if utils.has_width_gt(35) then
          mode = alias
        else
          mode = alias:sub(1, 1)
        end
      else
        mode = vim.fn.mode():byte()
      end
      return "  " .. mode .. " "
    end,
    highlight = { colors.white, colors.white },
    separator = " ",
    separator_highlight = { colors.bg, colors.bg },
  },
}

gls.left[2] = {
  FileIcon = {
    provider = { "FileIcon" },
    condition = buffer_not_empty,
    highlight = {
      require("galaxyline.provider_fileinfo").get_file_icon,
      colors.bg,
    },
  },
}

gls.left[3] = {
  FilePath = {
    provider = function()
      local fp = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
      local tbl = split(fp, "/")
      local len = #tbl

      if len > 2 and not len == 3 and not tbl[0] == "~" then
        return "…/" .. table.concat(tbl, "/", len - 1) .. "/" -- shorten filepath to last 2 folders
      else
        return fp .. "/"
      end
    end,
    condition = function()
      return is_file() and checkwidth()
    end,
    highlight = { colors.fg, colors.bg },
  },
}

gls.left[4] = {
  FileName = {
    provider = get_current_file_name,
    condition = buffer_not_empty,
    highlight = { colors.fg, colors.bg },
    separator = " ",
    separator_highlight = { colors.bg, colors.bg },
  },
}

gls.left[5] = {
  DiagnosticsCheck = {
    provider = { LspCheckDiagnostics },
    highlight = { colors.fg, colors.bg },
  },
}

gls.left[6] = {
  DiagnosticError = {
    provider = { "DiagnosticError" },
    icon = "  ",
    highlight = { colors.red, colors.bg },
  },
}

gls.left[7] = {
  DiagnosticWarn = {
    provider = { "DiagnosticWarn" },
    icon = "  ",
    highlight = { colors.yellow, colors.bg },
  },
}

gls.left[8] = {
  DiagnosticInfo = {
    provider = { "DiagnosticInfo" },
    icon = "  ",
    highlight = { colors.blue, colors.bg },
  },
}

gls.right[1] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = checkwidth,
    icon = "+",
    highlight = { colors.green, colors.bg },
    separator = " ",
    separator_highlight = { colors.bg, colors.bg },
  },
}

gls.right[2] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = "~",
    highlight = { colors.yellow, colors.bg },
  },
}

gls.right[3] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = "-",
    highlight = { colors.red, colors.bg },
  },
}

gls.right[5] = {
  GitBranch = {
    provider = {
      function()
        return " "
      end,
      "GitBranch",
    },
    condition = condition.check_git_workspace,
    highlight = { colors.orange, colors.bg },
    separator = " ",
    separator_highlight = { colors.bg, colors.bg },
  },
}

gls.right[6] = {
  GitRoot = {
    provider = { GetGitRoot },
    condition = function()
      return utils.has_width_gt(50) and condition.check_git_workspace
    end,
    highlight = { colors.fg, colors.bg },
    separator = " ",
    separator_highlight = { colors.bg, colors.bg },
  },
}

gls.right[7] = {
  PerCent = {
    provider = "LinePercent",
    separator = "  ",
    separator_highlight = { colors.blue, colors.bg },
    highlight = { colors.white, colors.blue },
  },
}

gls.short_line_left[1] = {
  FileIcon = {
    provider = {
      function()
        return " "
      end,
      "FileIcon",
    },
    condition = function()
      return buffer_not_empty and has_value(gl.short_line_list, vim.bo.filetype)
    end,
    highlight = {
      require("galaxyline.provider_fileinfo").get_file_icon,
      colors.bg,
    },
  },
}

gls.short_line_left[2] = {
  FileName = {
    provider = get_current_file_name,
    condition = buffer_not_empty,
    highlight = { colors.fg, colors.bg },
    separator = "",
    separator_highlight = { colors.bg, colors.bg },
  },
}

-- gls.short_line_right[1] = {
--   BufferIcon = {
--     provider = "BufferIcon",
--     highlight = { colors.fg, colors.bg },
--     separator = "",
--     separator_highlight = { colors.bg, colors.bg },
--   },
-- }
--
gl.load_galaxyline()
