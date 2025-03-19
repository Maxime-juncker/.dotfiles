vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "Project View"})
-- Makeit keybinds
vim.api.nvim_set_keymap('n', '<leader>mr', "<cmd>MakeitOpen<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>mt', "<cmd>MakeitToggleResults<cr>", { noremap = true, silent = true })

-- keybindings for barbar.nvim
vim.api.nvim_set_keymap('n', '<C-Right>', ':BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', ':BufferPrevious<CR>', { noremap = true, silent = true })

