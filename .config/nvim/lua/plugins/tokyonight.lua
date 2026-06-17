local local_colors = require("globals.colors")

return {
	"folke/tokyonight.nvim",
	priority = 1000,
	--- @module 'tokyonight'
	--- @type tokyonight.Config
	--- @diagnostic disable-next-line: missing-fields
	opts = {
		style = "night",
		transparent = false,
		styles = {
			comments = { italic = false },
			keywords = { italic = false },
		},

		on_highlights = function(hl, colors)
			hl.NvimTreeNormal = { fg = local_colors.text_light, bg = local_colors.dark_gray }
			hl.NvimTreeNormalNC = { fg = local_colors.text_light, bg = local_colors.dark_gray }
			hl.NvimTreeFolderIcon = { fg = local_colors.purple }
			hl.NvimTreeFolderName = { fg = local_colors.purple }
			hl.NvimTreeOpenedFolderName = { fg = local_colors.purple }
			hl.NvimTreeEmptyFolderName = { fg = local_colors.purple }
			hl.NvimTreeRootFolder = { fg = local_colors.blue }
		end,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd.colorscheme("tokyonight-night")
	end,
}
