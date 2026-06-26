-- @file lsp-config.lua -- Wire MASON servers to their vim.lsp configs via mason-lspconfig
local mason_lspconfig = require("mason-lspconfig")

---Install a server when `ensure_installed` finishes.
local on_made_config = function(server_name)
  local config_opts, _server_def = mason_lspconfig.get_docs(server_name)
  if config_opts then
    require("lspconfig")[server_name].setup(config_opts)
  end
end

---Handlers run after each server is installed (or updated). This means svelte, tsls etc. get
---their *specific* settings applied the moment those servers appear in `ensure_installed`.
mason_lspconfig.setup_handlers({
  function() on_made_config("ts_ls")     end,   -- TypeScript / JavaScript
  function() on_made_config("cssls")    end,   -- CSS (SCSS/LESS)
  function() on_made_config("html")     end,   -- HTML5
  function() on_made_config("tailwindcss") end,-- Tailwind (only meaningful when ts_ls is also running)
})
