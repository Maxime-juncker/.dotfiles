-- Move to previous/next
vim.api.nvim_set_keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })

-- dap ---
vim.keymap.set('n', '<Leader>dn', function() require('dap').continue() end, { desc = "launch no build" })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = "Debug: Step Over" })
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = "Debug: Step Into" })
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = "Debug: Step Out" })
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set('n', '<Leader>dB', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = "Debug: Conditional Breakpoint" })
vim.keymap.set('n', '<Leader>dl', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = "Debug: Logpoint" })
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, { desc = "Debug: Open REPL" })
vim.keymap.set('n', '<Leader>du', function() require('dapui').toggle() end, { desc = "Debug: Toggle UI" })

vim.keymap.set('n', '<Leader>dw', function()
    local expr = vim.fn.input('Watch expression: ')
    require('dap.ui.widgets').add_watch(expr)
end, { desc = "Debug: Add Watch Expression" })

vim.keymap.set('n', '<Leader>dW', function()
    local expr = vim.fn.input('Expression: ')
    require('dapui').elements.watches.add(expr)
end, { desc = "Debug: Add Watch (UI)" })

------------------

vim.keymap.set('n', '<Leader>fr', function() require('telescope.builtin').lsp_references() end, { noremap = true, silent = true })

vim.keymap.set('n', '<F5>', function()
  vim.fn.system("make")
  if vim.v.shell_error ~= 0 then
    print("Build failed!")
    return
  end
  require('dap').continue()
end, { desc = "Debug: Build and Launch" })


-- neogit
vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", { desc = "Open Neogit" })
-- diffview
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Open Diffview" })
vim.keymap.set("n", "<leader>gh", ":DiffviewFileHistory<CR>", { desc = "File History" })
vim.keymap.set("n", "<leader>gc", ":DiffviewClose<CR>", { desc = "Close Diffview" })

vim.keymap.set("n", "<leader>hs", ":noh<CR>", { desc = "Hide Search" })

vim.keymap.set("n", "<C-/>", function() require('Comment.api').toggle.linewise.current() end, { noremap = true, silent = true })


--
-- inline hint
--
-- vim.keymap.set("n", "<leader>it", ":InlayHintsToggle<CR>", { desc = "Toggle inline hint" })
