local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'L3MON4D3/LuaSnip'
	use 'm4xshen/autoclose.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'
	use({
		"stevearc/overseer.nvim",
		commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
		config = function()
			require("overseer").setup({
				task_list = {
					direction = "top",
					min_height = 25,
					max_height = 25,
					default_detail = 1,
				},
			})
		end,
	})
	use({
		"Zeioth/makeit.nvim",
		requires = { "stevearc/overseer.nvim" },
		after = "overseer.nvim",
		cmd = { "MakeitOpen", "MakeitToggleResults", "MakeitRedo" },
		config = function()
			require("makeit").setup({})
		end,
	})
	use 'romgrk/barbar.nvim'
	use 'folke/which-key.nvim'


	-- themes
	use "scottmckendry/cyberdream.nvim"
	use 'ellisonLeao/gruvbox.nvim'
	use 'folke/tokyonight.nvim'
	use "EdenEast/nightfox.nvim"
	use "rebelot/kanagawa.nvim"
	use { "catppuccin/nvim", as = "catppuccin" }
use 'Mofiqul/vscode.nvim'

use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("ibl").setup {
            indent = { char = "│" },
            scope = { show_start = true, show_end = true }, -- Enable scope highlighting
        }
    end
}



	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
