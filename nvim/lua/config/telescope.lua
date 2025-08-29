require('telescope').setup({
  defaults = {
    file_ignore_patterns = {},
    hidden = true,  -- This will show hidden files by default
  },
  pickers = {
    find_files = {
      hidden = true,
      -- You can also disable the default ignore patterns
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
  },
})
