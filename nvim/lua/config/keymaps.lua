local fzf = require('fzf-lua')

--
-- FZF
--
vim.keymap.set('n', '<leader>ff', fzf.files, { desc = 'find files' })
vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = 'live grep' })
vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = 'search buffers' })
vim.keymap.set('n', '<leader>fm', fzf.man_pages, { desc = 'man pages' })
vim.keymap.set('n', '<leader>fc', fzf.commands, { desc = 'search commands' })
vim.keymap.set('n', '<leader>fd', fzf.diagnostics_document, { desc = 'search diagnostics' })
vim.keymap.set('n', '<leader>fs', fzf.lsp_document_symbols, { desc = 'find symbols' })
vim.keymap.set('n', '<Leader>fr', fzf.lsp_references, { desc = 'find references' })
vim.keymap.set('n', '<leader>fz', fzf.resume, { desc = 'resume previous search' })

--
-- neotree
--
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>')
vim.keymap.set('n', '<leader>E', '<Cmd>Neotree<CR>')


