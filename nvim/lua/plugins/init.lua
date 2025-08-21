return {
	"ellisonleao/gruvbox.nvim",

	-- telescope
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' }
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

}