return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				-- servers configured below in nvim-lspconfig; installed on startup if missing
				ensure_installed = { "ts_ls", "html", "lua_ls" },
				automatic_installation = true,
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		-- pinned: v2.x requires Nvim 0.11.3+, this machine runs 0.10
		version = "v1.8.0",
		lazy = false,
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover docs" })
		end,
	},
}
