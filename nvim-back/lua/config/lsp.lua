local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = require("config.server")

for server, opts in pairs(servers) do
	opts.capabilities = capabilities
	vim.lsp.config(server, opts)
	vim.lsp.enable(server)
end

