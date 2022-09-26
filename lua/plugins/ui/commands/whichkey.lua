local plugin = require("which-key")
local trailspace = require("mini.trailspace")
local wk_conf = {
  layout = {
    align = "center",
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
  },
}
local wk_opts = {
  mode = "n", -- Normal mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}
local fzf = require("fzf-lua")
local wk_mappings = {
  ["F"] = {
    function()
      fzf.builtin()
    end,
    "Fuzzy find all the things!",
  },
  ["a"] = { "<cmd>Alpha<CR>", "Welcome Screen" },
  ["r"] = { "<cmd>source $MYVIMRC | PackerInstall<cr>", "Reload Config" },
  ["w"] = { "<cmd>update!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["c"] = { "<Cmd>bd!<Cr>", "Close current buffer" },
  b = {
    name = "Buffer",
    c = { "<Cmd>bd!<Cr>", "Close current buffer" },
    D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
  },
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    p = { "<cmd>PackerProfile<cr>", "Profile" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
  f = {
    name = " find",
    f = {
      function()
        fzf.files()
      end,
      "Find Files",
    },
    g = {
      name = " Git",
      f = {
        function()
          fzf.git_files()
        end,
        "Find Files",
      },
      s = {
        function()
          fzf.git_status()
        end,
        "Status",
      },
      S = {
        function()
          fzf.git_stash()
        end,
        "Stashes",
      },
      c = {
        function()
          fzf.git_commits()
        end,
        "Git commits",
      },
      b = {
        function()
          fzf.git_branches()
        end,
        "Git branches",
      },
      B = {
        function()
          fzf.git_bcommits()
        end,
        "Git bcommits",
      },
    },
    t = {
      function()
        fzf.live_grep()
      end,
      "Find Text",
    },
    l = {
      function()
        fzf.lgrep_curbuf()
      end,
      "find text in buffer",
    },
    r = {
      function()
        require("spectre").open()
      end,
      "Find and Replace text",
    },
    o = {
      function()
        fzf.oldfiles()
      end,
      "Find Recently opened files",
    },
    b = {
      function()
        fzf.buffers()
      end,
      "Find Buffers",
    },
    q = {
      function()
        fzf.quickfix()
      end,
      "Quickfix",
    },
  },
  g = {
    name = " Git",
    S = { "<cmd>Neogit<CR>", "Status" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
  },
  u = {
    name = "UI",
    t = {
      name = "Toggle",
      n = { "<cmd>set invnumber<cr>", "Numbers" },
      r = { "<cmd>set invrelativenumber<cr>", "Relative Number" },
      t = { "<cmd>TroubleToggle<cr>", "Trouble" },
      a = { "<cmd>AerialToggle<cr>", "Aerial" },
      m = { "<cmd>MinimapToggle<cr>", "MiniMap" },
      s = { "<cmd>ScrollBarToggle<cr>", "Scrollbar" },
    },
  },
  t = {
    name = " Telescope",
    m = { "<cmd>Telescope tmux windows<cr>", "Tmux windows" },
  },
  l = {
    name = "Code",
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
    d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
    i = { "<cmd>LspInfo<CR>", "Lsp Info" },
    f = { "<cmd>lua vim.lsp.buf.format({async = true})<CR>", "Format Document" },
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    q = { vim.diagnostic.setloclist, "Quickfix" },
    j = { vim.diagnostic.goto_next, "Next Diagnostic" },
    k = { vim.diagnostic.goto_prev, "Prev Diagnostic" },
    t = { trailspace.trim(), "Trim Whitespace" },
  },
}
plugin.register(wk_mappings, wk_opts)
plugin.setup(wk_conf)
