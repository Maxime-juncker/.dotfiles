--
-- telescope
--
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = 'Telescope man' })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Telescope commands' })
vim.keymap.set("n", '<leader>fb', ":Telescope file_browser<CR>")
vim.keymap.set('n', '<leader>fd', "<cmd>Telescope diagnostics<cr>")
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'find symbols' })
vim.keymap.set('n', '<Leader>fr', builtin.lsp_references, { desc = 'find references' })

--
-- neotree
--
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>')
vim.keymap.set('n', '<leader>E', '<Cmd>Neotree<CR>')

--
-- top bar
--
vim.keymap.set('n', '<A-,>', '<Cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-.>', '<Cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-c>', '<Cmd>bdelete<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<CR>", { silent = true })


vim.keymap.set('n', '<leader>hs', '<Cmd>noh<CR>', { noremap = true, silent = true, desc = "hide search" })
vim.keymap.set('n', '<leader>ts', '<Cmd>Themery<CR>', { noremap = true, silent = true, desc = "theme select" })

--
-- lsp
--
vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float, { desc = "open float"})
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = "goto prev" })
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = "goto next" })
vim.api.nvim_create_autocmd('LspAttach',
{
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = "go to declaration" })
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = "go to definition" })
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = "show detail" })
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = "rename" })
	vim.keymap.set('n', '<leader>df', function()
		vim.lsp.buf.format { async = true }
	end, { buffer = ev.buf, desc = ""})
end,
})


-- dap ---
vim.keymap.set('n', '<F5>', 	function() require('dap').continue() end, { desc = "launch no build" })
vim.keymap.set('n', '<F10>',		function() require('dap').step_over() end, { desc = "Debug: Step Over" })
vim.keymap.set('n', '<F11>',		function() require('dap').step_into() end, { desc = "Debug: Step Into" })
vim.keymap.set('n', '<F12>',		function() require('dap').step_out() end, { desc = "Debug: Step Out" })
vim.keymap.set('n', "<F8>",			function() require('dap').disconnect({ terminateDebuggee = true }) require'dap'.close() end, {desc = "Stop"})
vim.keymap.set('n', '<Leader>dr',	function() require('dap').repl.open() end, { desc = "Debug: Open REPL" })
vim.keymap.set('n', '<Leader>du',	function() require('dapui').toggle() end, { desc = "Debug: Toggle UI" })

vim.keymap.set('n', '<leader>db', '<cmd>PBToggleBreakpoint<cr>', { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set('n', '<leader>dc', '<cmd>PBSetConditionalBreakpoint<cr>', { desc = "Debug: Toggle Conditional Breakpoint" })
vim.keymap.set('n', '<leader>dC', '<cmd>PBClearAllBreakpoints<cr>', { desc = "Debug: Clear All Breakpoint" })
vim.keymap.set('n', '<Leader>dl',	function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = "Debug: Logpoint" })

vim.keymap.set('n', '<Leader>dW', function()
	local expr = vim.fn.input('Expression: ')
	require('dapui').elements.watches.add(expr)
end, { desc = "Debug: Add Watch (UI)" })

--
-- cppman
--
vim.keymap.set("n", "<leader>cm", function()
	require("cppman").open_cppman_for(vim.fn.expand("<cword>"))
end, { desc = "open cppman" })

-- Open search box
vim.keymap.set("n", "<leader>cc", function()
	require("cppman").input()
end, { desc = "find man page" })


--
-- norminette
--
vim.keymap.set('n', '<Leader>nd',	"<Cmd>NorminetteDisable<Cr>")
vim.keymap.set('n', '<Leader>ne',	"<Cmd>NorminetteEnable<Cr>")


vim.keymap.set('n', '<Leader>go', "<Cmd>DiffviewOpen<Cr>", { desc = "open diffview" })
vim.keymap.set('n', '<Leader>gc', "<Cmd>DiffviewClose<Cr>", { desc = "close diffview" })
vim.keymap.set('n', '<Leader>gt', "<Cmd>DiffviewFileHistory<Cr>", { desc = "branch history" })
vim.keymap.set('n', '<Leader>gf', "<Cmd>DiffviewFileHistory %<Cr>", { desc = "file history" })
-- diff colors
vim.api.nvim_set_hl(0, "DiffAdd", {bg = "#20303b"})
vim.api.nvim_set_hl(0, "DiffDelete", {bg = "#37222c"})
vim.api.nvim_set_hl(0, "DiffChange", {bg = "#1f2231"})
vim.api.nvim_set_hl(0, "DiffText", {bg = "#394b70"})

-- arial panel (navigate functions)
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

-- open diagnostic
vim.keymap.set('n', '<leader>td', vim.diagnostic.open_float, { desc = "open diagnostic" })

