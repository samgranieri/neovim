local group = vim.api.nvim_create_augroup("user_cmds", { clear = true })
local utils = require("utils")
local ts, trailspace = pcall(require, "mini.trailspace")

vim.api.nvim_create_user_command("ReloadConfig", function()
  vim.cmd("source $MYVIMRC | PackerInstall")
  utils.info("Reloaded Config", "NEOVIM")
end, {})

vim.api.nvim_create_user_command("Format", function()
  vim.lsp.buf.format()
  if ts then
    trailspace.trim()
  end
end, {})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight on yank",
  group = group,
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help", "man" },
  group = group,
  command = "nnoremap <buffer> q <cmd>quit<cr>",
})
