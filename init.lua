local plugin_path = "plugin.";
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

-- Color Scheme Settings
vim.cmd.colorscheme("catppuccin")
vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})


