local plugin = require("notify")
local options = {}

plugin.setup(options)
vim.notify = plugin
