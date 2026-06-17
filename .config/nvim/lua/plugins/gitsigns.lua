return {
	{
		"lewis6991/gitsigns.nvim",
		---@module 'gitsigns'
		---@type Gitsigns.Config
		---@diagnostic disable-next-line: missing-fields
		opts = {},
		config = function(_, opts)
			require("gitsigns").setup(opts)
		end,
	},
}
