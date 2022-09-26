local wilder_plugin = require("wilder")
local wilder_options = { modes = { ":", "/", "?" } }
wilder_plugin.setup(wilder_options)

wilder_plugin.set_option("use_python_remote_plugin", 0)
wilder_plugin.set_option("pipeline", {
  wilder_plugin.branch(
    wilder_plugin.cmdline_pipeline({
      fuzzy = 1,
      fuzzy_filter = wilder_plugin.lua_fzy_filter(),
    }),
    wilder_plugin.vim_search_pipeline()
  ),
})

wilder_plugin.set_option(
  "renderer",
  wilder_plugin.popupmenu_renderer(
  -- wilder_plugin.popupmenu_palette_theme({
  --   border = "rounded",
  --   max_height = "50%", -- max height of the palette
  --   min_height = 0, -- set to the same as 'max_height' for a fixed height window
  --   prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
  --   reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
  --   left = { " ", wilder_plugin.popupmenu_devicons() },
  --   right = { " ", wilder_plugin.popupmenu_scrollbar() },
  --   highlighter = {
  --     wilder_plugin.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
  --     wilder_plugin.lua_fzy_highlighter(), -- requires fzy-lua-native vim wilder_plugin found
  --   },
  --
  --   highlights = {
  --     border = "Normal", -- highlight to use for the border
  --     accent = wilder_plugin.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#268bd2" } }),
  --   },
  -- }),

    wilder_plugin.popupmenu_border_theme({
      highlighter = {
        wilder_plugin.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
        wilder_plugin.lua_fzy_highlighter(), -- requires fzy-lua-native vim wilder_plugin found
      },

      highlights = {
        border = "Normal", -- highlight to use for the border
        accent = wilder_plugin.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#268bd2" } }),
      },
      -- 'single', 'double', 'rounded' or 'solid'
      -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
      border = "rounded",
      left = { " ", wilder_plugin.popupmenu_devicons() },
      right = { " ", wilder_plugin.popupmenu_scrollbar() },
    })
  )
)
