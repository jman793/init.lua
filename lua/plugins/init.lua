return {
	{ import = "plugins.custom.rust_config" },
	{ import = "plugins.custom.neotest" },
	{ import = "plugins.custom.dap" },
	{ import = "plugins.custom.lspsetup" },
	{ import = "plugins.custom.nvimcmp" },
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({})
		end,
		lazy = false,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		opts = function()
			return require("plugins.custom.null-ls")
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {
			columns = {
				"icon",
			},
			default_file_explorer = true,
			keymaps_help = {
				border = "rounded",
			},
			use_default_keymaps = true,
			view_options = {
				show_hidden = true,
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"folke/todo-comments.nvim",
		lazy = false,
	},
	{
		"mbbill/undotree",
		lazy = false,
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = false,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"python",
				"rust",
				"toml",
				"go",
				"gomod",
				"gowork",
				"gosum",
				"typescript",
				"javascript",
				"c",
				"cpp",
			},
		},
	},
}
