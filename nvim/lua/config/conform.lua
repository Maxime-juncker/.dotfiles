require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		typescript = { "prettierd", "prettier", fallback_lsp = true },
		typescriptreact = { "prettierd", "prettier", fallback_lsp = true },
		javascript = { "prettierd" },
		cs = { "csharpier" },
		c = { "clang_format" },
		cpp = { "clang_format" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	}
})
