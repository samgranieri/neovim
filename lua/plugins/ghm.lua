local gpreview = require("github-preview")
gpreview.setup({
	log_level ="verbose"
})
local fns = gpreview.fns
vim.keymap.set("n", "<leader>mpt", fns.toggle)
vim.keymap.set("n", "<leader>mps", fns.single_file_toggle)
vim.keymap.set("n", "<leader>mpd", fns.details_tags_toggle)

