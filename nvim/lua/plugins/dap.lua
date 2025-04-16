-- In your init.lua or a separate debug.lua file
return {
  {
	"jay-babu/mason-nvim-dap.nvim",
    dependencies = {
		"mfussenegger/nvim-dap",
      "williamboman/mason.nvim", -- Optional but recommended for easy adapter installation
    },
	 config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = {
          "cpptools",
          "codelldb",
        },
        automatic_installation = true,
      })
    end,
  },
  
  -- DAP UI setup
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      
      dapui.setup({
        -- Default setup works well, but you can customize layouts here
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.25 },
              { id = "breakpoints", size = 0.25 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
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
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  
  -- Optional but helpful for virtual text
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {"mfussenegger/nvim-dap"},
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  }
}

