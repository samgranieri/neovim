local icons = require("nvim-web-devicons")
local conf = {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    ["Brewfile"] = {
      icon = "🍺",
      color = "#f28e1c",
      cterm_color = "52",
      name = "Brewfile",
    },
    ["Brewfile.lock.json"] = {
      icon = "",
      color = "#f28e1c",
      cterm_color = "52",
      name = "Brewfile.lock",
    },
    ["Rakefile"] = {
      icon = "",
      color = "#701516",
      cterm_color = "52",
      name = "Rakefile",
    },
    ["Gemfile"] = {
      icon = "",
      color = "#701516",
      cterm_color = "52",
      name = "Gemfile",
    },
    ["Guardfile"] = {
      icon = "",
      color = "#701516",
      cterm_color = "52",
      name = "Guardfile",
    },
    ["Gemfile.lock"] = {
      icon = "",
      color = "#701516",
      cterm_color = "52",
      name = "Gemfile.lock",
    },
    [".rspec"] = {
      icon = "",
      color = "#701516",
      cterm_color = "52",
      name = ".rspec",
    },
  },
  -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true,
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true,
}

icons.setup(conf)
