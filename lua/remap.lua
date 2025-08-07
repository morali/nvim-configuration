-- Keybindings for debugging
vim.keymap.set('n', '<leader>d', ':Termdebug<CR>')
vim.keymap.set('n', '<leader>e', ':Evaluate<CR>')
vim.keymap.set('n', '<F8>', ':Break<CR>')
vim.keymap.set('n', '<leader><F8>', ':Clear<CR>')
vim.keymap.set('n', '<leader>db', ':Break<CR>')
vim.keymap.set('n', '<leader>dr', ':Clear<CR>')
vim.keymap.set('n', '<F9>', ':Finish<CR>')
vim.keymap.set('n', '<leader>ds', ':Step<CR>')
vim.keymap.set('n', '<F10>', ':Over<CR>')
vim.keymap.set('n', '<leader>dn', ':Over<CR>')
vim.keymap.set('n', '<F11>', ':Step<CR>')
vim.keymap.set('n', '<leader>df', ':Finish<CR>')
vim.keymap.set('n', '<F12>', ':Continue<CR>')
vim.keymap.set('n', '<leader>dc', ':Continue<CR>')

-- Escape to normal mode in terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Move around windows with Alt + h,j,k,l
vim.keymap.set('t', '<A-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set('t', '<A-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set('t', '<A-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set('t', '<A-l>', '<C-\\><C-N><C-w>l')
vim.keymap.set('i', '<A-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set('i', '<A-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set('i', '<A-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set('i', '<A-l>', '<C-\\><C-N><C-w>l')
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')

-- Disable K key
vim.keymap.set('n', 'K', '<nop>')
vim.keymap.set('x', 'K', '<nop>')

-- Yank to TMUX buffer
vim.keymap.set('v', '<leader>y', ':Tyank<CR>')

-- Show 100 character limit
vim.keymap.set('n', '<leader>x', ':execute "set colorcolumn=" . (&colorcolumn == "" ? "100" : "")<CR>')

-- Aerial
vim.keymap.set('n', '<leader>a', ':AerialToggle<CR>')

-- NERDTree keybindings
vim.keymap.set('n', '<F3>', ':NERDTreeFind<CR>')
vim.keymap.set('n', '<F4>', ':NERDTreeToggle<CR>')

-- Hotkeys mapping
vim.keymap.set("n", "<C-p>", ":FzfLua files<CR>", { silent = true })
vim.keymap.set("n", "<Leader>rg", ":FzfLua grep<CR>", { silent = true })
vim.keymap.set("n", "<Leader>]", ":FzfLua grep_cword<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gl", ":FzfLua lines<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gt", ":FzfLua tabs<CR>", { silent = true })
vim.keymap.set("n", "<Leader>pp", ":Page<CR>", { silent = true })
vim.keymap.set("n", "<Leader>b", ":FzfLua buffers<CR>", { silent = true })
vim.keymap.set("n", "<Leader>p", ":set paste!<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":nohl<CR><C-l>", { silent = true })
vim.keymap.set("n", "<C-w>x", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "<C-w>c", ":tabnew<CR>", { silent = true })


-- Vimdiff
vim.keymap.set("n", "<Leader>dp", "V:diffput<CR>", { silent = true })
vim.keymap.set("n", "<Leader>dg", "V:diffget<CR>", { silent = true })

-- LSP mappings
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", { silent = true })
vim.keymap.set("n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true })
vim.keymap.set("n", "<c-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true })
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", { silent = true })
vim.keymap.set("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { silent = true })
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { silent = true })
vim.keymap.set("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>lr", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", { silent = true })
vim.keymap.set("x", "<Leader>lr", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", { silent = true })


-- BetterWhitespace
vim.keymap.set("n", "]w", ":NextTrailingWhitespace<CR>", { silent = true })
vim.keymap.set("n", "[w", ":PrevTrailingWhitespace<CR>", { silent = true })
vim.keymap.set("n", "<F5>", ":set list!<CR>", { silent = true })

-- Set up a key mapping for :Linediff command
vim.api.nvim_set_keymap('v', '<leader>ld', ':Linediff<CR>', { noremap = true, silent = true })

-- Setup key mapping for osc52 copy 
vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, {expr = true})
vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)
