
-- lazy
require("config.lazy")

-- settings
require("config.settings")

-- plugins configs
require("config.keymaps")
require("config.mason")
require("config.lsp")
require("config.cmp")
require("config.neotree")
require("config.lualine")
require("config.presence")
require("config.treesiter")
require("config.dap")
require("config.telescope")
require("config.autopair")
require("config.highlight")
require("config.aerial")
require("config.bufferline")

-- theme
require("config.gruvbox")
require("theme.onedark")
require("theme.vscode")
require("theme.telescope")
require("config.themery")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("NorminetteDisable")
  end,
})

