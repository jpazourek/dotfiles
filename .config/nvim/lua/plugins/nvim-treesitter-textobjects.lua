return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	init = function()
		vim.g.no_plugin_maps = true
	end,
	opts = {
		select = {
			lookahead = true,
			selection_modes = {
				["@parameter.outer"] = "v",
				["@function.outer"] = "V",
				["@class.outer"] = "V",
			},
			include_surrounding_whitespace = false,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter-textobjects").setup(opts)
	end,
}
