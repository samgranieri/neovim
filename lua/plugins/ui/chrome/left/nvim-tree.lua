local plugin = require("nvim-tree")
local options = {
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  view = {
    adaptive_size = true,
  },
  renderer = {
    full_name = false,
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    dotfiles = true
  },
  hijack_cursor = false,
  on_attach = function(bufnr)
    local bufmap = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- :help nvim-tree.api
    local api = require("nvim-tree.api")
    bufmap("L", api.node.open.edit, "Expand folder or go to file")
    bufmap("H", api.node.navigate.parent_close, "Close parent folder")
    bufmap("h", api.tree.toggle_hidden_filter, "Toggle hidden files")
    bufmap("i", api.tree.toggle_gitignore_filter, "Toggle ignored files")
  end,
}

plugin.setup(options)

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
