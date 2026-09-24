return {
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "ibhagwan/fzf-lua",
        },
        config = function()
            require("dashboard").setup({
                hide = {
                    tabline = false,
                },
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
            })
        end,
    },
}
