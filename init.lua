-- unload and reload packages
local load = function(mod)
  package.loaded[mod] = nil

  require(mod)
end
load("utils")
load("user.settings")
load("user.commands")
load("user.keymaps")
load("user.plugins")
