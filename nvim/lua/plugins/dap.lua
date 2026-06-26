-- In your init.lua or a separate debug.lua file
return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"mfussenegger/nvim-dap",
			"williamboman/mason.nvim",
		},
	},
	-- DAP UI setup
	{
	"rcarriga/nvim-dap-ui",
	dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
	},
	-- Optional but helpful for virtual text
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = {"mfussenegger/nvim-dap"},
		config = function()
		require("nvim-dap-virtual-text").setup()
		end
	},

	{
		  'Weissle/persistent-breakpoints.nvim',
		dependencies = { 'mfussenegger/nvim-dap' },
  config = function()
    require('persistent-breakpoints').setup{
      save_dir = vim.fn.stdpath('data') .. '/nvim_checkpoints',
      load_breakpoints_event = { "BufReadPost" },
      -- Optionally: set to true to automatically load breakpoints
      reload_breakpoints_on_load = true,
    }
  end

	},
}

