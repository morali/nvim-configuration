-- Set leader key to backslash
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- General keymaps
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set({'n', 'i', 't'}, '<A-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set({'n', 'i', 't'}, '<A-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set({'n', 'i', 't'}, '<A-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set({'n', 'i', 't'}, '<A-l>', '<C-\\><C-N><C-w>l')

vim.keymap.set({'n', 'x'}, 'K', '<nop>')

vim.keymap.set('n', '<leader>x', ':execute "set colorcolumn=" . (&colorcolumn == "" ? "100" : "")<CR>')
vim.keymap.set("n", "<C-l>", ":nohl<CR><C-l>", { silent = true })
vim.keymap.set("n", "<C-w>x", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "<C-w>c", ":tabnew<CR>", { silent = true })

-- Vimdiff
vim.keymap.set("n", "<Leader>dp", "V:diffput<CR>", { silent = true })
vim.keymap.set("n", "<Leader>dg", "V:diffget<CR>", { silent = true })

-- BetterWhitespace
vim.keymap.set("n", "]w", ":NextTrailingWhitespace<CR>", { silent = true })
vim.keymap.set("n", "[w", ":PrevTrailingWhitespace<CR>", { silent = true })
vim.keymap.set("n", "<F5>", ":set list!<CR>", { silent = true })

-- Toggle Quickfix Window
local function toggle_quickfix()
  local windows = vim.fn.getwininfo()
  for _, win in pairs(windows) do
    if win["quickfix"] == 1 then
      vim.cmd.cclose()
      return
    end
  end
  vim.cmd.copen()
end
vim.keymap.set('n', '<Leader>q', toggle_quickfix, { desc = "Toggle Quickfix Window" })

-- Termdebug
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
