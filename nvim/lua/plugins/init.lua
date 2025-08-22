return {
	"ellisonleao/gruvbox.nvim",

	-- telescope
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		'nvim-telescope/telescope-file-browser.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- file tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
	},

	-- lsp stuff
	{
		"neovim/nvim-lspconfig", tag = 'v2.4.0',
	},

	-- auto completion
	{
		'hrsh7th/cmp-nvim-lsp',
		'saadparwaiz1/cmp_luasnip',
		'L3MON4D3/LuaSnip',
		'rafamadriz/friendly-snippets',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',

		-- snippets
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip',
	},

	-- mason
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			'williamboman/mason.nvim', tag = "v2.0.1"
		},
	},

	-- status bar
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	-- top bar
	{
		'nvim-tree/nvim-web-devicons',
		'lewis6991/gitsigns.nvim',
		'romgrk/barbar.nvim',
	},

	-- dashboard
	{
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		dependencies = { {'nvim-tree/nvim-web-devicons'}},
		config = function()
			require("config.dashboard")
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},

}