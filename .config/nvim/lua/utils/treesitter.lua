local filetypes = require("globals.treesitter_filetypes")

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
	pattern = filetypes,
	callback = function(args)
		local ok, err = pcall(vim.treesitter.start, args.buf)

		if not ok then
			vim.notify(
				"Treesitter failed for " .. vim.bo[args.buf].filetype .. ": " .. tostring(err),
				vim.log.levels.WARN
			)

			return
		end

		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo.foldlevel = 99
	end,
})
