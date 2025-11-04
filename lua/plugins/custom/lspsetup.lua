return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	lazy = false,
	config = function()
		local servers = {
			"basedpyright",
			"ruff",
			"clangd",
			"lua_ls",
			"jsonls",
			"dockerls",
			"yamlls",
			"neocmake",
			"markdown_oxide",
			"taplo",
			"html",
			"cssls",
			"rust_analyzer",
			"ts_ls",
			"bashls",
			"gopls",
		}

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = servers,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		-- capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		-- Hardcodeed configs for servers

		-- typescript-language-server
		vim.lsp.config("typescript-language-server", {
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
		})

		vim.lsp.enable(servers)
	end,
}
