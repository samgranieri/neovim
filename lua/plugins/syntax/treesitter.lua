local plugin = require("nvim-treesitter.configs")
local options = {
  ignore_install = { "phpdoc" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },

  -- :help nvim-treesitter-textobjects-modules
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "css",
    "dockerfile",
    "eex",
    "elixir",
    "erlang",
    "go",
    "heex",
    "java",
    "javascript",
    "json",
    "jsonc",
    "lua",
    "make",
    "markdown",
    "perl",
    "php",
    "python",
    "rego",
    "ruby",
    "rust",
    "scss",
    "swift",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },
}
plugin.setup(options)
