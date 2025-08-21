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

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	},

	ensure_installed = { "clangd" }
})