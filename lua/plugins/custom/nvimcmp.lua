return {
	"hrsh7th/nvim-cmp",
	dependencies = { "supermaven-inc/supermaven-nvim", "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },
	opts = function(_, opts)
		table.insert(opts.sources, 1, { name = "supermaven", priority = 100000 })
		table.insert(opts.sources, 1, { name = "nvim_lsp", priority = 2 })
	end,
}
