local plugin = require("telescope")
---
-- Telescope
---

local themes = require("telescope.themes")
local options = {
  defaults = themes.get_ivy(),
}
plugin.setup(options)
plugin.load_extension("fzf")
plugin.load_extension("tmux")
