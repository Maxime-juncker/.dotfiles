
return 
{
	{
		'nvim-tree/nvim-tree.lua',
		config = function()
			require("nvim-tree").setup()
			vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>')
		end
	},

	'nvim-tree/nvim-web-devicons',
}

