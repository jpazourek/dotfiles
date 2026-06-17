vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
	callback = function(event)
		local buf = event.buf
		local builtin = require("telescope.builtin")
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		-- LSP navigation
		vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { buffer = buf, desc = "[l]sp goto [r]eferences" })
		vim.keymap.set(
			"n",
			"<leader>li",
			builtin.lsp_implementations,
			{ buffer = buf, desc = "[l]sp goto [i]mplementation" }
		)
		vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions, { buffer = buf, desc = "[l]sp goto [d]efinition" })
		vim.keymap.set(
			"n",
			"<leader>lod",
			builtin.lsp_document_symbols,
			{ buffer = buf, desc = "[l]sp [o]pen [d]ocument symbols" }
		)
		vim.keymap.set(
			"n",
			"<leader>low",
			builtin.lsp_dynamic_workspace_symbols,
			{ buffer = buf, desc = "[l]sp [o]pen [w]orkspace symbols" }
		)
		vim.keymap.set(
			"n",
			"<leader>lt",
			builtin.lsp_type_definitions,
			{ buffer = buf, desc = "[l]sp goto [t]ype definition" }
		)
		vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, { buffer = buf, desc = "[l]sp goto [D]eclaration" })

		-- Code actions
		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = buf, desc = "[c]ode [r]ename" })
		vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = buf, desc = "[c]ode [a]ction" })

		-- Inlay hints
		if client and client:supports_method("textDocument/inlayHint", event.buf) then
			vim.keymap.set("n", "<leader>ch", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }), { bufnr = buf })
			end, { buffer = buf, desc = "[c]ode inlay [h]ints toggle" })
		end

		if client and client:supports_method("textDocument/documentHighlight", event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup("user-lsp-highlight", { clear = false })

			-- Hightlights references when cursor is moved to them
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			-- Clears the highlighting
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			-- Clears hightlighting and detaches buffer
			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("user-lsp-detach", { clear = true }),
				callback = function(detach_event)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({
						group = highlight_augroup,
						buffer = detach_event.buf,
					})
				end,
			})
		end
	end,
})
