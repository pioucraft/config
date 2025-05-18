-- Add custom paths to Lua's package.path
local config_path = vim.fn.stdpath('config') -- Get the standard configuration path for Neovim
package.path = package.path .. ";" .. config_path .. "/?.lua"        -- Add support for Lua files in the config directory
package.path = package.path .. ";" .. config_path .. "/?/init.lua"   -- Add support for folders with init.lua in the config directory

-- Load custom plugins configuration
require("nathan.plugins")

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

-- Enable LSP servers
vim.lsp.enable('luals')       -- Enable Lua language server
vim.lsp.enable("typescript")  -- Enable TypeScript language server
vim.lsp.enable("gopls")       -- Enable Go language server
vim.lsp.enable("html")        -- Enable HTML language server

-- Set colorscheme
vim.g.sonokai_style = 'andromeda' -- Set Sonokai theme style to 'andromeda'
vim.cmd("colorscheme sonokai")    -- Apply the Sonokai colorscheme

-- Load additional plugin configurations
require("nathan.after.plugins.autoclose")  -- Autoclose plugin configuration
require("nathan.after.plugins.telescope") -- Telescope plugin configuration
require("nathan.after.plugins.treesitter")-- Treesitter plugin configuration
require("nathan.after.plugins.harpoon")   -- Harpoon plugin configuration

-- Configure CopilotChat plugin
require("CopilotChat").setup {
  -- See Configuration section for options
}
