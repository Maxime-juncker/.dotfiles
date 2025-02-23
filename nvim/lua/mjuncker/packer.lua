-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'


	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'williamboman/mason.nvim', -- LSP/DAP/Linter/Formatter installer
		'williamboman/mason-lspconfig.nvim', -- Bridge between Mason and LSP
		'neovim/nvim-lspconfig', -- Quick LSP configurations
	}
	use {
		'hrsh7th/nvim-cmp', -- Autocompletion plugin
		'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
		'L3MON4D3/LuaSnip', -- Snippet engine
		'saadparwaiz1/cmp_luasnip' -- Snippet completions
	}

end)
