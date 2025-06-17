require("config.lazy")

require("lazy").setup("plugins")

-- Set tab and indentation options
vim.o.tabstop = 4      -- Set the number of spaces a tab character represents
vim.o.softtabstop = 4  -- Set the number of spaces to insert when hitting <Tab>
vim.o.shiftwidth = 4   -- Set the number of spaces to use for each step of (auto)indent
vim.o.expandtab = true -- Use spaces instead of tabs

-- Enable line numbers
vim.wo.number = true          -- Show absolute line numbers
vim.wo.relativenumber = true  -- Show relative line numbers

-- Set leader key and key mappings
vim.g.mapleader = " " -- Set the leader key to space
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex) -- Open file explorer with <leader>ee
vim.keymap.set("n", "<leader>d", vim.diagnostic.goto_next) -- Go to the next diagnostic with <leader>e

-- Use system clipboard for copy-paste
vim.opt.clipboard = "unnamedplus" -- Use system clipboard as the default register
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true, silent = true }) -- Copy to system clipboard
vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true, silent = true }) -- Paste from system clipboard

-- Prevent 'd' from overwriting the default register
vim.api.nvim_set_keymap('n', 'd', '"_d', { noremap = true, silent = true }) -- Delete without affecting the default register
vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true, silent = true }) -- Same for visual mode

require("config.autoclose")
require("config.mason")
require("config.autotag")
