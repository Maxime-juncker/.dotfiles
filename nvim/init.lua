require("config.lazy")

vim.api.nvim_set_option("clipboard", "unnamed")
vim.wo.relativenumber = true
vim.opt.expandtab = false  -- Use tabs instead of spaces
vim.opt.tabstop = 4        -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 4     -- Number of spaces for each indentation
vim.opt.softtabstop = 4    -- Number of spaces a <Tab> feels like