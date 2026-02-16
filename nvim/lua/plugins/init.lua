return {

	-- color themes
	{
		"zaldih/themery.nvim", -- theme picker
		"ellisonleao/gruvbox.nvim",
		'projekt0n/github-nvim-theme',
		'catppuccin/nvim',
		"vague2k/vague.nvim",
		"navarasu/onedark.nvim",
		"Mofiqul/vscode.nvim",
		"askfiy/visual_studio_code",
	},

	{
		"vhyrro/luarocks.nvim",
		priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
		config = true,
	},

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

	  {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},

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

		'onsails/lspkind-nvim', -- pictograms

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
		-- 'romgrk/barbar.nvim',
	},

	--
	-- git integration
	--
	{
		'sindrets/diffview.nvim',
		'lewis6991/gitsigns.nvim',
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

	-- hint for leader key
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

	--
	-- autoclosing brackets
	--
	{
		-- 'windwp/nvim-autopairs',
		-- 'windwp/nvim-ts-autotag',
	},

	{
		"nvim-mini/mini.pairs",
		event = "VeryLazy",
		opts = {
			modes = { insert = true, command = true, terminal = false },
			-- skip autopair when next character is one of these
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			-- skip autopair when the cursor is inside these treesitter nodes
			skip_ts = { "string" },
			-- skip autopair when next character is closing pair
			-- and there are more closing pairs than opening pairs
			skip_unbalanced = true,
			-- better deal with markdown code blocks
			markdown = true,
		},
		-- config = function(_, opts)
		-- 	LazyVim.mini.pairs(opts)
		-- end,
	},
	--
	-- discord presence
	--
	{
		'andweeb/presence.nvim',
	},

	--
	-- cppman
	--
	{
		'madskjeldgaard/cppman.nvim',
		dependencies = { 'MunifTanjim/nui.nvim' },
	},
	

	--
	-- wakatime dashboard
	--
	{
		'wakatime/vim-wakatime', lazy = false
	},

	--
	-- 42 norminette
	--
	{
		"hardyrafael17/norminette42.nvim",
		config = function()
			require("norminette").setup({
				active = true,
			})
		end,
	},

	--
	-- Animations
	--
	-- {
	-- 	"nvim-mini/mini.animate",
	-- },

	{
		'isakbm/gitgraph.nvim',
		opts = {
			git_cmd = "git",
			symbols = {
				merge_commit = 'M',
				commit = '*',
			},
			format = {
				timestamp = '%H:%M:%S %d-%m-%Y',
				fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
			},
			hooks = {
				on_select_commit = function(commit)
					vim.notify('DiffviewOpen ' .. commit.hash .. '^!')
					vim.cmd(':DiffviewOpen ' .. commit.hash .. '^!')
				end,
				on_select_range_commit = function(from, to)
					vim.notify('DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
					vim.cmd(':DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
				end,
			},
		},
		symbols = {
			merge_commit = '',
			commit = '',
			merge_commit_end = '',
			commit_end = '',

			-- Advanced symbols
			GVER = '',
			GHOR = '',
			GCLD = '',
			GCRD = '╭',
			GCLU = '',
			GCRU = '',
			GLRU = '',
			GLRD = '',
			GLUD = '',
			GRUD = '',
			GFORKU = '',
			GFORKD = '',
			GRUDCD = '',
			GRUDCU = '',
			GLUDCD = '',
			GLUDCU = '',
			GLRDCL = '',
			GLRDCR = '',
			GLRUCL = '',
			GLRUCR = '',
		},
		keys = {
			{
				"<leader>gl",
				function()
					require('gitgraph').draw({}, { all = true, max_count = 5000 })
				end,
				desc = "GitGraph - Draw",
			},
		},
	},

	-- for hex color
	{
		'brenoprata10/nvim-highlight-colors',
	},

	-- outliner explorer
	{
		'stevearc/aerial.nvim',
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		},
	},

	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons'
	},

	-- scroll view
	{
		"dstein64/nvim-scrollview",
	},

	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- or if using mini.icons/mini.nvim
		-- dependencies = { "nvim-mini/mini.icons" },
		---@module "fzf-lua"
		---@type fzf-lua.Config|{}
		---@diagnostic disable: missing-fields
		opts = {}
		---@diagnostic enable: missing-fields
	},

	-- {
	-- 	'psliwka/vim-smoothie',
	-- },

	{
		"sphamba/smear-cursor.nvim",
		opts = {
			stiffness = 0.5,
			trailing_stiffness = 0.5,
			matrix_pixel_threshold = 0.5,
		},
	},

	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},



}
