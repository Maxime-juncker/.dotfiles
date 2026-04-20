-- server.lua
return {
	clangd = {
		cmd = { "clangd", "--background-index", "--clang-tidy" },
		filetypes = { "c", "h", "hpp", "cpp", "objc", "objcpp" },
	},
	omnisharp = {
		filetypes = { "cs" },
		root_dir = function(bufnr, on_dir)
			local root = vim.fs.root(bufnr, {
				"*.sln",
				"*.csproj",
				"omnisharp.json",
				"global.json",
				".git",
			})
			local fallback = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
			on_dir(root or fallback)
		end,
		settings = {
			FormattingOptions = {
				EnableEditorConfigSupport = true,
				OrganizeImports = true,
			},
			RoslynExtensionsOptions = {
				EnableImportCompletion = true,
			},
			MsBuild = {
				LoadProjectsOnDemand = false,
			},
			Sdk = {
				IncludePrereleases = true,
			},
		},
	},
	ts_ls = {
		on_attach = function(client, _)
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
			},
		},
		filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	},
	tailwindcss = {},
	emmet_ls = {
		filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact" },
	},
	html = {
		filetypes = { "html", "templ", "vue", "javascriptreact", "typescriptreact"},
	},
	cssls = {
		settings = {
			css = { validate = true, lint = { unknownAtRules = "ignore" } },
			scss = { validate = true },
			less = { validate = true },
		},
	},
}
