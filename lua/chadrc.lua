-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "sweetpastel",

  hl_override = {
    Comment = { fg = "#617160" },
    ["@comment"] = { fg = "#617160" },
  },
}

M.mason = {
  pkgs = {
    "lua-language-server",
    "stylua",
    "html-lsp",
    "css-lsp",
    "prettier",
    "gopls",
    "pyright",
    "flake8",
    "mypy",
    "ruff",
    "black",
    "debugpy",
  },
}

return M
