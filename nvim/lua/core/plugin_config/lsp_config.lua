require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "clangd" }, -- Automatically install clangd
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").clangd.setup({
	capabilities = capabilies,
	cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--query-driver=/usr/bin/g++",
  },
	filetypes = { "c", "cpp", "objc", "objcpp" },
})

