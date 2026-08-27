local theme_file = vim.fn.stdpath("state") .. "/theme"

local themes = {
	"tokyonight-night",
	"tokyonight-storm",
	"tokyonight-moon",
	"tokyonight-day",
	"gruvbox",
	'github-nvim-theme',
	'nvim',
	"vague",
	"onedark",
	"vscode",
	"visual_studio_code",
	"kanagawa",
	"vim-moonfly-colors",
	"coolTheme",
	"visualstudio",
}

local valid_themes = {}
for _, theme in ipairs(themes) do
  valid_themes[theme] = true
end

local function save_theme(theme)
  vim.fn.mkdir(vim.fn.stdpath("state"), "p")
  vim.fn.writefile({ theme }, theme_file)
end

local function apply_theme(theme, persist)
  if not valid_themes[theme] then
    theme = "tokyonight-moon"
  end

  vim.cmd.colorscheme(theme)

  if persist then
    save_theme(theme)
  end
end

local saved_theme = "tokyonight-moon"
if vim.fn.filereadable(theme_file) == 1 then
  local saved = vim.fn.readfile(theme_file)[1]
  if valid_themes[saved] then
    saved_theme = saved
  end
end

apply_theme(saved_theme, false)

vim.keymap.set("n", "<leader>ut", function()
  vim.ui.select(themes, {
    prompt = "Select theme:",
  }, function(choice)
    if choice then
      apply_theme(choice, true)
    end
  end)
end, { desc = "Select theme" })
