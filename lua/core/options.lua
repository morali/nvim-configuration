-- General options
vim.opt.mouse = ""
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.cursorline = true
vim.opt.expandtab = false
vim.opt.foldlevel = 6
vim.opt.foldmethod = "syntax"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.listchars = "eol:$,tab:>·,trail:~,extends:>,precedes:<,space:␣"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 8
vim.opt.smartcase = true
vim.opt.tabstop = 8
vim.opt.updatetime = 300

-- Global variables
vim.g.termdebug_wide = 1
vim.g.better_whitespace_enabled = true
vim.g.show_spaces_that_precede_tabs = true

-- Set highlight groups
vim.api.nvim_set_hl(0, "debugPC", { ctermbg = 20, bg = "#0000d7" })
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = "blue" })
vim.api.nvim_set_hl(0, "Search2", { fg = "white", bg = "blue" })
vim.api.nvim_set_hl(0, "WordUnderCursor", { ctermfg = "white", ctermbg = "blue" })

-- Enable termdebug
vim.cmd [[packadd termdebug]]

-- Match characters exceeding 100 columns
vim.cmd [[match ErrorMsg '\%>100v.\+']]

-- Enable filetype plugins and indentation
vim.cmd [[filetype plugin indent on]]
