local group = vim.api.nvim_create_augroup("mapping_cmds", { clear = true })
vim.g.mapleader = " "
vim.g.localmapleader = " "
-- vim.keymap.set({'n', 'x', 'o'}, '<leader>h', '^')
-- vim.keymap.set({'n', 'x', 'o'}, '<leader>l', 'g_')
-- vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- Basic clipboard interaction
-- vim.keymap.set({'n', 'x'}, 'cp', '"+y')
-- vim.keymap.set({'n', 'x'}, 'cv', '"+p')

-- Delete text
-- vim.keymap.set({'n', 'x'}, 'x', '"_x')

-- Commands
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")
vim.keymap.set("n", "<leader>bq", "<cmd>bdelete<cr>")
vim.keymap.set("n", "<leader>bl", "<cmd>buffer #<cr>")

-- Navigate with Buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")

vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
-- LSP Keybindings
---
vim.api.nvim_create_autocmd("User", {
  pattern = "LspAttached",
  group = group,
  desc = "LSP actions",
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      -- local opts = { buffer = true }
      vim.keymap.set(mode, lhs, rhs)
    end

    -- You can search each function in the help page.
    -- For example :help vim.lsp.buf.hover()

    bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
    bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
    bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
    bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
    bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
    bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
    -- bufmap("n", "<C-K>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
    bufmap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")
    bufmap("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
    bufmap("x", "<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")
    bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
    bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
    bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
    bufmap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>")
    bufmap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>")
  end,
})
