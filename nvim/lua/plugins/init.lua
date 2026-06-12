return {
	-- themes
	{
		"zaldih/themery.nvim", -- theme picker
		"ellisonleao/gruvbox.nvim",
		'projekt0n/github-nvim-theme',
		'catppuccin/nvim',
		"vague2k/vague.nvim",
		"navarasu/onedark.nvim",
		"Mofiqul/vscode.nvim",
		"askfiy/visual_studio_code",
		"rebelot/kanagawa.nvim",
		"bluz71/vim-moonfly-colors",
		"Maxime-juncker/coolTheme",
		"Maxime-juncker/visualstudio.nvim",
	},

	-- treesiter
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate'
	},
	
	-- fuzzy finder
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- or if using mini.icons/mini.nvim
		-- dependencies = { "nvim-mini/mini.icons" },
		---@module "fzf-lua"
		---@type fzf-lua.Config|{}
		---@diagnostic disable: missing-fields
		opts = {}
		---@diagnostic enable: missing-fields
	},

	-- key hint
	{
		"folke/which-key.nvim",
		config = function() require("which-key").setup {}
		end
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
	},

{
  "williamboman/mason.nvim",
  build = ":MasonUpdate", -- optional, updates registry
  config = function()
    require("mason").setup()
  end,
},
{
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-lspconfig").setup({
      -- List the servers you want Mason to install for you
      ensure_installed = {
        "lua_ls",    -- Lua
        "pyright",   -- Python
        -- add more here …
      },
      -- Do *not* let mason‑lspconfig automatically set up servers.
      -- We'll do it ourselves with the new vim.lsp.config style.
      automatic_installation = false,
    })
  end,
},

}