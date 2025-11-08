-- Just handling LSP and conform setup, that way its all together
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"stevearc/conform.nvim",
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

		local formatters = {
			"stylua",
			"rustfmt",
			"goimports",
			"gofumpt",
			"clang-format",
			"reorder-python-imports",
			"prettier",
		}

		local combine_servers = function(servers, formatters)
			local combined = {}
			for _, server in ipairs(servers) do
				table.insert(combined, server)
			end
			for _, formatter in ipairs(formatters) do
				table.insert(combined, formatter)
			end
			return combined
		end

		local combined = combine_servers(servers, formatters)
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = combined,
		})
		local conformOptions = {
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
				go = { "goimports", "gofumpt" },
				c = { "clang-format" },
				python = { "reorder-python-imports" },
				typescript = { "prettier" },
				javascript = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		}

		require("conform").setup(conformOptions)

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
