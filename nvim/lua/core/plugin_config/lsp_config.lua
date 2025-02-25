require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "clangd" }, -- Automatically install clangd
    })

require("lspconfig").clangd.setup({
      cmd = { "clangd", "--background-index" },
      filetypes = { "c", "cpp", "objc", "objcpp" },
    })

