return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		version = "v0.2.9",
		dependencies = {
			-- "hrsh7th/cmp-nvim-lsp", -- for capabilities
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			require("lspconfig").clangd.setup({
				on_attach = function(client, bufnr)
					local opts = { noremap = true, silent = true, buffer = bufnr }
					local map = vim.keymap.set

					map('n', 'gd', vim.lsp.buf.definition, opts)
					map('n', 'gD', vim.lsp.buf.declaration, opts)
					map('n', 'gi', vim.lsp.buf.implementation, opts)
					map('n', 'gT', vim.lsp.buf.type_definition, opts)
					map('n', 'K', vim.lsp.buf.hover, opts)
					map('n', '<leader>fr', require('telescope.builtin').lsp_references,
					{ noremap = true, silent = true, buffer = bufnr, desc = "find reference" })
				end,

				capabilities = capabilities,
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--query-driver=/usr/bin/g++",
					"--index",
					"--index-file=.clangd-index",
					"--pch-storage=memory",
					"--header-insertion=never",
				},
				filetypes = { "c", "cpp", "tpp", "objc", "objcpp" },

				settings = {
					clangd = {
						InlayHints = {
							Designators = true,
							Enabled = true,
							ParameterNames = true,
							DeducedTypes = true,
						},
						fallbackFlags = { "-std=c++20" },
					},
				}


			})
		end,
	},
}
