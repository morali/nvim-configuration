-- Set leader key to backslash
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- General keymaps
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = "Exit terminal mode" })
vim.keymap.set({'n', 'i', 't'}, '<A-h>', '<C-\\><C-N><C-w>h', { desc = "Window left" })
vim.keymap.set({'n', 'i', 't'}, '<A-j>', '<C-\\><C-N><C-w>j', { desc = "Window down" })
vim.keymap.set({'n', 'i', 't'}, '<A-k>', '<C-\\><C-N><C-w>k', { desc = "Window up" })
vim.keymap.set({'n', 'i', 't'}, '<A-l>', '<C-\\><C-N><C-w>l', { desc = "Window right" })

vim.keymap.set({'n', 'x'}, 'K', '<nop>')

vim.keymap.set('n', '<leader>x', ':execute "set colorcolumn=" . (&colorcolumn == "" ? "100" : "")<CR>', { desc = "Toggle colorcolumn" })
vim.keymap.set("n", "<C-l>", ":nohl<CR><C-l>", { silent = true, desc = "Clear search highlight" })
vim.keymap.set("n", "<C-w>x", ":tabclose<CR>", { silent = true, desc = "Close tab" })
vim.keymap.set("n", "<C-w>c", ":tabnew<CR>", { silent = true, desc = "New tab" })

-- Vimdiff
vim.keymap.set("n", "<Leader>dp", "V:diffput<CR>", { silent = true, desc = "Diff put" })
vim.keymap.set("n", "<Leader>dg", "V:diffget<CR>", { silent = true, desc = "Diff get" })

-- BetterWhitespace
vim.keymap.set("n", "]w", ":NextTrailingWhitespace<CR>", { silent = true, desc = "Next trailing whitespace" })
vim.keymap.set("n", "[w", ":PrevTrailingWhitespace<CR>", { silent = true, desc = "Prev trailing whitespace" })
vim.keymap.set("n", "<F5>", ":set list!<CR>", { silent = true, desc = "Toggle listchars" })

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

-- Toggle Copilot completions
local copilot_enabled = true
local function toggle_copilot()
    copilot_enabled = not copilot_enabled
    if copilot_enabled then
        vim.cmd("Copilot enable")
        vim.notify("Copilot enabled")
    else
        vim.cmd("Copilot disable")
        vim.notify("Copilot disabled")
    end
end
vim.keymap.set('n', '<Leader>cp', toggle_copilot, { desc = "Toggle Copilot" })

-- Termdebug
-- vim.keymap.set('n', '<leader>d', ':Termdebug<CR>')
-- vim.keymap.set('n', '<leader>e', ':Evaluate<CR>')
-- vim.keymap.set('n', '<F8>', ':Break<CR>')
-- vim.keymap.set('n', '<leader><F8>', ':Clear<CR>')
-- vim.keymap.set('n', '<leader>db', ':Break<CR>')
-- vim.keymap.set('n', '<leader>dr', ':Clear<CR>')
-- vim.keymap.set('n', '<F9>', ':Finish<CR>')
-- vim.keymap.set('n', '<leader>ds', ':Step<CR>')
-- vim.keymap.set('n', '<F10>', ':Over<CR>')
-- vim.keymap.set('n', '<leader>dn', ':Over<CR>')
-- vim.keymap.set('n', '<F11>', ':Step<CR>')
-- vim.keymap.set('n', '<leader>df', ':Finish<CR>')
-- vim.keymap.set('n', '<F12>', ':Continue<CR>')
-- vim.keymap.set('n', '<leader>dc', ':Continue<CR>')

vim.keymap.set('n', '<leader>d', function() require('dap').continue() end, { desc = "Debug continue" })
vim.keymap.set('n', '<leader>e', function() require('dap').eval() end, { desc = "Debug eval" })
vim.keymap.set('n', '<F8>', function() require('dap').toggle_breakpoint() end, { desc = "Toggle breakpoint" })
vim.keymap.set('n', '<leader><F8>', function() require('dap').clear_breakpoints() end, { desc = "Clear breakpoints" })
vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end, { desc = "Toggle breakpoint" })
vim.keymap.set('n', '<leader>dr', function() require('dap').clear_breakpoints() end, { desc = "Clear breakpoints" })
vim.keymap.set('n', '<F9>', function() require('dap').terminate() end, { desc = "Debug terminate" })
vim.keymap.set('n', '<leader>ds', function() require('dap').step_into() end, { desc = "Step into" })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = "Step over" })
vim.keymap.set('n', '<leader>dn', function() require('dap').step_over() end, { desc = "Step over" })
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = "Step into" })
vim.keymap.set('n', '<leader>di', function() require('dap').step_into() end, { desc = "Step into" })
vim.keymap.set('n', '<leader>df', function() require('dap').terminate() end, { desc = "Debug terminate" })
vim.keymap.set('n', '<F12>', function() require('dap').continue() end, { desc = "Debug continue" })
vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end, { desc = "Debug continue" })

