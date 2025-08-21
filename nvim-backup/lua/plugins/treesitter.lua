return
{
	{
  "nvim-treesitter/playground",
  cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
  config = function()
    require("nvim-treesitter.configs").setup({
      playground = {
        enable = true,
        updatetime = 25, -- Debounced time for highlighting nodes
        persist_queries = false, -- Don't persist queries across sessions
      },
    })
  end,
},

	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require'nvim-treesitter.configs'.setup {
				-- A list of parser names, or "all" (the listed parsers MUST always be installed)
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
				},
			}
			vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#FFD700", italic = true })


		end,
	}
}

