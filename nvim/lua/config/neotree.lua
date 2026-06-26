require("neo-tree").setup({
	filesystem = {
	filtered_items = {
		visible = true, -- Show files normally hidden (dotfiles/folders)
		hide_dotfiles = false, -- Keep dotfiles visible
	},
	},
	window = {
		position = "left",  -- Sidebar on the left (default)
		width = 30,         -- Sidebar width in columns
	},
})