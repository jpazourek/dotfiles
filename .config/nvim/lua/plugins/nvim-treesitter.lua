local parsers = require("globals.treesitter_parsers")

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = "false",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install(parsers)
	end,
}
