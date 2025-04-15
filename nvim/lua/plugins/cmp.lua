return {
	{
	  "hrsh7th/nvim-cmp",
	  event = "InsertEnter", -- Load on insert mode
	  dependencies = {
		"hrsh7th/cmp-nvim-lsp",   -- LSP source for cmp
		"hrsh7th/cmp-buffer",     -- buffer completions
		"hrsh7th/cmp-path",       -- path completions
		"hrsh7th/cmp-cmdline",    -- cmdline completions
		"saadparwaiz1/cmp_luasnip", -- snippet completions
		"L3MON4D3/LuaSnip",       -- snippet engine
		"rafamadriz/friendly-snippets", -- useful snippet collection
	  },
	  config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
  
		-- Load vscode-like snippets
		require("luasnip.loaders.from_vscode").lazy_load()
  
		cmp.setup({
		  snippet = {
			expand = function(args)
			  luasnip.lsp_expand(args.body)
			end,
		  },
		  mapping = cmp.mapping.preset.insert({
			["<C-Space>"] = cmp.mapping.complete(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<S-Tab>"] = cmp.mapping.select_prev_item(),
		  }),
		  sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
		  }, {
			{ name = "buffer" },
			{ name = "path" },
		  }),
		})
	  end,
	},
  }
  
