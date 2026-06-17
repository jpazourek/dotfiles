return {
	"folke/which-key.nvim",
	event = "VimEnter",
	---@module 'which-key'
	---@type wk.Opts
	---@diagnostic disable-next-line: missing-fields
	opts = {
		delay = 0,
		icons = { mappings = false },
		layout = {
			height = { min = 4, max = 25 },
			width = { min = 20, max = 50 },
			spacing = 3,
			allign = "left",
		},
		spec = {
			{ "<leader>s", group = "[s]earch", mode = { "n", "v" } },
			{ "<leader>g", group = "[g]it", mode = { "n", "v" } },
			{ "<leader>f", group = "[f]iles" },
			{ "<leader>b", group = "[b]uffers" },
			{ "<leader>c", group = "[c]ode" },
			{ "<leader>w", group = "[w]indows" },
			{ "<leader>l", group = "[l]sp Actions", mode = { "n" } },
		},
	},
	config = function(_, opts)
		require("which-key").setup(opts)
	end,
}
