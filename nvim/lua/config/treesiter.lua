require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "vim", "go", "javascript", "c", "cpp", "php", "css" },
	highlight = { enable = true },
	indent = { enable = false },
	auto_install = { enable = true },
})
-- -- folds separately:
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldenable = false  -- open all folds by default
