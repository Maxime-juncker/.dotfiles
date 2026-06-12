-- lua/lsp/typescript.lua

vim.lsp.config("ts_ls", {
  root_dir = vim.fs.root(0, {
    "tsconfig.json",
    "jsconfig.json",
    "package.json",
    ".git",
  }),

  single_file_support = true,

  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },

    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
  },
})

vim.lsp.enable("ts_ls")
