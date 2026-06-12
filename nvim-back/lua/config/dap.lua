local dap = require("dap")
local dapui = require("dapui")

dapui.setup(
{
	layouts =
	{
		{
			elements =
			{
				{ id = "scopes", size = 0.25 },
				{ id = "breakpoints", size = 0.25 },
				{ id = "stacks", size = 0.25 },
				{ id = "watches", size = 0.25 },
			},
			size = 40,
			position = "left",
		},
		{
			elements =
			{
				{ id = "repl", size = 0.5 },
				{ id = "console", size = 0.5 },
			},
			size = 10,
			position = "bottom",
		},
	},
})
	
	-- Auto open and close dapui
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.adapters.cppdbg = {
	id = 'cppdbg',
	type = 'executable',
	command = vim.fn.stdpath("data") .. '/mason/bin/OpenDebugAD7', -- if installed via Mason
}

-- Configure C/C++ debugging
dap.configurations.cpp =
{
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = function()
		return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		args = function()
			local input = vim.fn.input('Program arguments (space-separated): ')
			return vim.fn.split(input, " ", true)
		end,
		stopOnEntry = true,
		setupCommands =
		{
			{
				text = '-enable-pretty-printing',
				description = 'enable pretty printing',
				ignoreFailures = false
			},
		},
	},
}
-- Also use the same configuration for C
dap.configurations.c = dap.configurations.cpp

-- colors
vim.api.nvim_set_hl(0, 'DapStoppedLine', { default = true, bg = "#4a331d" }) -- Background color for the entire line
vim.api.nvim_set_hl(0, 'DapBreakpoint', { default = true, fg = "#993939"})
vim.api.nvim_set_hl(0, 'DapLogPoint', { default = true, fg = "#61afef"})
vim.api.nvim_set_hl(0, 'DapStopped', { default = true, fg = "#98c379", bg = "#31353f" })

-- Configure the signs used in the gutter
vim.fn.sign_define('DapBreakpoint', { text='●', texthl='DapBreakpoint', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointCondition', { text='◆', texthl='DapBreakpoint', linehl='', numhl='' })
vim.fn.sign_define('DapLogPoint', { text='◆', texthl='DapLogPoint', linehl='', numhl='' })
vim.fn.sign_define('DapStopped', { text='▶', texthl='DapStopped', linehl='DapStoppedLine', numhl='' })


