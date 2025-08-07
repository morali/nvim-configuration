require('nvim-treesitter.configs').setup {
	ensure_installed = { 
		'vim',
		'javascript', 
		'typescript',
		'css',
		'html',
		'json',
		'lua', 
		'cpp',
		'c',
		'python',
		'matlab',
		'bash',
		'verilog',
		'groovy',
		'dockerfile',
		'vimdoc',
	},

    auto_install = false,
		sync_install = false,

		highlight = { 
			enable = true ,
			additional_vim_regex_highlighting = false,
		},
    indent = { enable = true },
}

-- require'treesitter-context'.setup{
--   enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
--   max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
--   min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
--   line_numbers = true,
--   multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
--   trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
--   mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
--   -- Separator between context and content. Should be a single character string, like '-'.
--   -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
--   separator = nil,
--   zindex = 20, -- The Z-index of the context window
--   on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
-- }

require'nvim-treesitter.configs'.setup {
  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = { query = "@class.outer", desc = "Next class start" },
        --
        -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
        ["]o"] = "@loop.*",
        -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
        --
        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
      -- Below will go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      -- Make it even more gradual by adding multiple queries and regex.
      goto_next = {
        ["]d"] = "@conditional.outer",
      },
      goto_previous = {
        ["[d"] = "@conditional.outer",
      }
    },
  },
}

require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  multiwindow = false, -- Enable multiwindow support.
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to show for a single context
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

-- return {
--   {
--     "folke/which-key.nvim",
--     opts = {
--       spec = {
--         { "<BS>", desc = "Decrement Selection", mode = "x" },
--         { "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
--       },
--     },
--   },
-- 
--   -- Treesitter is a new parser generator tool that we can
--   -- use in Neovim to power faster and more accurate
--   -- syntax highlighting.
--   {
--     "nvim-treesitter/nvim-treesitter",
--     version = false, -- last release is way too old and doesn't work on Windows
--     build = ":TSUpdate",
--     event = { "LazyFile", "VeryLazy" },
--     lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
--     init = function(plugin)
--       -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
--       -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
--       -- no longer trigger the **nvim-treesitter** module to be loaded in time.
--       -- Luckily, the only things that those plugins need are the custom queries, which we make available
--       -- during startup.
--       require("lazy.core.loader").add_to_rtp(plugin)
--       require("nvim-treesitter.query_predicates")
--     end,
--     cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
--     keys = {
--       { "<c-space>", desc = "Increment Selection" },
--       { "<bs>", desc = "Decrement Selection", mode = "x" },
--     },
--     opts_extend = { "ensure_installed" },
--     ---@type TSConfig
--     ---@diagnostic disable-next-line: missing-fields
--     opts = {
--       highlight = { enable = true },
--       indent = { enable = true },
--       ensure_installed = {
--         "bash",
--         "c",
--         "diff",
--         "html",
--         "javascript",
--         "jsdoc",
--         "json",
--         "jsonc",
--         "lua",
--         "luadoc",
--         "luap",
--         "markdown",
--         "markdown_inline",
--         "printf",
--         "python",
--         "query",
--         "regex",
--         "toml",
--         "tsx",
--         "typescript",
--         "vim",
--         "vimdoc",
--         "xml",
--         "yaml",
--       },
--       incremental_selection = {
--         enable = true,
--         keymaps = {
--           init_selection = "<C-space>",
--           node_incremental = "<C-space>",
--           scope_incremental = false,
--           node_decremental = "<bs>",
--         },
--       },
--       textobjects = {
--         move = {
--           enable = true,
--           goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
--           goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
--           goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
--           goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
--         },
--       },
--     },
--     ---@param opts TSConfig
--     config = function(_, opts)
--       if type(opts.ensure_installed) == "table" then
--         opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
--       end
--       require("nvim-treesitter.configs").setup(opts)
--     end,
--   },
-- 
--   {
--     "nvim-treesitter/nvim-treesitter-textobjects",
--     event = "VeryLazy",
--     enabled = true,
--     config = function()
--       -- If treesitter is already loaded, we need to run config again for textobjects
--       if LazyVim.is_loaded("nvim-treesitter") then
--         local opts = LazyVim.opts("nvim-treesitter")
--         require("nvim-treesitter.configs").setup({ textobjects = opts.textobjects })
--       end
-- 
--       -- When in diff mode, we want to use the default
--       -- vim text objects c & C instead of the treesitter ones.
--       local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
--       local configs = require("nvim-treesitter.configs")
--       for name, fn in pairs(move) do
--         if name:find("goto") == 1 then
--           move[name] = function(q, ...)
--             if vim.wo.diff then
--               local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
--               for key, query in pairs(config or {}) do
--                 if q == query and key:find("[%]%[][cC]") then
--                   vim.cmd("normal! " .. key)
--                   return
--                 end
--               end
--             end
--             return fn(q, ...)
--           end
--         end
--       end
--     end,
--   },
-- 
--   -- Automatically add closing tags for HTML and JSX
--   {
--     "windwp/nvim-ts-autotag",
--     event = "LazyFile",
--     opts = {},
--   },
-- }
