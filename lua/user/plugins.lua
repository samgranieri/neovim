local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local install_plugins = false
local fn = vim.fn
local c = vim.cmd
if fn.empty(fn.glob(install_path)) > 0 then
  print("Installing packer...")
  local packer_url = "https://github.com/wbthomason/packer.nvim"
  fn.system({ "git", "clone", "--depth", "1", packer_url, install_path })
  print("Done.")

  c("packadd packer.nvim")
  install_plugins = true
end

local packer = require("packer")
packer.init({
  compile_on_sync = true,
  autoremove = true,
  auto_clean = true,
  display = {
    open_fn = function()
      return require("packer.util").float()
    end,
    working_sym = "",
    error_sym = "",
    done_sym = "",
    removed_sym = "ﮁ",
    moved_sym = "",
    header_sym = "—",
  },
})
packer.startup(function(use)
  -- Plugin manager
  use({ "wbthomason/packer.nvim" })

  -- Alignment
  use("vim-scripts/Align")

  -- -- Modular Config Reloader
  use({ "miversen33/import.nvim" })

  -- Utility Functions
  use({ "nvim-lua/plenary.nvim" })

  -- Colorscheme
  use({ "ishan9299/nvim-solarized-lua" })

  -- Icons
  use({ "nvim-tree/nvim-web-devicons" })

  -- Bottom UI Decorations
  use({
    "nvim-lualine/lualine.nvim",
    requires = {
      "miversen33/import.nvim",
    },
  })

  use("arkav/lualine-lsp-progress")

  -- TabBar UI Decorations
  use({ "akinsho/bufferline.nvim" })

  -- File Tree
  use({
    "nvim-tree/nvim-tree.lua"
  })

  -- Wildmenu
  use({
    "gelguy/wilder.nvim",
    requires = {
      "romgrk/fzy-lua-native",
    },
  })

  -- Fuzzy Finders
  use({
    "ibhagwan/fzf-lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
  })

  use({ "nvim-telescope/telescope.nvim" })
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  })

  -- TMUX
  use({
    "alexghergh/nvim-tmux-navigation",
    "camgraff/telescope-tmux.nvim",
    "andersevenrud/cmp-tmux",
  })

  -- Document Symbol Explorer
  use({ "stevearc/aerial.nvim" })

  -- Splash Screen
  use({ "goolord/alpha-nvim" })

  -- Keymap
  use({
    "folke/which-key.nvim",
    requires = {
      "ibhagwan/fzf-lua",
    },
  })

  -- Scrollbar
  use("petertriho/nvim-scrollbar")

  -- Code Folding
  use({
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async",
  })

  -- UI Notifications
  use({ "rcarriga/nvim-notify" })

  -- Git
  use({ "lewis6991/gitsigns.nvim" })
  use({ "tpope/vim-fugitive" })
  use({
    "neogitorg/neogit",
    requires = "nvim-lua/plenary.nvim",
  })

  -- Code Commenting
  use({ "numToStr/Comment.nvim" })

  -- Tim Pope is a great plugin author
  use({ "tpope/vim-rails" })
  use({ "tpope/vim-repeat" })
  -- use({ "tpope/vim-surround" })
  use({ "tpope/vim-projectionist" })
  use({ "tpope/vim-endwise" })

  -- Treesitter Syntax
  use({
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
  })

  -- Additional Syntax Plugins
  use("mustache/vim-mustache-handlebars")
  -- use({ "lukas-reineke/indent-blankline.nvim" })

  -- Code Completion
  use({
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
  })

  -- Code Snippets
  use({ "L3MON4D3/LuaSnip" })
  use({ "rafamadriz/friendly-snippets" })
  use({ "saadparwaiz1/cmp_luasnip" })

  -- Find and Replace
  use({ "windwp/nvim-spectre" })

  -- Language Server Protocol
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim",
    "jayp0521/mason-null-ls.nvim",
    "folke/neodev.nvim",
  })
  use({ "j-hui/fidget.nvim" })
  use("norcalli/nvim-colorizer.lua")

  use({
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
  })

  use("jghauser/mkdir.nvim")
  use("echasnovski/mini.nvim")
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup()
    end,
  })
  use("b0o/schemastore.nvim")
  use("wfxr/minimap.vim")
  use({
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  })
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  })
  -- nvim-autopaira
  use("lukas-reineke/indent-blankline.nvim")

  use({
    "https://codeberg.org/esensar/nvim-dev-container",
    requires = { "nvim-treesitter/nvim-treesitter" },
  })
  use {
    "wallpants/github-preview.nvim",
    tag="v1.16.1"
  }

  use("jparise/vim-graphql")
  -- use({ "elixir-tools/elixir-tools.nvim", tag = "stable", requires = { "nvim-lua/plenary.nvim" }})
  if install_plugins then
    packer.sync()
  end
end)

if install_plugins then
  print("==================================")
  print("    Plugins will be installed.")
  print("    After you press Enter")
  print("    Wait until Packer completes,")
  print("       then restart nvim")
  print("==================================")
end

local import_ok, _ = pcall(require, "import")
if import_ok then
  import("plugins.ui.startup.alpha")
  import("plugins.ui.colors.colorizer")
  import("plugins.ui.colors.colorscheme")
  import("plugins.cmp")
  import("plugins.comment")
  import("plugins.syntax.custom")
  require("plugins.lsp")
  -- import("plugins.lsp")
  import("plugins.lsp.fidget")
  import("plugins.lsp.keymaps")
  import("plugins.neodev")
  import("plugins.mini")
  import("plugins.neogit")
  import("plugins.ghm")
  import("plugins.nvim-web-devicons")
  import("plugins.syntax.snippets")
  import("plugins.syntax.treesitter")
  import("plugins.ui.commands.telescope")
  import("plugins.tmux_navigation")
  import("plugins.ui.chrome.bottom.lualine")
  import("plugins.ui.chrome.left.nvim-tree")
  import("plugins.ui.chrome.right.aerial")
  import("plugins.ui.chrome.right.minimap")
  import("plugins.ui.chrome.right.scrollbar")
  import("plugins.ui.chrome.right.spectre")
  import("plugins.ui.chrome.top.bufferline")
  import("plugins.ui.chrome.top.navic")
  import("plugins.ui.chrome.top.notify")
  import("plugins.ui.chrome.top.winbar")
  import("plugins.ui.code.folding.nvim-ufo")
  import("plugins.ui.code.indications.gitsigns")
  import("plugins.ui.commands.trouble")
  import("plugins.ui.commands.whichkey")
  import("plugins.ui.commands.wilder")
end
