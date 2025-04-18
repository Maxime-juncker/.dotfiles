require("config.lazy")


require("config.dap")
require("config.keymaps")
require("config.neogit")

vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.wo.relativenumber = true
vim.opt.expandtab = false  -- Use tabs instead of spaces
vim.opt.tabstop = 4        -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 4     -- Number of spaces for each indentation
vim.opt.softtabstop = 4    -- Number of spaces a <Tab> feels like

-- cursor higlight
vim.opt.cursorline = true  -- Make sure cursorline is enabled
vim.api.nvim_set_hl(0, 'CursorLine', { default = false, bg = "#2c323c" })

vim.api.nvim_set_hl(0, "@parameter", { fg = "#FFFFFF", italic = true })  -- gold color with italics

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
require("config.gruvbox")

