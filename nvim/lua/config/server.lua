return {
	clangd = {
		cmd = { "clangd", "--background-index", "--clang-tidy" },
		filetypes = { "c", "h", "hpp", "cpp", "objc", "objcpp" },
		capabilities = lsp_capabilities,
		cmd = {"clangd"},
	},

	tsserver = {
	  on_attach = on_attach,
	  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	  cmd = { "typescript-language-server", "--stdio" }
	}
	
}
