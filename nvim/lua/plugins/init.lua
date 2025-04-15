return
{
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',
	'rafamadriz/friendly-snippets',
	{
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
	},
	'romgrk/barbar.nvim',
	'eriks47/generate.nvim',

}
