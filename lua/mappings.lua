require "nvchad.mappings"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Use the old Themes Display
map("n", "<leader>th", "<cmd> Telescope themes  <cr>")

-- Remap Escape alternative
map("i", "kj", "<ESC>", opts)
map("v", "<C-m>", "<ESC>", opts)
map("n", "<C-m>", ":nohlsearch<CR>", opts)

-- Source the neovim configuration file
map("n", "<leader>so", ":source ~/.config/nvim/init.lua<CR>", opts)

-- Window Management
map("n", "<leader>vs", ":vsplit<CR>", opts) -- split vertically
map("n", "<leader>hs", ":split<CR>", opts) -- split horizontally

-- Buffer Navigation
map("n", "<M-n>", ":bn<CR>", opts) -- navigate to next buffer
map("n", "<M-m>", ":bp<CR>", opts) -- navigate to previous buffer

-- Toggle Spellcheck
map("n", "<leader>sp", ":setlocal spell!<CR>", opts) -- split horizontally

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down
map("v", "<C-J>", ":m .+1<CR>==gv", opts)
map("v", "<C-K>", ":m .-2<CR>==gv", opts)
