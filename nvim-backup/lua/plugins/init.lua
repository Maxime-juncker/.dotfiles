return
{
	'L3MON4D3/LuaSnip',
	-- 'saadparwaiz1/cmp_luasnip',
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

	"nvim-telescope/telescope-dap.nvim", -- Optional telescope integration
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		event = "BufReadPre", -- or another appropriate event
		config = true,
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"clangd",       -- C/C++ language server
					"clang-format", -- C/C++ formatter
					"codelldb",
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

	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {
			bind = true,
			handler_opts = {
				border = "rounded"
			}
		},
		-- or use config
		-- config = function(_, opts) require'lsp_signature'.setup({you options}) end
	},
	{
		"Djancyp/better-comments.nvim",
		config = function()
			require('better-comment').Setup({
				tags = {
					{
						name = "TODO",
						fg = "#0a7aca",
						bg = "",
						bold = true,
						virtual_text = "",
					},
					{
						name = "TOFIX",
						fg = "#EE4B2B",
						bg = "",
						bold = true,
						virtual_text = "",
					},
				}
			})
		end
	}
}
