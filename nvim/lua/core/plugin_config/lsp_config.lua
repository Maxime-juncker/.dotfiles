require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "clangd" }, -- Automatically install clangd
})
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("lspconfig").clangd.setup({
    on_attach = function(client, bufnr)
        local opts = { noremap=true, silent=true, buffer=bufnr }
        -- Go to Definition
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        -- Go to Declaration
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        -- Go to Implementation
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        -- Go to Type Definition
        vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, opts)
        -- Show Hover Docs
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        -- Show References
		vim.keymap.set('n', '<leader>fr', require('telescope.builtin').lsp_references, { noremap=true, silent=true, buffer=bufnr, desc="find reference" })
    end,
    capabilities = capabilities,  -- Corrected spelling
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--query-driver=/usr/bin/g++",
		"--index",                      
        "--index-file=.clangd-index",   
        "--pch-storage=memory",         
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
})
require'lsp_signature'.setup({
    bind = true,
    floating_window = true,  -- Show popup window for function signatures
    hint_prefix = ""
})
