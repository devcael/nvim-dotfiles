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
-- Color Scheme Settings
vim.cmd.colorscheme("rigel")

-- Selecione os grupos de destaque dos números e faça-os transparentes
function tornarTransparente()
  vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
  -- SignComumn é a coluna onde ficam os números de linhas
  vim.cmd([[hi SignColumn guibg=NONE ctermbg=NONE]])
  vim.cmd([[hi VertSplit guibg=NONE ctermbg=NONE]])
  -- vim.cmd([[hi StatusLine guibg=NONE ctermbg=NONE]])
  -- vim.cmd([[hi StatusLineNC guibg=NONE ctermbg=NONE]])
  vim.cmd([[hi FoldColumn guibg=NONE ctermbg=NONE]])
  vim.cmd([[hi LineNr guibg=NONE ctermbg=NONE]])
  vim.cmd([[hi CursorLineNr guibg=NONE ctermbg=NONE]])
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

tornarTransparente();


vim.api.nvim_set_hl(0, "MyPMenu", { bg = "#c70d0f", fg = "Red" })
vim.api.nvim_set_hl(0, "MyPmenuSel", { bg = "#c70d0f", fg = "Black", bold = true })


vim.api.nvim_set_option("clipboard", "unnamed")
vim.api.nvim_set_keymap('x', '<leader>p', "\"_dP", { noremap = true, silent = true })
