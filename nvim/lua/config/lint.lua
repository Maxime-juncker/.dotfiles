local lint = require("lint")

lint.linters_by_ft = {
  javascript = { "eslint" },
  javascriptreact = { "eslint" },
  typescript = { "eslint" },
  typescriptreact = { "eslint" },
  svelte = { "eslint" },
}

local function run_linter()
  lint.try_lint(nil, {
    -- Keep ESLint configured globally, but skip it when the project does not
    -- provide an executable and none is available on PATH.
    filter = function(linter)
      local command = type(linter.cmd) == "function" and linter.cmd() or linter.cmd
      return type(command) == "string" and vim.fn.executable(command) == 1
    end,
  })
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  desc = "Run linters after entering or saving a buffer",
  callback = function()
    run_linter()
  end,
})

run_linter()
