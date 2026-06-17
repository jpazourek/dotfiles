local custom_picker = require("utils.telescope_custom")
local nvim_version = vim.version().build

return {
	"folke/snacks.nvim",
	opts = {
		dashboard = {
			sections = {
				{
					text = {
						{
							"███╗   ██╗  ███████╗  ██████╗  ██╗   ██╗  ██╗  ███╗   ███╗\n",
							hl = "DashLogo1",
						},
						{
							"████╗  ██║  ██╔════╝ ██╔═══██╗ ██║   ██║  ██║  ████╗ ████║\n",
							hl = "DashLogo2",
						},
						{
							"██╔██╗ ██║  █████╗   ██║   ██║ ██║   ██║  ██║  ██╔████╔██║\n",
							hl = "DashLogo3",
						},
						{
							"██║╚██╗██║  ██╔══╝   ██║   ██║ ╚██╗ ██╔╝  ██║  ██║╚██╔╝██║\n",
							hl = "DashLogo4",
						},
						{
							"██║ ╚████║  ███████╗ ╚██████╔╝  ╚████╔╝   ██║  ██║ ╚═╝ ██║\n",
							hl = "DashLogo5",
						},
						{
							"╚═╝  ╚═══╝  ╚══════╝  ╚═════╝    ╚═══╝    ╚═╝  ╚═╝     ╚═╝\n",
							hl = "DashLogo6",
						},
						{
							"\n" .. nvim_version .. "\n\n",
							hl = "NvimVersion",
						},
						{
							"───────────────────────────────────────────────────────────────",
							hl = "DashLine",
						},
					},
					align = "center",
					padding = 1,
				},
				{ section = "keys", gap = 1, padding = 1 },
				{
					text = {
						{
							"───────────────────────────────────────────────────────────────",
							hl = "DashLine",
						},
					},
					align = "center",
					padding = 1,
				},
				{
					function()
						local stats = require("lazy").stats()
						local ms = math.floor(stats.startuptime)

						return {
							text = {
								{
									"Neovim loaded ",
									hl = "FooterText",
								},
								{
									stats.loaded .. "/" .. stats.count,
									hl = "FooterVar",
								},
								{
									" plugins in ",
									hl = "FooterText",
								},
								{
									ms .. "ms",
									hl = "FooterVar",
								},
							},
							align = "center",
						}
					end,
				},
			},
		},
	},
	config = function(_, opts)
		opts.dashboard.preset = opts.dashboard.preset or {}

		opts.dashboard.preset.keys = {
			{
				icon = " ",
				key = "e",
				desc = "New file",
				action = ":ene | startinsert",
			},
			{
				icon = " ",
				key = "f",
				desc = "Find file",
				action = ":cd $HOME | Telescope find_files",
			},
			{
				icon = " ",
				key = "r",
				desc = "Recent",
				action = ":Telescope oldfiles",
			},
			{
				icon = " ",
				key = "c",
				desc = "Config",
				action = function()
					custom_picker.config_picker()
				end,
			},
			{
				icon = " ",
				key = "p",
				desc = "Projects",
				action = function()
					custom_picker.project_picker()
				end,
			},
			{
				icon = "󰒲 ",
				key = "l",
				desc = "Lazy",
				action = ":Lazy",
			},
			{
				icon = "󰏖 ",
				key = "m",
				desc = "Mason",
				action = ":Mason",
			},
			{
				icon = " ",
				key = "q",
				desc = "Exit",
				action = ":qa",
			},
		}
		vim.api.nvim_set_hl(0, "DashLogo1", { fg = "#fb6389", bold = true })
		vim.api.nvim_set_hl(0, "DashLogo2", { fg = "#f864a0", bold = true })
		vim.api.nvim_set_hl(0, "DashLogo3", { fg = "#f069b6", bold = true })
		vim.api.nvim_set_hl(0, "DashLogo4", { fg = "#e470cb", bold = true })
		vim.api.nvim_set_hl(0, "DashLogo5", { fg = "#d379dd", bold = true })
		vim.api.nvim_set_hl(0, "DashLogo6", { fg = "#be83ec", bold = true })

		vim.api.nvim_set_hl(0, "NvimVersion", { fg = "#be83ec", bold = true })

		vim.api.nvim_set_hl(0, "DashLine", { fg = "#be83ec", bold = true })

		vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#fb6389", bold = true })
		vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#1e9ee6", bold = true })
		vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#fb6389", bold = true })

		vim.api.nvim_set_hl(0, "FooterText", { fg = "#1e9ee6", bold = true })
		vim.api.nvim_set_hl(0, "FooterVar", { fg = "#be83ec", bold = true })

		require("snacks").setup(opts)
	end,
}
