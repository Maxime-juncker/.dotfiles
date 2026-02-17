-- treesitter.lua
require("nvim-treesitter.configs").setup({  -- note: .configs not just the module
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = true,  -- boolean, not a table
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"css",
		"diff",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"jsonc",
		"lua",
		"luadoc",
		"luap",
		"markdown",
		"markdown_inline",
		"printf",
		"python",
		"query",
		"regex",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"vimdoc",
		"xml",
		"yaml",
	},
})

-- folds separately:
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false  -- open all folds by default
-- require("nvim-treesitter").setup({
-- 	highlight = { enable = true },
-- 	indent = { enable = true },
-- 	auto_install = { enable = true },
-- 	folds = { enable = true }, ---@type lazyvim.TSFeat
-- 	ensure_installed = {
-- 		"bash",
-- 		"c",
-- 		"cpp",
-- 		"css",
-- 		"diff",
-- 		"html",
-- 		"javascript",
-- 		"jsdoc",
-- 		"json",
-- 		"jsonc",
-- 		"lua",
-- 		"luadoc",
-- 		"luap",
-- 		"markdown",
-- 		"markdown_inline",
-- 		"printf",
-- 		"python",
-- 		"query",
-- 		"regex",
-- 		"toml",
-- 		"tsx",
-- 		"typescript",
-- 		"vim",
-- 		"vimdoc",
-- 		"xml",
-- 		"yaml",
-- 	},
-- })
--
