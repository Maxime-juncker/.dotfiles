local languages = {
  "lua",
  "javascript",
  "typescript",
  "html",
  "css",
  "json",
  "svelte",
}

require("nvim-treesitter").setup({})
require("nvim-treesitter").install(languages)

-- Keep Treesitter indentation opt-in. Native/filetype indentation remains in
-- control until this switch is enabled, or a filetype is explicitly opted in.
local use_treesitter_indentation = false
local treesitter_indent_filetypes = {
  -- javascript = true,
  -- lua = true,
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = languages,
  desc = "Enable Treesitter highlighting",
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)

    local use_indentation = treesitter_indent_filetypes[args.match]
    if use_indentation == nil then
      use_indentation = use_treesitter_indentation
    end

    if use_indentation then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
