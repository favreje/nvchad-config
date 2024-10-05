require "nvchad.options"

local opt = vim.opt


-- General Appearance
opt.cursorlineopt ='both' -- To enable cursorline!
opt.colorcolumn = "100" -- Add a right border
opt.wrap = false
opt.scrolloff = 6

-- Behavior
opt.iskeyword:append("-") -- Makes hyphenated words behave as a single word

-- Spell Checking
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Enable both absolute and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

