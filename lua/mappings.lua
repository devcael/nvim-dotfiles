
vim.g.mapleader = " " -- LeaderKey

-- Mapeamento para Ctrl + e para executar o comando :Ex e abrir o explorador de arquivos
vim.api.nvim_set_keymap('n', '<leader>e', ':Ex<CR>', { noremap = true, silent = true })

