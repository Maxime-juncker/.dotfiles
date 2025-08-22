vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.wo.relativenumber = true
vim.opt.expandtab = false	-- Use tabs instead of spaces
vim.opt.tabstop = 4			-- Number of spaces that a Tab counts for
vim.opt.shiftwidth = 4		-- Number of spaces for each indentation
vim.opt.softtabstop = 4		-- Number of spaces a Tab feels like

-- cursor higlight
vim.opt.cursorline = true  -- Make sure cursorline is enabled
vim.api.nvim_set_hl(0, 'CursorLine', { default = false, bg = "#2c323c" })


vim.opt.termguicolors = true

