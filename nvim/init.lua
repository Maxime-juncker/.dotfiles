
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
require("config.themery")
require("config.dap")
require("config.telescope")
require("config.autopair")
require("config.anim")

-- theme
require("config.gruvbox")
require("theme.onedark")


vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("NorminetteDisable")
  end,
})

