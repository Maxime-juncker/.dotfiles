return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("config.lsp")
    end,
  },
  {
    "mason-org/mason.nvim",
    lazy = false,
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "tailwindcss",
        "html",
        "svelte",
        "ts_ls",
        "jsonls",
        "lua_ls",
      },
      automatic_enable = true,
    },
  },
}
