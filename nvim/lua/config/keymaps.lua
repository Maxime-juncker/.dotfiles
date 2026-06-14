local fzf = require('fzf-lua')

vim.keymap.set('n', '<A-,>', '<Cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-.>', '<Cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-c>', '<Cmd>bdelete<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<CR>", { silent = true })
--
-- FZF
--
vim.keymap.set('n', '<leader>ff', fzf.files, { desc = 'find files' })
vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = 'live grep' })
vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = 'search buffers' })
vim.keymap.set('n', '<leader>fm', fzf.man_pages, { desc = 'man pages' })
vim.keymap.set('n', '<leader>fd', fzf.diagnostics_document, { desc = 'search diagnostics' })
vim.keymap.set('n', '<leader>fs', fzf.lsp_document_symbols, { desc = 'find symbols' })
vim.keymap.set('n', '<Leader>fr', fzf.lsp_references, { desc = 'find references' })
vim.keymap.set('n', '<leader>fz', fzf.resume, { desc = 'resume previous search' })
vim.keymap.set("n", "<leader>fc", function()
	require("fzf-lua").colorschemes({
		winopts = { fullscreen = false },
		actions = {
			["default"] = function(selected)
				local theme = selected[1]

				-- apply immediately
				vim.cmd.colorscheme(theme)

				-- save it
				vim.fn.writefile({ theme }, vim.fn.stdpath("data") .. "/colorscheme.txt")
			end,
		},
	})
end, { desc = "select colorscheme" }
)

--
-- neotree
--
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>')
vim.keymap.set('n', '<leader>E', '<Cmd>Neotree<CR>')

vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = "open diagnostics" })

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	require("conform").format({
		lsp_fallback = true,
		async = true,
	})
end, { desc = "Format buffer" })
