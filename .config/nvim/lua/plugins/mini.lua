return {
	"nvim-mini/mini.nvim",
	config = function()
		require("mini.surround").setup()
		require("mini.comment").setup()
		require("mini.pairs").setup()
		require("mini.bufremove").setup()
	end,
}
