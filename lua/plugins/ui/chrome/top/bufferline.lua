local plugin = require("bufferline")
local options = {
  options = {
    separator_style = "thin",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(_, _, diagnostics, _)
      local result = {}
      local symbols = { error = "", hint = "", warning = "", info = "" }
      for name, count in pairs(diagnostics) do
        if symbols[name] and count > 0 then
          table.insert(result, symbols[name] .. " " .. count)
        end
      end
      ---@diagnostic disable-next-line: cast-local-type
      result = table.concat(result, " ")
      return #result > 0 and result or ""
    end,
    mode = "buffers",
    offsets = {
      { filetype = "NvimTree", text = "פּ File Tree" },
      { filetype = "aerial", text = "Document Symbols" },
      { filetype = "packer", text = "Packer" },
    },
  },
  -- :help bufferline-highlights
  highlights = {
    buffer_selected = {
      italic = false,
    },
    indicator_selected = {
      fg = { attribute = "fg", highlight = "Function" },
      italic = false,
    },
  },
}

plugin.setup(options)
