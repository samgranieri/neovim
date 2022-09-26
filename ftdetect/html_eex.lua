vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.html.heex",
  command = "set filetype=heex",
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.html.leex",
  command = "set filetype=html_eex",
})
