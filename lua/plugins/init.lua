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
}
