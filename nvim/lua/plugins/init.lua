return {
	-- themes
	{
		"ellisonleao/gruvbox.nvim",
		'projekt0n/github-nvim-theme',
		'catppuccin/nvim',
		"vague2k/vague.nvim",
		"navarasu/onedark.nvim",
		"Mofiqul/vscode.nvim",
		"askfiy/visual_studio_code",
		"rebelot/kanagawa.nvim",
		"bluz71/vim-moonfly-colors",
		"Maxime-juncker/coolTheme",
		"Maxime-juncker/visualstudio.nvim",
		'dasupradyumna/midnight.nvim'
	},

{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
     branch = 'master',
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua", "vim", "go", "javascript",
                "svelte", "typescript", "c",
                "cpp", "php", "css"
            },
            highlight = { enable = true },
			indent = { enable = false },
            auto_install = true,
        })
    end,
},

	-- fuzzy finder
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

	-- key hint
	{
		"folke/which-key.nvim",
		config = function()
			local wk = require("which-key")

			wk.setup({
				preset = "helix",
			})
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false,             -- neo-tree will lazily load itself
	},

	{
    "mason-org/mason.nvim",
    opts = {}
},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
	},

	{
		"hrsh7th/cmp-nvim-lsp",
		lazy = false,
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("config.cmp")
		end,
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	{ "saghen/blink.lib" },

	{
		"saghen/blink.indent",
		opts = {
			static = {
				enabled = true,
				char = "▎",
			},
			scope = {
				enabled = true,
			},
			blocked = {
				filetypes = { include_defaults = true },
				buftypes = { include_defaults = true },
			},
		},
	},


	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		config = true,
	},

	{
		"sindrets/diffview.nvim",
		config = true,
	},

	{
		'stevearc/conform.nvim',
		opts = {},
	},

	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					separator_style = "slant",
					diagnostics = "nvim_lsp",
					always_show_bufferline = true,
					show_buffer_close_icons = true,
					show_close_icon = false,
				},
			})

			-- optional keymaps
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
					icons_enabled = true,
					globalstatus = true,
					section_separators = "",
					component_separators = "",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff" },
					lualine_c = { "filename" },
					lualine_x = { "diagnostics", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
		end,
	}

}
