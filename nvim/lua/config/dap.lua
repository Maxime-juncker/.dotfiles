local dap = require("dap")

dap.adapters.cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        command = vim.fn.stdpath("data") .. '/mason/bin/OpenDebugAD7', -- if installed via Mason
        -- OR provide the direct path to the executable
        -- command = '/path/to/extension/debugAdapters/bin/OpenDebugAD7',
      }
      
      -- Configure C/C++ debugging
      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "cppdbg",
		  request = "launch",
		  program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = true,
          setupCommands = {
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


