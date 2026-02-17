require('dashboard').setup {
	config = {
		week_header = {
		enable = true,
	},

	shortcut = {
		{ desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
		{
			icon = ' ',
			icon_hl = '@variable',
			desc = 'Files',
			group = 'Label',
			action = 'FzfLua files',
			key = 'f',
		},
	},
	},
}
