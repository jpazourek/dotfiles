return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	--- @module "ibl"
	--- @type ibl.config
	opts = {
		scope = {
			enabled = false,
		},
		exclude = {
			filetypes = {
				"dashboard",
			},
		},
	},
	config = function(_, opts)
		require("ibl").setup(opts)
	end,
}
