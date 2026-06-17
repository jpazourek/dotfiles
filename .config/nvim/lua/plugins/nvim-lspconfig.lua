return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {},
		},
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{
			"j-hui/fidget.nvim",
			opts = {
				notification = {
					window = {
						avoid = { "NvimTree" },
					},
				},
			},
		},
		"saghen/blink.cmp",
	},
	opts = {
		servers = {
			jdtls = {},
			ts_ls = {},
			eslint = {},
			html = {},
			cssls = {},
			jsonls = {},
			tailwindcss = {},
			bashls = {},
			tombi = {},
			fish_lsp = {},
			emmet_language_server = {},
			lua_ls = {
				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if
							path ~= vim.fn.stdpath("config")
							and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
						then
							return
						end
					end

					---@diagnostic disable-next-line
					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							version = "LuaJIT",
							path = { "lua/?.lua", "lua/?/init.lua" },
						},
						workspace = {
							checkThirdParty = false,
							library = vim.tbl_extend("force", vim.api.nvim_get_runtime_file("", true), {
								"${3rd}/luv/library",
								"${3rd}/busted/library",
							}),
						},
					})
				end,
				settings = {
					Lua = {},
				},
			},
		},
	},
	config = function(_, opts)
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		local servers = opts.servers

		local tools = {
			"stylua",
			"prettier",
			"google-java-format",
			"xmlformatter",
			"eslint_d",
			"checkstyle",
		}

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, tools)

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		for name, server in pairs(servers) do
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			vim.lsp.config(name, server)
			vim.lsp.enable(name)
		end
	end,
}
