require('telescope').setup({
	defaults = {
		file_ignore_patterns = {},
		hidden = true,  -- This will show hidden files by default
	},
	pickers = {
		find_files = {
			hidden = true,
			-- theme = "dropdown",
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},
		live_grep = {
			theme = "ivy", -- or "dropdown", "cursor"
		}

	},
})
