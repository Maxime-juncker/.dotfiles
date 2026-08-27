local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    svelte = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    json = { "prettier" },
    lua = { "stylua" },
  },
  format_on_save = {
    timeout_ms = 1000,
    -- Use Prettier/Stylua first; use an LSP formatter only if no dedicated
    -- formatter is available for the current buffer.
    lsp_format = "fallback",
  },
})

vim.keymap.set("n", "<leader>lf", function()
  conform.format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })
