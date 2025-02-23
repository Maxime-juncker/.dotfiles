require("mjuncker")

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "clangd" }, -- Install clangd for C/C++
}

-- LSP Config
local lspconfig = require("lspconfig")
lspconfig.clangd.setup {}

require'lspconfig'.clangd.setup{
    cmd = {
        "clangd",
        "--background-index",
        "--suggest-missing-includes"
    }
}
