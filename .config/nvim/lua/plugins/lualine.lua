local colors = require("globals.colors")

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = {
				normal = {
					a = { bg = colors.pink, fg = colors.dark_gray },
					b = { bg = colors.light_gray, fg = colors.pink },
					c = { bg = colors.gray, fg = colors.text_light },
				},
				insert = {
					a = { bg = colors.purple, fg = colors.dark_gray },
					b = { bg = colors.light_gray, fg = colors.purple },
				},
				command = {
					a = { bg = colors.light_blue, fg = colors.dark_gray },
					b = { bg = colors.light_gray, fg = colors.light_blue },
				},
				visual = {
					a = { bg = colors.dark_purple, fg = colors.dark_gray },
					b = { bg = colors.light_gray, fg = colors.dark_purple },
				},
				replace = {
					a = { bg = colors.red, fg = colors.dark_gray },
					b = { bg = colors.light_gray, fg = colors.red },
				},
				terminal = {
					a = { bg = colors.blue, fg = colors.dark_gray },
					b = { bg = colors.light_gray, fg = colors.blue },
				},
			},
			globalstatus = true,
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
	config = function(_, opts)
		require("lualine").setup(opts)
	end,
}
