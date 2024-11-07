vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- packer
	use("wbthomason/packer.nvim")

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- lsp
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {

			-- LSP Support
			{ "neovim/nvim-lspconfig" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "folke/neodev.nvim" },
		},
	})

	-- mason
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	})

	-- Shortcut reminder
	use("folke/which-key.nvim")

	-- Undo tree
	use("mbbill/undotree")

	-- Tabs
	use("nvim-tree/nvim-web-devicons") -- OPTIONAL: for file icons
	use("lewis6991/gitsigns.nvim") -- OPTIONAL: for git status
	use("romgrk/barbar.nvim")

	-- Theme
	use("folke/tokyonight.nvim")

	-- Status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	use("numToStr/Comment.nvim")

	-- TODO comments
	use({
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	})

	-- Tmux navigation
	use({
		"christoomey/vim-tmux-navigator",
	})

	-- Formatting
	use({
		"stevearc/conform.nvim",
	})

	-- Linting
	use({
		"mfussenegger/nvim-lint",
	})

	-- Autopairs - Auto closes parenthesis, brackets, quotes...
	use({
		"windwp/nvim-autopairs",
	})
end)
