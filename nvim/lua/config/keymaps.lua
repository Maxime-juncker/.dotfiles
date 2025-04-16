

-- dap ---
vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = "Debug: Continue" })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = "Debug: Step Over" })
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = "Debug: Step Into" })
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = "Debug: Step Out" })
vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end, { desc = "Debug: Toggle Breakpoint" })
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


-- neogit
vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", { desc = "Open Neogit" })
-- diffview
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Open Diffview" })
vim.keymap.set("n", "<leader>gh", ":DiffviewFileHistory<CR>", { desc = "File History" })

