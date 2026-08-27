local lint = require("lint")

lint.linters_by_ft = {
  javascript = { "eslint" },
  javascriptreact = { "eslint" },
  typescript = { "eslint" },
  typescriptreact = { "eslint" },
  svelte = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  desc = "Run linters after entering or saving a buffer",
  callback = function()
    lint.try_lint()
  end,
})

lint.try_lint()
