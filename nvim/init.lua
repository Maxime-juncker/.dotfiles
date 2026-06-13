-- lazy

require("config.lazy")

-- settings
require("config.settings")
require("config.keymaps")


require("config.mason")
require("config.lsp")

local file = vim.fn.stdpath("data") .. "/colorscheme.txt"

local ok, lines = pcall(vim.fn.readfile, file)
if ok and lines[1] then
  pcall(vim.cmd.colorscheme, lines[1])
end

