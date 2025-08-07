-- lua nvim termdebug enable
vim.cmd [[packadd termdebug]]

-- disable mouse
vim.opt.mouse = ""

-- miscellaneous config
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 300
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.foldmethod = 'syntax'
vim.opt.foldlevel=6
--vim.cmd.colorscheme('pop-punk')
vim.cmd.colorscheme('gruber-darker')

-- Highlight debugPC
vim.api.nvim_set_hl(0, "debugPC", {ctermbg = 20, bg = "#0000d7"})
vim.g.termdebug_wide = 1

-- Tab column
vim.cmd [[match ErrorMsg '\%>100v.\+']] -- Color characters exceeding 100 chars
vim.api.nvim_set_hl(0, "ColorColumn", {ctermbg = "blue"})
vim.api.nvim_set_hl(0, "Search2", {fg = "white", bg = "blue"})

-- Indentation
vim.cmd [[filetype plugin indent on]]
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.expandtab = false

-- Whitespace configuration
vim.g.better_whitespace_enabled = true
vim.g.show_spaces_that_precede_tabs = true
vim.opt.listchars = "eol:$,tab:>·,trail:~,extends:>,precedes:<,space:␣"

-- Highlight WordUnderCursor
vim.api.nvim_set_hl(0, "WordUnderCursor", {ctermfg = "white", ctermbg = "blue"})
vim.api.nvim_set_hl(0, "Search2", {ctermbg= "blue", ctermbg = "blue"})


-- Status line
vim.opt.laststatus = 2

-- Truncate long file names lua-fzf
require'fzf-lua'.fzf_opts = { ['--keep-right'] = '' }


