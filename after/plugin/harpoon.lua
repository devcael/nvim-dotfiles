local mark = require("harpoon.mark")
local term = require("harpoon.term")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)


vim.keymap.set("n", "<C-b>", ui.nav_next, { noremap = true, silent = true })
