vim.wo.relativenumber = true
vim.opt.expandtab = false	-- Use tabs instead of spaces
vim.opt.tabstop = 4			-- Number of spaces that a Tab counts for
vim.opt.shiftwidth = 4		-- Number of spaces for each indentation
vim.opt.softtabstop = 4		-- Number of spaces a Tab feels like


vim.opt.clipboard:append("unnamedplus") -- Use the system clipboard

vim.cmd('set listchars=eol:↵,trail:~,tab:>-,nbsp:␣')
