local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end
-- local cmp_window = require "cmp.utils.window"
--
-- cmp_window.info_ = cmp_window.info
-- cmp_window.info = function(self)
--   local info = self:info_()
--   info.scrollable = false
--   return info
-- end
--
-- local options = {
--   window = {
--     completion = {
--       border = border "CmpBorder",
--       winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
--     },
--     documentation = {
--       border = border "CmpDocBorder",
--     },
--   },
vim.opt.completeopt = { "menu", "menuone", "noselect" }
local cmp = require("cmp")
local luasnip = require("luasnip")
local select_opts = { behavior = cmp.SelectBehavior.Select }
local options = {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "tmux" },
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "treesitter" },
    { name = "path" },
    { name = "luasnip" },
    { name = "cmp_tabnine" },
    { name = "nvim_lua" },
    { name = "buffer" },
    -- { name = "calc" },
    -- { name = "emoji" },
    -- { name = "crates" },
  },
  window = {
    completion = {
      border = border("CmpBorder"),
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
    },
    documentation = {
      border = border("CmpDocBorder"),
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, item)
      local source_names = {
        nvim_lsp = "(LSP)",
        -- emoji = "(Emoji)",
        path = "(Path)",
        -- calc = "(Calc)",
        cmp_tabnine = "(Tabnine)",
        vsnip = "(Snippet)",
        luasnip = "(Snippet)",
        buffer = "(Buffer)",
        -- tmux = "(TMUX)",
      }
      local menu_icon = {
        Class = " ",
        Color = " ",
        Constant = "ﲀ ",
        Constructor = " ",
        Enum = "練",
        EnumMember = " ",
        Event = " ",
        Field = " ",
        File = "",
        Folder = " ",
        Function = " ",
        Interface = "ﰮ ",
        Keyword = " ",
        Method = " ",
        Module = " ",
        Operator = "",
        Property = " ",
        Reference = " ",
        Snippet = " ",
        Struct = " ",
        Text = " ",
        TypeParameter = " ",
        Unit = "塞",
        Value = " ",
        Variable = " ",
      }
      item.kind = menu_icon[item.kind]
      item.menu = source_names[entry.source.name]
      return item
    end,
  },
  -- See :help cmp-mapping
  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
    ["<Down>"] = cmp.mapping.select_next_item(select_opts),

    ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
    ["<C-n>"] = cmp.mapping.select_next_item(select_opts),

    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),

    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),

    ["<C-d>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-b>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<Tab>"] = cmp.mapping(function(fallback)
      local col = vim.fn.col(".") - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
        ---@diagnostic disable-next-line: undefined-field
      elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        fallback()
      else
        cmp.complete()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
}
cmp.setup(options)
