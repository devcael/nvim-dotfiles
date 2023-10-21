vim.opt.termguicolors = true

local bufferLine = require("bufferLine")


-- Goto Next Buffer
vim.keymap.set('n', '<PageUp>', function()
  bufferLine.cycle(-1);
end)

-- Goto Previuos Buffer
vim.keymap.set('n', '<PageDown>', function()
  bufferLine.cycle(1);
end)

-- Close With Pick
vim.keymap.set(
  "n",
  "<leader>bc",
  function ()
    bufferLine.close_with_pick();
  end
)

bufferLine.setup{}
