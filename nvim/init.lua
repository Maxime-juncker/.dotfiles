-- lazy
require("config.lazy")

-- settings
require("config.settings")
require("config.keymaps")

for server_name, _ in pairs(vim.lsp.config) do
  vim.lsp.enable(server_name)
end