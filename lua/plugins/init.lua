return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "vim-treesitter/nvim-treesitter",
    url = "git@github.com:nvim-treesitter/nvim-treesitter.git",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "html",
        "lua",
        "luadoc",
        "markdown",
        "toml",
        "printf",
        "vim",
        "vimdoc",
        "yaml",
        "cmake",
        "csv",
        "go",
        "javascript",
        "json",
        "make",
        "python",
        "regex",
        "c",
        "sql",
      },
    },
  },

  -- Auto Configuration
  {
    "nvimtools/none-ls.nvim",
    ft = "go",
    opts = function()
      return require "configs.null-ls"
    end,
  },

  -- nvim-surround plugin
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  -- Change autocompletion behavior to accept a selection with <C-i>, and to return tab and shift-
  -- tab to their original fallback behavior
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require "cmp"
      return {
        mapping = {
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-i>"] = cmp.mapping.confirm { select = true },
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-e>"] = cmp.mapping.close(),
        },
        completion = {
          completeopt = "menu,menuone,noselect",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "nvim_lua" },
          { name = "path" },
        },
      }
    end,
  },
}
