local plugin = require("lualine")
require("import")

local winbar = require("plugins.ui.chrome.top.winbar")

local diff = {
  "diff",
  colored = true, -- Displays a colored diff status if set to true
  diff_color = {
    -- Same color values as the general color option can be used here.
    added = "DiffAdd", -- Changes the diff's added color
    modified = "DiffChange", -- Changes the diff's modified color
    removed = "DiffDelete", -- Changes the diff's removed color you
  },
  symbols = { added = " ", modified = " ", removed = " " }, -- Changes the symbols used by the diff.
  source = nil, -- A function that works as a data source for diff.
  -- It must return a table as such:
  --   { added = add_count, modified = modified_count, removed = removed_count }
  -- or nil on failure. count <= 0 won't be displayed.
}

local branch = { "branch", icon = "" }
local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.o.columns > 100
  end,
}
local colors = {
  bg = "#202328",
  blue = "#51afef",
  cyan = "#008080",
  darkblue = "#081633",
  fg = "#bbc2cf",
  green = "#98be65",
  magenta = "#c678dd",
  orange = "#FF8800",
  purple = "#c678dd",
  red = "#ec5f67",
  violet = "#a9a1e1",
  yellow = "#ECBE7B",
}
local treesitter = {
  function()
    return ""
  end,
  color = function()
    local buf = vim.api.nvim_get_current_buf()
    local ts = vim.treesitter.highlighter.active[buf]
    return { fg = ts and not vim.tbl_isempty(ts) and colors.green or colors.red }
  end,
  cond = conditions.hide_in_width,
}
local diagnostics = {
  "diagnostics",

  -- Table of diagnostic sources, available sources are:
  --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
  -- or a function that returns a table as such:
  --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
  sources = { "nvim_lsp", "nvim_diagnostic", "coc" },

  -- Displays diagnostics for the defined severity types
  sections = { "error", "warn", "info", "hint" },

  symbols = { error = " ", warn = " ", info = " ", hint = " " },
  colored = true, -- Displays diagnostics status in color if set to true.
  update_in_insert = false, -- Update diagnostics in insert mode.
  always_visible = false, -- Show diagnostics even if there are none.
}

local lsp = {
  -- Lsp server name .
  function()
    local msg = "No Active Lsp"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = " ",
  color = { gui = "bold" },
}
local options = {
  options = {
    icons_enabled = true,
    theme = "solarized_dark",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = { "alpha", "NvimTree" },
      winbar = {
        "help",
        "startify",
        "minimap",
        "dashboard",
        "packer",
        "neogitstatus",
        "NvimTree",
        "aerial",
        "Aerial",
        "Trouble",
        "alpha",
        "lir",
        "Outline",
        "spectre_panel",
        "toggleterm",
      },
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 500,
      tabline = 500,
      winbar = 500,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { branch },
    lualine_c = { diff },
    lualine_x = { lsp, "encoding" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {"man", "fzf", "aerial", "quickfix" },
  winbar = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = { diagnostics, "import", winbar.get_winbar },
    lualine_x = { "filetype" }, --, treesitter }, --, diagnostics }, --, lsp }, --branch },
    lualine_y = {},
    lualine_z = { treesitter },
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = { "filename" },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}
plugin.setup(options)
