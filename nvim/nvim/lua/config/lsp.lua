local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = require("config.server")
local lspconfig = require('lspconfig')

for server, opts in pairs(servers) do
	opts.capabilities = capabilities
	lspconfig[server].setup(opts)
end

