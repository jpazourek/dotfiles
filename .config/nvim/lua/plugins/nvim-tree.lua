return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	--- @module 'nvim-tree'
	--- @type nvim_tree.config
	opts = {
		view = { width = 35 },
		renderer = {
			icons = {
				show = {
					git = true,
					folder = true,
					file = true,
					folder_arrow = true,
				},
			},
			indent_markers = {
				enable = true,
			},
			highlight_git = "name",
			highlight_opened_files = "name",
		},
		filters = {
			dotfiles = false,
			git_ignored = true,
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
		},
	},
	config = function(_, opts)
		require("nvim-tree").setup(opts)
	end,
}
