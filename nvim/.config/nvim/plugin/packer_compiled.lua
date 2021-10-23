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
local package_path_str = "/Users/malbernaz/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/malbernaz/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/malbernaz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/malbernaz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/malbernaz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n]\0\0\3\0\3\0\0056\0\0\0'\2\1\0B\0\2\0029\0\2\0D\0\1\0\28calculate_commentstring&ts_context_commentstring.internal\frequireN\1\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0003\4\3\0=\4\5\3B\1\2\1K\0\1\0\rpre_hook\1\0\0\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/Comment.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/cmp-vsnip"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n€\1\0\0\5\0\6\1\n5\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0?\2\0\0=\1\5\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\2\0\0\21--stdin-filepath\1\0\2\nstdin\2\bexe\rprettier\5€€À™\4$\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\nstdin\1\bexe\vstyluaÃ\4\1\0\a\0\24\00053\0\0\0003\1\1\0006\2\2\0'\4\3\0B\2\2\0029\2\4\0025\4\5\0005\5\6\0004\6\3\0>\0\1\6=\6\a\0054\6\3\0>\0\1\6=\6\b\0054\6\3\0>\0\1\6=\6\t\0054\6\3\0>\0\1\6=\6\n\0054\6\3\0>\0\1\6=\6\v\0054\6\3\0>\0\1\6=\6\f\0054\6\3\0>\0\1\6=\6\r\0054\6\3\0>\0\1\6=\6\14\0054\6\3\0>\0\1\6=\6\15\0054\6\3\0>\0\1\6=\6\16\0054\6\3\0>\0\1\6=\6\17\0054\6\3\0>\1\1\6=\6\18\5=\5\19\4B\2\2\0016\2\20\0009\2\21\0029\2\22\2'\4\23\0+\5\2\0B\2\3\1K\0\1\0Å\1      augroup FormatAutogroup\n        autocmd!\n        autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.json,*.vue,*.html,*.css,*.scss,*.md,*.graphql,*.gql,*.lua FormatWrite\n      augroup END\n    \14nvim_exec\bapi\bvim\rfiletype\blua\bvue\rmarkdown\fgraphql\tscss\bcss\thtml\tjson\20javascriptreact\20typescriptreact\15typescript\15javascript\1\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0\0\0" },
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16settings/gl\frequire\0" },
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n½\4\0\0\5\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\2B\0\2\1K\0\1\0\19preview_config\1\0\1\vborder\tnone\nsigns\1\0\0\17changedelete\1\0\4\ttext\bâ–Ž\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\ttext\bâ–¶\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\ttext\bâ–¶\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\ttext\bâ–Ž\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\ttext\bâ–Ž\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nÒ\2\0\0\6\1\14\2-6\0\0\0009\0\1\0009\0\2\0B\0\1\2\b\0\0\0X\0#€6\0\0\0009\0\1\0009\0\3\0B\0\1\0029\0\4\0\b\0\1\0X\0\n€6\0\5\0'\2\6\0B\0\2\0029\0\a\0B\0\1\1-\0\0\0009\0\b\0'\2\t\0D\0\2\0X\0\21€6\0\0\0009\0\n\0009\0\v\0)\2\0\0+\3\1\0+\4\1\0004\5\0\0B\0\5\0016\0\5\0'\2\6\0B\0\2\0029\0\a\0B\0\1\1-\0\0\0009\0\b\0'\2\f\0D\0\2\0X\0\3€-\0\0\0009\0\r\0D\0\1\0K\0\1\0\0À\17autopairs_cr\15<c-n><c-y>\31nvim_select_popupmenu_item\bapi\n<c-y>\besc\22confirmCompletion\15completion\frequire\rselected\18complete_info\15pumvisible\afn\bvim\0þÿÿÿ\31ˆ\2\1\0\b\0\17\0\0276\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0004\4\0\0B\2\2\0016\2\4\0004\3\0\0=\3\5\0026\2\6\0009\2\a\2'\3\t\0=\3\b\0026\2\5\0003\3\v\0=\3\n\0029\2\f\1'\4\r\0'\5\14\0'\6\15\0005\a\16\0B\2\5\0012\0\0€K\0\1\0\1\0\1\texpr\2&v:lua.MUtils.completion_confirm()\t<CR>\6i\bmap\0\23completion_confirm\5\27completion_confirm_key\6g\bvim\vMUtils\a_G\nsetup\nutils\19nvim-autopairs\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nÐ\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2p\0\2\n\0\4\0\0156\2\0\0009\2\1\0029\2\2\0026\4\0\0009\4\1\0049\4\3\4\18\6\0\0+\a\2\0+\b\2\0+\t\2\0B\4\5\2\18\5\1\0+\6\2\0B\2\4\1K\0\1\0\27nvim_replace_termcodes\18nvim_feedkeys\bapi\bvim;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimó\1\0\1\5\3\t\1 -\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\5€-\1\0\0009\1\1\0015\3\2\0B\1\2\1X\1\21€6\1\3\0009\1\4\0019\1\5\1B\1\1\2\t\1\0\0X\1\5€-\1\1\0'\3\6\0'\4\a\0B\1\3\1X\1\n€-\1\2\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\b\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\2À\1À\rcomplete\5!<Plug>(vsnip-expand-or-jump)\20vsnip#available\afn\bvim\1\0\1\14preselect\2\21select_next_item\fvisible\2¨\1\0\0\4\2\a\1\21-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4€-\0\0\0009\0\1\0B\0\1\1X\0\v€6\0\2\0009\0\3\0009\0\4\0)\2ÿÿB\0\2\2\t\0\0\0X\0\4€-\0\1\0'\2\5\0'\3\6\0B\0\3\1K\0\1\0\0À\2À\5\28<Plug>(vsnip-jump-prev)\19vsnip#jumpable\afn\bvim\21select_prev_item\fvisible\2²\5\1\0\v\0,\0H6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0B\1\3\0016\1\2\0009\1\a\0016\2\2\0009\2\a\0029\2\b\2'\3\t\0&\2\3\2=\2\b\0016\1\2\0009\1\n\0015\2\f\0=\2\v\0016\1\2\0009\1\n\1)\2\3\0=\2\r\0013\1\14\0003\2\15\0009\3\16\0005\5\20\0004\6\4\0005\a\17\0>\a\1\0065\a\18\0>\a\2\0065\a\19\0>\a\3\6=\6\21\0055\6\23\0003\a\22\0=\a\24\6=\6\25\0055\6\28\0009\a\26\0009\a\27\aB\a\1\2=\a\29\0069\a\26\0009\a\30\aB\a\1\2=\a\31\0069\a\26\0009\a \a5\t#\0009\n!\0009\n\"\n=\n$\tB\a\2\2=\a%\0069\a\26\0003\t&\0005\n'\0B\a\3\2=\a(\0069\a\26\0003\t)\0005\n*\0B\a\3\2=\a+\6=\6\26\5B\3\2\0012\0\0€K\0\1\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\1\0\0\rcomplete\fmapping\fsnippet\vexpand\1\0\0\0\fsources\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\nsetup\0\0&completion_trigger_keyword_length\1\4\0\0\nexact\14substring\nfuzzy&completion_matching_strategy_list\6g\6c\14shortmess\6o\26menu,menuone,noselect\16completeopt\20nvim_set_option\bapi\bvim\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    after = { "nvim-autopairs" },
    loaded = true,
    only_config = true
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nž\3\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\26context_commentstring\1\0\2\19enable_autocmd\1\venable\2\fautotag\1\0\1\venable\2\14autopairs\1\0\1\venable\2\fmatchup\1\0\1\venable\2\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nž\3\0\0\a\0\20\0$6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\5\0006\4\0\0'\6\3\0B\4\2\0029\4\4\4=\4\6\0036\4\0\0'\6\a\0B\4\2\0029\4\b\0049\4\t\4=\4\n\0036\4\0\0'\6\a\0B\4\2\0029\4\v\0049\4\t\4=\4\f\3=\3\14\0025\3\16\0005\4\15\0=\4\17\3=\3\18\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\19\0'\2\17\0B\0\2\1K\0\1\0\19load_extension\15extensions\15fzy_native\1\0\0\1\0\2\25override_file_sorter\2\28override_generic_sorter\1\rdefaults\1\0\0\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\16file_sorter\1\0\0\19get_fzy_sorter\22telescope.sorters\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\ny\0\1\2\0\6\1\0159\1\0\0\a\1\1\0X\1\3€)\1\15\0L\1\2\0X\1\b€9\1\0\0\a\1\2\0X\1\5€6\1\3\0009\1\4\0019\1\5\1\24\1\0\1L\1\2\0K\0\1\0\fcolumns\6o\bvim\rvertical\15horizontal\14directionµæÌ™\19™³æþ\3…\2\1\0\4\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0024\3\0\0=\3\6\0026\3\a\0009\3\b\0039\3\t\3=\3\t\2B\0\2\1K\0\1\0\nshell\6o\bvim\20shade_filetypes\tsize\1\0\b\14direction\rvertical\18close_on_exit\2\17persist_size\2\20insert_mappings\2\20start_in_insert\2\20shade_terminals\1\17hide_numbers\2\17open_mapping\n<c-\\>\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/toggleterm.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vscode.nvim"] = {
    loaded = true,
    path = "/Users/malbernaz/.local/share/nvim/site/pack/packer/start/vscode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nž\3\0\0\a\0\20\0$6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\5\0006\4\0\0'\6\3\0B\4\2\0029\4\4\4=\4\6\0036\4\0\0'\6\a\0B\4\2\0029\4\b\0049\4\t\4=\4\n\0036\4\0\0'\6\a\0B\4\2\0029\4\v\0049\4\t\4=\4\f\3=\3\14\0025\3\16\0005\4\15\0=\4\17\3=\3\18\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\19\0'\2\17\0B\0\2\1K\0\1\0\19load_extension\15extensions\15fzy_native\1\0\0\1\0\2\25override_file_sorter\2\28override_generic_sorter\1\rdefaults\1\0\0\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\16file_sorter\1\0\0\19get_fzy_sorter\22telescope.sorters\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nÅ\n\0\0\5\1'\0l-\0\0\0009\0\0\0'\2\1\0'\3\2\0B\0\3\1-\0\0\0009\0\3\0'\2\4\0'\3\5\0'\4\6\0B\0\4\1-\0\0\0009\0\3\0'\2\4\0'\3\a\0'\4\b\0B\0\4\1-\0\0\0009\0\3\0'\2\4\0'\3\t\0'\4\n\0B\0\4\1-\0\0\0009\0\3\0'\2\4\0'\3\v\0'\4\f\0B\0\4\1-\0\0\0009\0\3\0'\2\4\0'\3\r\0'\4\14\0B\0\4\1-\0\0\0009\0\3\0'\2\4\0'\3\15\0'\4\16\0B\0\4\1-\0\0\0009\0\3\0'\2\4\0'\3\17\0'\4\18\0B\0\4\1-\0\0\0009\0\3\0'\2\4\0'\3\19\0'\4\20\0B\0\4\1-\0\0\0009\0\3\0'\2\4\0'\3\21\0'\4\22\0B\0\4\1-\0\0\0009\0\3\0'\2\4\0'\3\23\0'\4\24\0B\0\4\1-\0\0\0009\0\3\0'\2\4\0'\3\25\0'\4\26\0B\0\4\1-\0\0\0009\0\3\0'\2\4\0'\3\27\0'\4\28\0B\0\4\1-\0\0\0009\0\3\0'\2\4\0'\3\29\0'\4\30\0B\0\4\1-\0\0\0009\0\3\0'\2\4\0'\3\31\0'\4 \0B\0\4\1-\0\0\0009\0\3\0'\2\4\0'\3!\0'\4\"\0B\0\4\1-\0\0\0009\0\3\0'\2\4\0'\3#\0'\4$\0B\0\4\1-\0\0\0009\0\3\0'\2\4\0'\3%\0'\4&\0B\0\4\1K\0\1\0\2À*<cmd>lua vim.lsp.buf.formatting()<CR>\14<leader>f2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\14<leader>q0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\14<leader>e*<cmd>lua vim.lsp.buf.references()<CR>\agr+<cmd>lua vim.lsp.buf.code_action()<CR>\15<leader>ca&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\14<leader>DJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\15<leader>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\15<leader>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\15<leader>wa.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-s>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<cmd>lua vim.lsp.buf.hover()<CR>\6K*<cmd>lua vim.lsp.buf.definition()<CR>\agd+<cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\bmap\27v:lua:vim.lsp.omnifunc\romnifunc\bsetÚ\a\0\0\f\0031\1h6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0027\0\4\0'\0\5\0'\1\5\0006\2\0\0009\2\1\0029\2\6\2'\4\a\0B\2\2\2\t\2\0\0X\2\t€'\2\b\0006\3\4\0'\4\t\0&\0\4\2'\2\b\0006\3\4\0'\4\n\0&\1\4\2X\2\19€6\2\0\0009\2\1\0029\2\6\2'\4\v\0B\2\2\2\t\2\0\0X\2\t€'\2\f\0006\3\4\0'\4\t\0&\0\4\2'\2\f\0006\3\4\0'\4\r\0&\1\4\2X\2\3€6\2\14\0'\4\15\0B\2\2\1-\2\0\0009\2\16\0029\2\17\0025\4\20\0005\5\18\0>\1\1\5\18\6\0\0'\a\19\0&\6\a\6>\6\3\5=\5\21\4-\5\1\0009\5\22\0056\a\0\0009\a\23\a9\a\24\a9\a\25\aB\a\1\0A\5\0\2=\5\26\4-\5\2\0=\5\27\0045\5,\0005\6\31\0005\a\29\0005\b\28\0=\b\30\a=\a \0065\a!\0006\b\0\0009\b\"\b6\n#\0009\n$\n'\v%\0B\b\3\2=\b$\a=\a&\0065\a)\0004\b\0\b6\t\0\0009\t\1\t9\t\2\t'\v'\0B\t\2\2+\n\2\0<\n\t\b6\t\0\0009\t\1\t9\t\2\t'\v(\0B\t\2\2+\n\2\0<\n\t\b=\b*\a=\a+\6=\6-\0055\6.\0=\6/\5=\0050\4B\2\2\1K\0\1\0\0À\1À\4À\rsettings\14telemetry\1\0\1\venable\1\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\fruntime\6;\tpath\fpackage\nsplit\1\0\1\fversion\vLuaJIT\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\14on_attach\17capabilities\29make_client_capabilities\rprotocol\blsp\24update_capabilities\bcmd\1\0\0\14/main.lua\1\3\0\0\0\a-E\nsetup\16sumneko_lua#Unsupported system for sumneko\nprintD/.config/nvim/lua-language-server/bin/Linux/lua-language-server\v/home/\tunixD/.config/nvim/lua-language-server/bin/macOS/lua-language-server&/.config/nvim/lua-language-server\f/Users/\bmac\bhas\5\tUSER\n$USER\vexpand\afn\bvim\2y\0\0\b\0\t\0\0156\0\0\0009\0\1\0009\0\2\0009\0\3\0004\2\0\0005\3\4\0005\4\b\0006\5\0\0009\5\5\0059\5\6\5'\a\a\0B\5\2\2>\5\1\4B\0\4\1K\0\1\0\1\3\0\0\0\3\0\6$\tline\afn\1\3\0\0\3\0\3\0\21range_formatting\bbuf\blsp\bvim×\a\1\0\14\0,\0‚\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0025\3\4\0006\4\5\0\18\6\3\0B\4\2\4H\a\v€'\t\6\0\18\n\a\0&\t\n\t6\n\a\0009\n\b\n9\n\t\n\18\f\t\0005\r\n\0=\b\v\r=\t\f\rB\n\3\1F\a\3\3R\aó6\4\a\0009\4\r\0049\4\14\0046\5\a\0009\5\r\0059\5\16\0056\a\a\0009\a\r\a9\a\17\a9\a\18\a5\b\19\0B\5\3\2=\5\15\0043\4\20\0003\5\21\0\18\6\5\0B\6\1\0019\6\22\0009\6\23\0065\b\27\0009\t\24\0016\v\a\0009\v\r\v9\v\25\v9\v\26\vB\v\1\0A\t\0\2=\t\28\b=\4\29\bB\6\2\0019\6\30\0009\6\23\0065\b\31\0009\t\24\0016\v\a\0009\v\r\v9\v\25\v9\v\26\vB\v\1\0A\t\0\2=\t\28\b=\4\29\b5\t!\0004\n\3\0003\v \0>\v\1\n=\n\"\t=\t#\bB\6\2\0019\6$\0009\6\23\0065\b%\0009\t\24\0016\v\a\0009\v\r\v9\v\25\v9\v\26\vB\v\1\0A\t\0\2=\t\28\b=\4\29\bB\6\2\0019\6&\0009\6\23\0065\b'\0009\t\24\0016\v\a\0009\v\r\v9\v\25\v9\v\26\vB\v\1\0A\t\0\2=\t\28\b=\4\29\bB\6\2\0019\6(\0009\6\23\0065\b)\0009\t\24\0016\v\a\0009\v\r\v9\v\25\v9\v\26\vB\v\1\0A\t\0\2=\t\28\b=\4\29\bB\6\2\0019\6*\0009\6\23\0065\b+\0009\t\24\0016\v\a\0009\v\r\v9\v\25\v9\v\26\vB\v\1\0A\t\0\2=\t\28\b=\4\29\bB\6\2\0012\0\0€K\0\1\0\1\0\0\fgraphql\1\0\0\thtml\1\0\0\ncssls\1\0\0\veslint\rcommands\vFormat\1\0\0\0\1\0\0\vjsonls\14on_attach\17capabilities\1\0\0\29make_client_capabilities\rprotocol\24update_capabilities\nsetup\rtsserver\0\0\1\0\4\14underline\2\17virtual_text\1\21update_in_insert\1\nsigns\2\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\blsp\vtexthl\ttext\1\0\1\nnumhl\5\16sign_define\afn\bvim\23LspDiagnosticsSign\npairs\1\0\4\fWarning\bï”©\tHint\bï µ\nError\bï™™\16Information\bï‘‰\nutils\17cmp_nvim_lsp\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\n€\1\0\0\5\0\6\1\n5\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0?\2\0\0=\1\5\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\2\0\0\21--stdin-filepath\1\0\2\nstdin\2\bexe\rprettier\5€€À™\4$\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\nstdin\1\bexe\vstyluaÃ\4\1\0\a\0\24\00053\0\0\0003\1\1\0006\2\2\0'\4\3\0B\2\2\0029\2\4\0025\4\5\0005\5\6\0004\6\3\0>\0\1\6=\6\a\0054\6\3\0>\0\1\6=\6\b\0054\6\3\0>\0\1\6=\6\t\0054\6\3\0>\0\1\6=\6\n\0054\6\3\0>\0\1\6=\6\v\0054\6\3\0>\0\1\6=\6\f\0054\6\3\0>\0\1\6=\6\r\0054\6\3\0>\0\1\6=\6\14\0054\6\3\0>\0\1\6=\6\15\0054\6\3\0>\0\1\6=\6\16\0054\6\3\0>\0\1\6=\6\17\0054\6\3\0>\1\1\6=\6\18\5=\5\19\4B\2\2\0016\2\20\0009\2\21\0029\2\22\2'\4\23\0+\5\2\0B\2\3\1K\0\1\0Å\1      augroup FormatAutogroup\n        autocmd!\n        autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.json,*.vue,*.html,*.css,*.scss,*.md,*.graphql,*.gql,*.lua FormatWrite\n      augroup END\n    \14nvim_exec\bapi\bvim\rfiletype\blua\bvue\rmarkdown\fgraphql\tscss\bcss\thtml\tjson\20javascriptreact\20typescriptreact\15typescript\15javascript\1\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0\0\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16settings/gl\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n½\4\0\0\5\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\2B\0\2\1K\0\1\0\19preview_config\1\0\1\vborder\tnone\nsigns\1\0\0\17changedelete\1\0\4\ttext\bâ–Ž\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\ttext\bâ–¶\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\ttext\bâ–¶\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\ttext\bâ–Ž\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\ttext\bâ–Ž\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n]\0\0\3\0\3\0\0056\0\0\0'\2\1\0B\0\2\0029\0\2\0D\0\1\0\28calculate_commentstring&ts_context_commentstring.internal\frequireN\1\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0003\4\3\0=\4\5\3B\1\2\1K\0\1\0\rpre_hook\1\0\0\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\ny\0\1\2\0\6\1\0159\1\0\0\a\1\1\0X\1\3€)\1\15\0L\1\2\0X\1\b€9\1\0\0\a\1\2\0X\1\5€6\1\3\0009\1\4\0019\1\5\1\24\1\0\1L\1\2\0K\0\1\0\fcolumns\6o\bvim\rvertical\15horizontal\14directionµæÌ™\19™³æþ\3…\2\1\0\4\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0024\3\0\0=\3\6\0026\3\a\0009\3\b\0039\3\t\3=\3\t\2B\0\2\1K\0\1\0\nshell\6o\bvim\20shade_filetypes\tsize\1\0\b\14direction\rvertical\18close_on_exit\2\17persist_size\2\20insert_mappings\2\20start_in_insert\2\20shade_terminals\1\17hide_numbers\2\17open_mapping\n<c-\\>\0\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nž\3\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\26context_commentstring\1\0\2\19enable_autocmd\1\venable\2\fautotag\1\0\1\venable\2\14autopairs\1\0\1\venable\2\fmatchup\1\0\1\venable\2\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nÐ\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2p\0\2\n\0\4\0\0156\2\0\0009\2\1\0029\2\2\0026\4\0\0009\4\1\0049\4\3\4\18\6\0\0+\a\2\0+\b\2\0+\t\2\0B\4\5\2\18\5\1\0+\6\2\0B\2\4\1K\0\1\0\27nvim_replace_termcodes\18nvim_feedkeys\bapi\bvim;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimó\1\0\1\5\3\t\1 -\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\5€-\1\0\0009\1\1\0015\3\2\0B\1\2\1X\1\21€6\1\3\0009\1\4\0019\1\5\1B\1\1\2\t\1\0\0X\1\5€-\1\1\0'\3\6\0'\4\a\0B\1\3\1X\1\n€-\1\2\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\b\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\2À\1À\rcomplete\5!<Plug>(vsnip-expand-or-jump)\20vsnip#available\afn\bvim\1\0\1\14preselect\2\21select_next_item\fvisible\2¨\1\0\0\4\2\a\1\21-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4€-\0\0\0009\0\1\0B\0\1\1X\0\v€6\0\2\0009\0\3\0009\0\4\0)\2ÿÿB\0\2\2\t\0\0\0X\0\4€-\0\1\0'\2\5\0'\3\6\0B\0\3\1K\0\1\0\0À\2À\5\28<Plug>(vsnip-jump-prev)\19vsnip#jumpable\afn\bvim\21select_prev_item\fvisible\2²\5\1\0\v\0,\0H6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0B\1\3\0016\1\2\0009\1\a\0016\2\2\0009\2\a\0029\2\b\2'\3\t\0&\2\3\2=\2\b\0016\1\2\0009\1\n\0015\2\f\0=\2\v\0016\1\2\0009\1\n\1)\2\3\0=\2\r\0013\1\14\0003\2\15\0009\3\16\0005\5\20\0004\6\4\0005\a\17\0>\a\1\0065\a\18\0>\a\2\0065\a\19\0>\a\3\6=\6\21\0055\6\23\0003\a\22\0=\a\24\6=\6\25\0055\6\28\0009\a\26\0009\a\27\aB\a\1\2=\a\29\0069\a\26\0009\a\30\aB\a\1\2=\a\31\0069\a\26\0009\a \a5\t#\0009\n!\0009\n\"\n=\n$\tB\a\2\2=\a%\0069\a\26\0003\t&\0005\n'\0B\a\3\2=\a(\0069\a\26\0003\t)\0005\n*\0B\a\3\2=\a+\6=\6\26\5B\3\2\0012\0\0€K\0\1\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\1\0\0\rcomplete\fmapping\fsnippet\vexpand\1\0\0\0\fsources\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\nsetup\0\0&completion_trigger_keyword_length\1\4\0\0\nexact\14substring\nfuzzy&completion_matching_strategy_list\6g\6c\14shortmess\6o\26menu,menuone,noselect\16completeopt\20nvim_set_option\bapi\bvim\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
try_loadstring("\27LJ\2\nÒ\2\0\0\6\1\14\2-6\0\0\0009\0\1\0009\0\2\0B\0\1\2\b\0\0\0X\0#€6\0\0\0009\0\1\0009\0\3\0B\0\1\0029\0\4\0\b\0\1\0X\0\n€6\0\5\0'\2\6\0B\0\2\0029\0\a\0B\0\1\1-\0\0\0009\0\b\0'\2\t\0D\0\2\0X\0\21€6\0\0\0009\0\n\0009\0\v\0)\2\0\0+\3\1\0+\4\1\0004\5\0\0B\0\5\0016\0\5\0'\2\6\0B\0\2\0029\0\a\0B\0\1\1-\0\0\0009\0\b\0'\2\f\0D\0\2\0X\0\3€-\0\0\0009\0\r\0D\0\1\0K\0\1\0\0À\17autopairs_cr\15<c-n><c-y>\31nvim_select_popupmenu_item\bapi\n<c-y>\besc\22confirmCompletion\15completion\frequire\rselected\18complete_info\15pumvisible\afn\bvim\0þÿÿÿ\31ˆ\2\1\0\b\0\17\0\0276\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0004\4\0\0B\2\2\0016\2\4\0004\3\0\0=\3\5\0026\2\6\0009\2\a\2'\3\t\0=\3\b\0026\2\5\0003\3\v\0=\3\n\0029\2\f\1'\4\r\0'\5\14\0'\6\15\0005\a\16\0B\2\5\0012\0\0€K\0\1\0\1\0\1\texpr\2&v:lua.MUtils.completion_confirm()\t<CR>\6i\bmap\0\23completion_confirm\5\27completion_confirm_key\6g\bvim\vMUtils\a_G\nsetup\nutils\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")

time([[Sequenced loading]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
