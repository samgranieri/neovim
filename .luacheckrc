---@diagnostic disable: lowercase-global
stds = {
	nvim = {
		globals = {
			vim = { fields = { "g" } },
			"import",
		},
		read_globals = {
			"vim",
			"join_paths",
			"get_runtime_dir",
			"get_config_dir",
			"get_cache_dir",
			"require_clean",
		},
	},
}
std = "lua51+nvim"
self = false
-- cache = true
exclude_files = {
	"plugin/packer_compiled.lua",
	".luacheckrc",
}
ignore = {
	"631",
	"212",
}
