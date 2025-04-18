return
{
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',
	'rafamadriz/friendly-snippets',
	'romgrk/barbar.nvim',
	'eriks47/generate.nvim',
"rebelot/kanagawa.nvim",
	"ellisonleao/gruvbox.nvim",
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end,
		opts = {
			-- add any options here
		}
	},

	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()

			-- Install the debug adapter
			vim.cmd([[MasonInstall codelldb]]) -- Or you can use cpptools
		end
	},
	"nvim-telescope/telescope-dap.nvim", -- Optional telescope integration
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"codelldb",     -- For debugging with codelldb
					"cpptools",     -- Microsoft C/C++ tools (for debugging)
					"clangd",       -- C/C++ language server
					"clang-format", -- C/C++ formatter
					-- Add any other tools you need
				},
				auto_update = true,
				run_on_start = true,
			})
		end
	},

	{
		"rockyzhang24/arctic.nvim",
		branch = "v2",
		dependencies = { "rktjmp/lush.nvim" }
	},
	'SuperBo/fugit2.nvim',

}
