local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        javascript = { "oxfmt", "prettier" },
        javascriptreact = { "oxfmt", "prettier" },
        typescript = { "oxfmt", "prettier" },
        typescriptreact = { "oxfmt", "prettier" },
        svelte = { "oxfmt", "prettier" },
        html = { "oxfmt", "prettier" },
        css = { "oxfmt", "prettier" },
        json = { "oxfmt" },
        jsonc = { "oxfmt" },
        lua = { "stylua" },
    },
    format_on_save = {
        timeout_ms = 1000,
        -- Use the configured formatter first; use an LSP formatter only if no
        -- dedicated formatter is available for the current buffer.
        lsp_format = "fallback",
    },
})

vim.keymap.set("n", "<leader>lf", function()
    conform.format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })
