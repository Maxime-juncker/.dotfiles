return {
	clangd = {
		cmd = { "clangd", "--background-index", "--clang-tidy" },
		filetypes = { "c", "h", "hpp", "cpp", "objc", "objcpp" },
		capabilities = lsp_capabilities,
		cmd = {"clangd"},
	},

	-- ts_ls = {
	--   on_attach = on_attach,
	--   filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	--   cmd = { "typescript-language-server", "--stdio" }
	-- },

	ts_ls = {
		capabilities = capabilities,
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

	emmet_ls = {
		filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact" },
	},

	html = {
		capabilities = capabilities,
		filetypes = { "html", "templ" },
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
