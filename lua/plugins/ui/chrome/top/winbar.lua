local M = {}

local navic = require("nvim-navic")
local utils = require("utils")
M.winbar_filetype_exclude = {
  "help",
  "startify",
  "dashboard",
  "packer",
  "neogitstatus",
  "NvimTree",
  "Aerial",
  "aerial",
  "Trouble",
  "alpha",
  "lir",
  "Outline",
  "spectre_panel",
  "toggleterm",
}

---@diagnostic disable-next-line: unused-function, unused-local
local excludes = function()
  if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
    vim.opt_local.winbar = nil
    return true
  end
  return false
end

local function get_modified()
  if utils.get_buf_option("mod") then
    --   local mod = icons.git.Mod
    return "%t" .. "%*"
  end
  -- return "%#WinBarFilename#" .. "%t" .. "%*"
end

local function get_location()
  local location = navic.get_location()
  if not utils.is_empty(location) then
    return "" .. location .. ""
  end
  return ""
end

function M.get_winbar()
  -- Use lualine disable file types
  -- if excludes() then
  --   return ""
  -- end

  if navic.is_available() then
    return get_location()
  else
    return get_modified()
  end
end

return M
