local plugin = require("nvim-tmux-navigation")
local options = {
  disable_when_zoomed = true, -- defaults to false
}

plugin.setup(options)

vim.keymap.set("n", "<c-h>", plugin.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<c-j>", plugin.NvimTmuxNavigateDown)
vim.keymap.set("n", "<c-k>", plugin.NvimTmuxNavigateUp)
vim.keymap.set("n", "<c-l>", plugin.NvimTmuxNavigateRight)
