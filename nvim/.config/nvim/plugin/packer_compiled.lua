-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/malbernaz/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/malbernaz/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/malbernaz/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/malbernaz/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/malbernaz/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  Colorizer = {
    loaded = true,
    path = "/home/malbernaz/.local/share/nvim/site/pack/packer/start/Colorizer"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/malbernaz/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\1\2ž\1\0\0\4\0\6\0\n3\0\0\0003\1\1\0004\2\2\0007\2\3\0027\2\4\2'\3\0\0>\2\2\2;\2\2\1:\1\5\0H\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\4\0\0\21--stdin-filepath\0\19--double-quote\1\0\2\nstdin\2\bexe!./node_modules/.bin/prettier1\0\0\1\0\1\0\0023\0\0\0H\0\2\0\1\0\2\bexe\24~/.cargo/bin/stylua\nstdin\1Ï\3\1\0\6\0\20\0)1\0\0\0004\1\1\0%\2\2\0>\1\2\0027\1\3\0013\2\4\0003\3\5\0002\4\3\0;\0\1\4:\4\6\0032\4\3\0;\0\1\4:\4\a\0032\4\3\0;\0\1\4:\4\b\0032\4\3\0;\0\1\4:\4\t\0032\4\3\0;\0\1\4:\4\n\0032\4\3\0;\0\1\4:\4\v\0032\4\3\0;\0\1\4:\4\f\0032\4\3\0001\5\r\0;\5\1\4:\4\14\3:\3\15\2>\1\2\0014\1\16\0007\1\17\0017\1\18\1%\2\19\0)\3\2\0>\1\3\1G\0\1\0®\1      augroup FormatAutogroup\n        autocmd!\n        autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.vue,*.html,*.css,*.scss,*.rs,*.lua FormatWrite\n      augroup END\n    \14nvim_exec\bapi\bvim\rfiletype\blua\0\bvue\rmarkdown\tscss\bcss\thtml\15typescript\15javascript\1\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0\0" },
    loaded = true,
    path = "/home/malbernaz/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\1\2+\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\16settings/gl\frequire\0" },
    loaded = true,
    path = "/home/malbernaz/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2—\4\0\0\4\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\1>\0\2\1G\0\1\0\nsigns\1\0\0\17changedelete\1\0\4\ttext\bâ–Ž\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\bâ–¶\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\bâ–¶\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\bâ–Ž\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\bâ–Ž\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/malbernaz/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  kommentary = {
    config = { "\27LJ\1\2^\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequire‹\2\1\0\5\0\n\0\0164\0\0\0%\1\1\0>\0\2\0027\1\2\0>\1\1\0017\1\3\0%\2\4\0003\3\5\0>\1\3\0017\1\3\0%\2\6\0003\3\a\0001\4\b\0:\4\t\3>\1\3\1G\0\1\0\21pre_comment_hook\0\1\0\2\31multi_line_comment_strings\tauto\31single_line_comment_string\tauto\bvue\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\26use_extended_mappings\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/home/malbernaz/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/malbernaz/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2Ò\2\0\0\5\1\14\2-4\0\0\0007\0\1\0007\0\2\0>\0\1\2\b\0\0\0T\0#€4\0\0\0007\0\1\0007\0\3\0>\0\1\0027\0\4\0\b\0\1\0T\0\n€4\0\5\0%\1\6\0>\0\2\0027\0\a\0>\0\1\1+\0\0\0007\0\b\0%\1\t\0@\0\2\0T\0\21€4\0\0\0007\0\n\0007\0\v\0'\1\0\0)\2\1\0)\3\1\0002\4\0\0>\0\5\0014\0\5\0%\1\6\0>\0\2\0027\0\a\0>\0\1\1+\0\0\0007\0\b\0%\1\f\0@\0\2\0T\0\3€+\0\0\0007\0\r\0@\0\1\0G\0\1\0\0À\17autopairs_cr\15<c-n><c-y>\31nvim_select_popupmenu_item\bapi\n<c-y>\besc\22confirmCompletion\15completion\frequire\rselected\18complete_info\15pumvisible\afn\bvim\0þÿÿÿ\31ˆ\2\1\0\a\0\17\0\0274\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\2\3\0002\3\0\0>\2\2\0014\2\4\0002\3\0\0:\3\5\0024\2\6\0007\2\a\2%\3\t\0:\3\b\0024\2\5\0001\3\v\0:\3\n\0027\2\f\1%\3\r\0%\4\14\0%\5\15\0003\6\16\0>\2\5\0010\0\0€G\0\1\0\1\0\1\texpr\2&v:lua.MUtils.completion_confirm()\t<CR>\6i\bmap\0\23completion_confirm\5\27completion_confirm_key\6g\bvim\vMUtils\a_G\nsetup\nutils\19nvim-autopairs\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/malbernaz/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-lspconfig"] = {
    after = { "nvim-autopairs" },
    loaded = true,
    only_config = true
  },
  ["nvim-treesitter"] = {
    after = { "nvim-ts-context-commentstring" },
    loaded = true,
    only_config = true
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/home/malbernaz/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/malbernaz/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/malbernaz/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/malbernaz/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/malbernaz/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/malbernaz/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\1\2ž\3\0\0\5\0\20\0$4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\r\0003\2\5\0004\3\0\0%\4\3\0>\3\2\0027\3\4\3:\3\6\0024\3\0\0%\4\a\0>\3\2\0027\3\b\0037\3\t\3:\3\n\0024\3\0\0%\4\a\0>\3\2\0027\3\v\0037\3\t\3:\3\f\2:\2\14\0013\2\16\0003\3\15\0:\3\17\2:\2\18\1>\0\2\0014\0\0\0%\1\1\0>\0\2\0027\0\19\0%\1\17\0>\0\2\1G\0\1\0\19load_extension\15extensions\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\rdefaults\1\0\0\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\16file_sorter\1\0\0\19get_fzy_sorter\22telescope.sorters\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/malbernaz/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\1\2y\0\1\2\0\6\1\0157\1\0\0\a\1\1\0T\1\3€'\1\15\0H\1\2\0T\1\b€7\1\0\0\a\1\2\0T\1\5€4\1\3\0007\1\4\0017\1\5\1\22\1\0\1H\1\2\0G\0\1\0\fcolumns\6o\bvim\rvertical\15horizontal\14directionµæÌ™\19™³æþ\3…\2\1\0\3\0\n\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0001\2\3\0:\2\5\0012\2\0\0:\2\6\0014\2\a\0007\2\b\0027\2\t\2:\2\t\1>\0\2\1G\0\1\0\nshell\6o\bvim\20shade_filetypes\tsize\1\0\b\20shade_terminals\1\17open_mapping\n<c-\\>\20insert_mappings\2\14direction\rvertical\18close_on_exit\2\20start_in_insert\2\17persist_size\2\17hide_numbers\2\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/malbernaz/.local/share/nvim/site/pack/packer/start/toggleterm.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/malbernaz/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/malbernaz/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vscode.nvim"] = {
    loaded = true,
    path = "/home/malbernaz/.local/share/nvim/site/pack/packer/start/vscode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\1\2ž\1\0\0\4\0\6\0\n3\0\0\0003\1\1\0004\2\2\0007\2\3\0027\2\4\2'\3\0\0>\2\2\2;\2\2\1:\1\5\0H\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\4\0\0\21--stdin-filepath\0\19--double-quote\1\0\2\nstdin\2\bexe!./node_modules/.bin/prettier1\0\0\1\0\1\0\0023\0\0\0H\0\2\0\1\0\2\bexe\24~/.cargo/bin/stylua\nstdin\1Ï\3\1\0\6\0\20\0)1\0\0\0004\1\1\0%\2\2\0>\1\2\0027\1\3\0013\2\4\0003\3\5\0002\4\3\0;\0\1\4:\4\6\0032\4\3\0;\0\1\4:\4\a\0032\4\3\0;\0\1\4:\4\b\0032\4\3\0;\0\1\4:\4\t\0032\4\3\0;\0\1\4:\4\n\0032\4\3\0;\0\1\4:\4\v\0032\4\3\0;\0\1\4:\4\f\0032\4\3\0001\5\r\0;\5\1\4:\4\14\3:\3\15\2>\1\2\0014\1\16\0007\1\17\0017\1\18\1%\2\19\0)\3\2\0>\1\3\1G\0\1\0®\1      augroup FormatAutogroup\n        autocmd!\n        autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.vue,*.html,*.css,*.scss,*.rs,*.lua FormatWrite\n      augroup END\n    \14nvim_exec\bapi\bvim\rfiletype\blua\0\bvue\rmarkdown\tscss\bcss\thtml\15typescript\15javascript\1\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2ž\3\0\0\4\0\20\0\0234\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0003\3\a\0:\3\b\2:\2\t\0013\2\n\0:\2\v\0013\2\f\0:\2\r\0013\2\14\0:\2\15\0013\2\16\0:\2\17\0013\2\18\0:\2\19\1>\0\2\1G\0\1\0\26context_commentstring\1\0\2\19enable_autocmd\1\venable\2\fautotag\1\0\1\venable\2\14autopairs\1\0\1\venable\2\fmatchup\1\0\1\venable\2\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\1\2y\0\1\2\0\6\1\0157\1\0\0\a\1\1\0T\1\3€'\1\15\0H\1\2\0T\1\b€7\1\0\0\a\1\2\0T\1\5€4\1\3\0007\1\4\0017\1\5\1\22\1\0\1H\1\2\0G\0\1\0\fcolumns\6o\bvim\rvertical\15horizontal\14directionµæÌ™\19™³æþ\3…\2\1\0\3\0\n\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0001\2\3\0:\2\5\0012\2\0\0:\2\6\0014\2\a\0007\2\b\0027\2\t\2:\2\t\1>\0\2\1G\0\1\0\nshell\6o\bvim\20shade_filetypes\tsize\1\0\b\20shade_terminals\1\17open_mapping\n<c-\\>\20insert_mappings\2\14direction\rvertical\18close_on_exit\2\20start_in_insert\2\17persist_size\2\17hide_numbers\2\0\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\2—\4\0\0\4\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\1>\0\2\1G\0\1\0\nsigns\1\0\0\17changedelete\1\0\4\ttext\bâ–Ž\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\bâ–¶\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\bâ–¶\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\bâ–Ž\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\bâ–Ž\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\1\2+\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\16settings/gl\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\1\2^\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequire‹\2\1\0\5\0\n\0\0164\0\0\0%\1\1\0>\0\2\0027\1\2\0>\1\1\0017\1\3\0%\2\4\0003\3\5\0>\1\3\0017\1\3\0%\2\6\0003\3\a\0001\4\b\0:\4\t\3>\1\3\1G\0\1\0\21pre_comment_hook\0\1\0\2\31multi_line_comment_strings\tauto\31single_line_comment_string\tauto\bvue\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\26use_extended_mappings\22kommentary.config\frequire\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\2ž\3\0\0\5\0\20\0$4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\r\0003\2\5\0004\3\0\0%\4\3\0>\3\2\0027\3\4\3:\3\6\0024\3\0\0%\4\a\0>\3\2\0027\3\b\0037\3\t\3:\3\n\0024\3\0\0%\4\a\0>\3\2\0027\3\v\0037\3\t\3:\3\f\2:\2\14\0013\2\16\0003\3\15\0:\3\17\2:\2\18\1>\0\2\0014\0\0\0%\1\1\0>\0\2\0027\0\19\0%\1\17\0>\0\2\1G\0\1\0\19load_extension\15extensions\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\rdefaults\1\0\0\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\16file_sorter\1\0\0\19get_fzy_sorter\22telescope.sorters\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\1\2y\0\0\6\0\t\0\0154\0\0\0007\0\1\0007\0\2\0007\0\3\0002\1\0\0003\2\4\0003\3\b\0004\4\0\0007\4\5\0047\4\6\4%\5\a\0>\4\2\2;\4\1\3>\0\4\1G\0\1\0\1\3\0\0\0\3\0\6$\tline\afn\1\3\0\0\3\0\3\0\21range_formatting\bbuf\blsp\bvim®\20\1\0\15\0}\0í\0014\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0024\2\3\0007\2\4\0027\2\5\2%\3\6\0%\4\a\0>\2\3\0014\2\3\0007\2\b\0024\3\3\0007\3\b\0037\3\t\3%\4\n\0$\3\4\3:\3\t\0024\2\3\0007\2\v\0023\3\r\0:\3\f\0024\2\3\0007\2\v\2'\3\3\0:\3\14\0027\2\15\0007\2\16\0023\3\18\0003\4\17\0:\4\19\0033\4\20\0:\4\21\0033\4\22\0:\4\23\0037\4\24\0007\4\25\4%\5\26\0%\6\27\0%\a\28\0%\b\29\0>\4\5\2:\4\30\0037\4\31\1:\4\31\3>\2\2\1%\2 \0%\3!\0007\4\"\0007\4\16\0043\5%\0003\6#\0;\3\1\6\16\a\2\0%\b$\0$\a\b\a;\a\3\6:\6\19\0053\0068\0003\a)\0003\b'\0003\t&\0:\t(\b:\b*\a3\b+\0004\t\3\0007\t,\t4\n-\0007\n.\n%\v/\0>\t\3\2:\t.\b:\b0\a3\b5\0002\t\0\b4\n\3\0007\n1\n7\n2\n%\v3\0>\n\2\2)\v\2\0009\v\n\t4\n\3\0007\n1\n7\n2\n%\v4\0>\n\2\2)\v\2\0009\v\n\t:\t6\b:\b7\a:\a9\6:\6:\0057\6\31\1:\6\31\5>\4\2\0014\4\3\0007\4;\0047\4<\0047\4=\4>\4\1\0027\5>\0047\5\2\0057\5?\5)\6\2\0:\6@\0057\5>\0047\5\2\0057\5?\0053\6C\0003\aB\0:\aD\6:\6A\0054\5\0\0%\6\1\0>\5\2\0027\5E\0057\5\16\0053\6F\0:\4G\0063\aL\0003\bI\0003\tH\0:\tJ\b3\tK\0:\t\2\b:\bM\a:\a:\0067\a\31\1:\a\31\6>\5\2\0014\5\0\0%\6\1\0>\5\2\0027\5N\0057\5\16\0053\6O\0:\4G\0063\aQ\0003\bP\0:\bR\a3\bS\0:\bT\a:\a\23\0067\a\31\1:\a\31\6>\5\2\0014\5\0\0%\6\1\0>\5\2\0027\5U\0057\5\16\0053\6Y\0003\aW\0002\b\3\0001\tV\0;\t\1\b:\bX\a:\aZ\6:\4G\0067\a\31\1:\a\31\6>\5\2\0014\5\0\0%\6\1\0>\5\2\0027\5[\0057\5\16\0053\6]\0003\a\\\0:\a\19\0063\a^\0:\a\21\0063\as\0003\b_\0002\t\0\0:\t`\b2\t\0\0:\ta\b3\tb\0002\n\0\0:\nc\t:\tN\b3\td\0002\n\0\0:\ne\t:\tf\b2\t\0\0:\tg\b3\th\0002\n\0\0:\ne\t:\ti\b3\tk\0003\nj\0:\n\2\t3\nm\0003\vl\0:\vn\n2\v\0\0:\vo\n:\ne\t3\np\0:\nq\t:\tr\b:\bt\a:\a\23\0067\a\24\0007\a\25\a%\b\26\0%\tu\0>\a\3\2:\a\30\0067\a\31\1:\a\31\6>\5\2\0013\5v\0004\6w\0\16\a\5\0>\6\2\4D\t\v€%\vx\0\16\f\t\0$\v\f\v4\f\3\0007\f1\f7\fy\f\16\r\v\0003\14z\0:\n{\14:\v|\14>\f\3\1B\t\3\3N\tóG\0\1\0\vtexthl\ttext\1\0\1\nnumhl\5\16sign_define\23LspDiagnosticsSign\npairs\1\0\4\16Information\bï‘‰\tHint\bï µ\nError\bï™™\fWarning\bï”©\18vue.config.js\vconfig\1\0\0\nvetur\15validation\1\0\3\nstyle\2\vscript\2\rtemplate\2\28defaultFormatterOptions\21defaultFormatter\1\0\2\23styleInitialIndent\1\24scriptInitialIndent\1\1\0\2\ajs\tnone\ats\tnone\1\0\1\29useWorkspaceDependencies\1\1\0\3\14tagCasing\nkebab\15autoImport\1\24useScaffoldSnippets\1\15typescript\1\0\0\20stylusSupremacy\15javascript\vformat\1\0\0\fsuggest\1\0\0\nemmet\bcss\1\0\0\1\2\0\0\bvue\1\0\0\1\2\0\0\bvls\nvuels\rcommands\1\0\0\vFormat\1\0\0\0\vjsonls\22embeddedLanguages\1\0\2\15javascript\2\bcss\2\25configurationSection\1\0\0\1\4\0\0\thtml\bcss\15javascript\1\0\0\thtml\tscss\1\0\0\1\0\2#triggerPropertyValueCompletion\2\"completePropertyWithSemicolon\2\tlint\1\0\0\1\0\3\14zeroUnits\fwarning\15idSelector\fwarning\24duplicateProperties\fwarning\17capabilities\1\0\0\ncssls\15properties\1\0\0\1\4\0\0\18documentation\vdetail\24additionalTextEdits\19resolveSupport\19snippetSupport\19completionItem\17textDocument\29make_client_capabilities\rprotocol\blsp\rsettings\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\vexpand\afn\fruntime\6;\tpath\fpackage\nsplit\1\0\1\fversion\vLuaJIT\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\1\0\0\14/main.lua\1\3\0\0\0\a-E\16sumneko_lua!/usr/bin/lua-language-server#/usr/share/lua-language-server\14on_attach\rroot_dir\t.git\18jsconfig.json\18tsconfig.json\17package.json\17root_pattern\tutil\17init_options\1\0\1\rhostInfo\vneovim\14filetypes\1\a\0\0\15javascript\20javascriptreact\19javascript.jsx\15typescript\20typescriptreact\19typescript.tsx\bcmd\1\0\0\1\3\0\0\31typescript-language-server\f--stdio\nsetup\rtsserver&completion_trigger_keyword_length\1\4\0\0\nexact\14substring\nfuzzy&completion_matching_strategy_list\6g\6c\14shortmess\6o\30menuone,noinsert,noselect\16completeopt\20nvim_set_option\bapi\bvim\15completion\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
try_loadstring("\27LJ\1\2Ò\2\0\0\5\1\14\2-4\0\0\0007\0\1\0007\0\2\0>\0\1\2\b\0\0\0T\0#€4\0\0\0007\0\1\0007\0\3\0>\0\1\0027\0\4\0\b\0\1\0T\0\n€4\0\5\0%\1\6\0>\0\2\0027\0\a\0>\0\1\1+\0\0\0007\0\b\0%\1\t\0@\0\2\0T\0\21€4\0\0\0007\0\n\0007\0\v\0'\1\0\0)\2\1\0)\3\1\0002\4\0\0>\0\5\0014\0\5\0%\1\6\0>\0\2\0027\0\a\0>\0\1\1+\0\0\0007\0\b\0%\1\f\0@\0\2\0T\0\3€+\0\0\0007\0\r\0@\0\1\0G\0\1\0\0À\17autopairs_cr\15<c-n><c-y>\31nvim_select_popupmenu_item\bapi\n<c-y>\besc\22confirmCompletion\15completion\frequire\rselected\18complete_info\15pumvisible\afn\bvim\0þÿÿÿ\31ˆ\2\1\0\a\0\17\0\0274\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\2\3\0002\3\0\0>\2\2\0014\2\4\0002\3\0\0:\3\5\0024\2\6\0007\2\a\2%\3\t\0:\3\b\0024\2\5\0001\3\v\0:\3\n\0027\2\f\1%\3\r\0%\4\14\0%\5\15\0003\6\16\0>\2\5\0010\0\0€G\0\1\0\1\0\1\texpr\2&v:lua.MUtils.completion_confirm()\t<CR>\6i\bmap\0\23completion_confirm\5\27completion_confirm_key\6g\bvim\vMUtils\a_G\nsetup\nutils\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")

vim.cmd [[ packadd nvim-ts-context-commentstring ]]
time([[Sequenced loading]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
