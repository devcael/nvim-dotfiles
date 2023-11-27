local plugin_path = "plugin.";
local commands_path = "commands.";
require(commands_path .. "commands")
require(plugin_path .. "packer")
require(plugin_path .. "setup")
require(plugin_path .. "mappings")

vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')
vim.o.smartcase = true
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.autoindent = true
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.wo.number = true
vim.wo.relativenumber = true

-- SetUp Plugins
-- Set ColorScheme
require('theme')
require('mappings')

vim.api.nvim_set_keymap('x', '<leader>p', "\"_dP", { noremap = true, silent = true })
