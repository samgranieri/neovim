local plugin = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = require("plugins.ui.startup.logos.neovim_banner").logo()

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl_shortcut = "CustomAlpha"
  b.opts.hl = "CustomAlpha"
  -- b.opts.hl = "CBBlue"
  -- b.opts.hl_shortcut = "CBBlue"
  return b
end

dashboard.section.buttons.opts["spacing"] = 0
dashboard.section.buttons.val = {
  button("q", "  Quit Neovim", ":qa<CR>"),
  button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  button("c", "  Configuration", ":e $MYVIMRC <CR>"),
  button("t", "פּ  File Tree", ":NvimTreeToggle<cr>"),
  button("u", "  Update Plugins", ":PackerSync<cr>"),
  button("m", "  Mason", ":Mason<cr>"),
  button("f", "  Find ", "<cmd>lua require('fzf-lua').builtin()<CR>")
}
-- local function footer()
--   -- Number of plugins
--   local total_plugins = #vim.tbl_keys(packer_plugins)
--   local datetime = os.date("%d-%m-%Y  %H:%M:%S")
--   local plugins_text = "\t" .. total_plugins .. " plugins  " .. datetime
--
--   return plugins_text
-- end

local function configure_additional_autocmds()
  local group = "_dashboard_settings"
  vim.api.nvim_create_augroup(group, {})
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "alpha",
    ---@diagnostic disable-next-line: undefined-field
    command = "set showtabline=0 | autocmd BufLeave <buffer> set showtabline=" .. vim.opt.showtabline._value,
  })
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "alpha",
    ---@diagnostic disable-next-line: undefined-field
    command = "set laststatus=0 | autocmd BufUnload <buffer> set laststatus=" .. vim.opt.laststatus._value,
  })
end

-- dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "CustomAlpha"
dashboard.section.header.opts.hl = "CustomAlpha"
-- dashboard.section.header.opts.hl = 'CBBlue'
-- dashboard.section.footer.opts.hl = 'CBBlue'
-- dashboard.section.buttons.opts.hl = "Comment"
-- dashboard.section.buttons.opts.hl_shortcut = "Comment"
dashboard.opts.opts.noautocmd = false

plugin.setup(dashboard.opts)
configure_additional_autocmds()
