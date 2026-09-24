require("themery").setup({
    themes = {
        -- TokyoNight variants (custom names for clarity)
        { name = "TokyoNight Night", colorscheme = "tokyonight-night" },
        { name = "TokyoNight Storm", colorscheme = "tokyonight-storm" },
        { name = "TokyoNight Moon",  colorscheme = "tokyonight-moon" },
        { name = "TokyoNight Day",   colorscheme = "tokyonight-day" },

        -- Gruvbox (needs background variable set before applying)
        {
            name = "Gruvbox Dark",
            colorscheme = "gruvbox",
            before = [[ vim.opt.background = "dark" ]],
        },
        {
            name = "Gruvbox Light",
            colorscheme = "gruvbox",
            before = [[ vim.opt.background = "light" ]],
        },

        -- Other themes
        "github_dark",
        "vague",
        "onedark",
        "vscode",
        "visual_studio_code",
        "kanagawa",
        "moonfly",
        "coolTheme",
        "bruno",
    },
    livePreview = true, -- Apply theme as you navigate
})
