local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
  tailwindcss = {},
  html = {},
  svelte = {},
  ts_ls = {},
  jsonls = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
}

for server, settings in pairs(servers) do
  vim.lsp.config(server, vim.tbl_deep_extend("force", {
    capabilities = capabilities,
  }, settings))
end

vim.diagnostic.config({
  severity_sort = true,
  float = {
    border = "rounded",
  },
  virtual_text = true,
  underline = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Set LSP buffer keymaps",
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }
    local map = vim.keymap.set

    map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, {
      desc = "Go to definition",
    }))
    map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, {
      desc = "List references",
    }))
    map("n", "gI", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, {
      desc = "Go to implementation",
    }))
    map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, {
      desc = "Show hover documentation",
    }))
    map("n", "<leader>la", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, {
      desc = "Code action",
    }))
    map("n", "<leader>lr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, {
      desc = "Rename symbol",
    }))
    map("n", "<leader>ld", vim.diagnostic.open_float, vim.tbl_extend("force", opts, {
      desc = "Show line diagnostics",
    }))
    map("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, {
      desc = "Previous diagnostic",
    }))
    map("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, {
      desc = "Next diagnostic",
    }))
  end,
})
