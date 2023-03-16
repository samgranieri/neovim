local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local lazy = require("lazy")
local plugins = {
  {
    "ishan9299/nvim-solarized-lua",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme solarized")
      vim.cmd("hi SignColumn ctermfg=145 ctermbg=23 guifg=#839496 guibg=#073642")
      vim.cmd("hi NvimTreeFolderIcon guifg=#258bd2 ctermbg=none")
      vim.cmd("hi TSComment cterm=bold,italic")
      vim.cmd("hi CustomAlpha guifg=#586e75 ctermfg=102")
      vim.cmd("hi CBBlue guifg=#02B3E3")
      vim.cmd("hi NvimTreeIndentMarker guifg=#3f444a")
      vim.cmd("hi IndentBlankLineChar guifg=#3f444a")
    end,
  },
  {
    "alexghergh/nvim-tmux-navigation",
    depenencies = {
      "camgraff/telescope-tmux.nvim",
      "andersevenrud/cmp-tmux",
    },
    config = function()
      local plugin = require("nvim-tmux-navigation")
      local options = {
        disable_when_zoomed = true, -- defaults to false
      }
      plugin.setup(options)
      vim.keymap.set("n", "<c-h>", plugin.NvimTmuxNavigateLeft)
      vim.keymap.set("n", "<c-j>", plugin.NvimTmuxNavigateDown)
      vim.keymap.set("n", "<c-k>", plugin.NvimTmuxNavigateUp)
      vim.keymap.set("n", "<c-l>", plugin.NvimTmuxNavigateRight)
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
  },
  { "akinsho/bufferline.nvim" },
  {
    "SmiteshP/nvim-navic",
    dependencies = { "neovim/nvim-lspconfig" },
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "ibhagwan/fzf-lua",
  },
  { "goolord/alpha-nvim" },
  { "nvim-lua/plenary.nvim" },
  { "gelguy/wilder.nvim", dependencies = {
    "romgrk/fzy-lua-native",
  } },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
    },
  },
  { "rcarriga/nvim-notify" }
}
local opts = {}
lazy.setup(plugins, opts)
require("plugins.cmp")
require("plugins.ui.chrome.bottom.lualine")
require("plugins.ui.chrome.left.nvim-tree")
require("plugins.ui.chrome.top.bufferline")
require("plugins.ui.chrome.top.notify")
require("plugins.ui.commands.wilder")
require("plugins.ui.startup.alpha")
