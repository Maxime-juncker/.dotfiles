return {
	clangd = {
		filetypes = { "c", "h", "hpp", "cpp", "objc", "objcpp" },
		capabilities = lsp_capabilities,
		cmd = { "clangd", "--background-index", "--clang-tidy" },
	},

	ts_ls = {
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			-- Disable document formatting if you want manual control
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end,
		settings = {
			typescript = {
				inlayHints = {
					includeInlayParameterNameHints = 'all',
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				}
			},
			javascript = {
				inlayHints = {
					includeInlayParameterNameHints = 'all',
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				}
			}
		},

		-- Filetypes (default, but you can customize)
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx"
		},
	},

	tailwindcss = {},

	emmet_ls = {
		filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact" },
	},

	html = {
		capabilities = capabilities,
		filetypes = { "html", "templ", "vue" },
	},

	cssls = {
		capabilities = capabilities,
		settings = {
			css = {
				validate = true,
				lint = {
					unknownAtRules = "ignore" -- useful for Tailwind
				}
			},
			scss = {
				validate = true,
			},
			less = {
				validate = true,
			},
		},
	},
	
}
