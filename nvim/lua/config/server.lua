return {
	clangd = {
		cmd = { "clangd", "--background-index", "--clang-tidy" },
		filetypes = { "c", "cpp", "objc", "objcpp" },
		capabilities = lsp_capabilities,
	},
}
