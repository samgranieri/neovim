local mason = require("mason")
local mason_opts = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "",
      package_pending = "",
      package_uninstalled = "",
    },
  },
}

mason.setup(mason_opts)

local lsp_opts = {
  ensure_installed = {
    "bashls",
    "dockerls",
    "elixirls",
    "clangd",
    "jsonls",
    "marksman",
    "solargraph",
    "lua_ls",
    "vimls",
    "yamlls",
    "tsserver",
  },
  automatic_installation = true,
}
local lsp = require("mason-lspconfig")

lsp.setup(lsp_opts)

local function on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")
--   -- Configure key mappings
  require("plugins.lsp.keymaps").setup(client, bufnr)
--   --
--   -- -- Configure highlighting
  -- require("config.lsp.highlighter").setup(client, bufnr)
--   --
--   -- -- Configure formatting
  -- require("config.lsp.null-ls.formatters").setup(client, bufnr)
--
--   -- tagfunc
  if client.server_capabilities.definitionProvider then
    vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
  end
--
--   -- aerial.nvim
--
--   -- nvim-navic
  if client.server_capabilities.documentSymbolProvider then
    local navic = require("nvim-navic")
    navic.attach(client, bufnr)
  end
end
--
local lsp_defaults = {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 1000,
  },
}
--
local lspconfig = require("lspconfig")
local windowconfig = require("lspconfig.ui.windows")
windowconfig.default_options.border = "rounded"
-- --
-- @diagnostic disable-next-line: missing-parameter
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
--
lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, lsp_defaults)
local handlers = {
  -- lspconfig.clangd.setup({}),
  lspconfig.elixirls.setup({}),
  lspconfig.eslint.setup({}),
  lspconfig.marksman.setup({}),
  lspconfig.jsonls.setup({
    settings = {
      json = {
        schemas = require("schemastore").json.schemas({}),
        validate = { enable = true },
      },
    },
  }),
  lspconfig.solargraph.setup({}),
  lspconfig.rust_analyzer.setup({}),
  lspconfig.lua_ls.setup({
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          path = runtime_path,
        },

        diagnostics = {
          globals = { "vim" },
        },
        hint = {
          enable = true,
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = { enable = false },
      },
    },
  }),
  -- lspconfig.tsserver.setup({}),
  lspconfig.yamlls.setup({
    settings = {
      schemaStore = {
        enable = true,
      },
    },
  }),
}
lsp.setup_handlers(handlers)
-- --
local null_ls = require("null-ls")
local null_ls_opts = {
  debounce = 1000,
  default_timeout = 10000,
}
-- --
local mason_null_ls = require("mason-null-ls")
local mason_null_ls_opts = {
  debug = true,
  ensure_installed = {
    "actionlint",
    "clang_format",
    "cpplint",
    "eslint",
    "hadolint",
    "jq",
    "luacheck",
    "mix",
    "prettierd",
    "rubocop",
    "selene",
    "shellcheck",
    "shellharden",
    "sqlfluff",
    "stylua",
    "tflint",
    "xmllint",
    "yamlfmt",
    "yamllint",
  },
  automatic_installation = false,
}
local builtins = null_ls.builtins
local code_actions = builtins.code_actions
local diagnostics = builtins.diagnostics
local formatting = builtins.formatting
--
local null_ls_handlers = {
  null_ls.register(code_actions.gitsigns),
  null_ls.register(diagnostics.actionlint),
  null_ls.register(diagnostics.credo),
  null_ls.register(diagnostics.eslint),
  null_ls.register(diagnostics.hadolint),
  null_ls.register(diagnostics.sqlfluff.with({
    extra_args = { "--dialect", "postgres", "--config", "/Users/sgranieri/.config/nvim/.sqlfluff" },
  })),
  null_ls.register(diagnostics.shellcheck),
  null_ls.register(diagnostics.jsonlint),
  null_ls.register(diagnostics.yamllint.with({
    args = {
      "--format",
      "parsable",
      "--config-file",
      "/Users/sgranieri/.config/nvim/.yamllint",
      "-",
    },
  })),
  null_ls.register(formatting.jq),
  null_ls.register(formatting.mix),
  null_ls.register(formatting.prettierd),
  null_ls.register(formatting.sqlfluff.with({
    extra_args = { "--dialect", "postgres", "--config", "/Users/sgranieri/.config/nvim/.sqlfluff" },
  })),
  null_ls.register(formatting.stylua),
  null_ls.register(formatting.shellharden),
  null_ls.register(formatting.yamlfmt.with({
    args = { "-", "--conf", "/Users/sgranieri/.config/nvim/.yamlfmt" },
  }))
  
  -- null_ls.register(diagnostics.cpplint),
    -- null_ls.register(null_ls.builtins.formatting.rubocop.with({
  --   command = "bundle",
  --   args = {
  --     "rubocop",
  --     "exec",
  --     "-f",
  --     "--auto-correct",
  --     "quiet",
  --     "--stderr",
  --     "--stdin",
  --     "$FILENAME",
  --   },
  -- })),

  -- null_ls.register(formatting.xmllint),
  -- null_ls.register(formatting.clang_format),
  -- null_ls.register(null_ls.builtins.diagnostics.rubocop.with({
  --   command = "bundle",
  --   args = { "exec", "rubocop", "-f", "json", "--force-exclusion", "--stdin", "$FILENAME" },
  -- })),
}
mason_null_ls.setup(mason_null_ls_opts, null_ls_handlers) --mason_null_ls_opts)
-- mason_null_ls.setup_handlers(null_ls_handlers)

import("plugins.lsp.handlers", function(lsp_plugin_handlers)
  lsp_plugin_handlers.setup()
end)

local lua_dev = require("neodev")
lua_dev.setup({})
null_ls.setup(null_ls_opts)
