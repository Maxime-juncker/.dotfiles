require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "vim", "go", "javascript", "c", "cpp" },
	highlight = { enable = true },
	indent = { enable = true },
	auto_install = { enable = true },
})

