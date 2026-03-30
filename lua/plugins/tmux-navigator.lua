return {
    "christoomey/vim-tmux-navigator",
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,
    keys = {
        { "<A-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Tmux/Window left" },
        { "<A-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Tmux/Window down" },
        { "<A-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Tmux/Window up" },
        { "<A-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Tmux/Window right" },
    },
}
