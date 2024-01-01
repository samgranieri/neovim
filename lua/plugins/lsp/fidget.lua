local plugin = require("fidget")
local options = {
  progress = {
    display = {
      done_icon = "",
      progress_icon = {
        pattern = "meter",
      },
    },
  },
--  align = {
--    bottom = true,
--  },
}

plugin.setup(options)

-- text = {
--  spinner = "zip",
--  done = "",
-- },
