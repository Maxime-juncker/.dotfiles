local wk = require("which-key")

wk.setup({
	preset = 'helix'
})

wk.add({
  { "<leader>f", group = "Find" },
  { "<leader>b", group = "Buffer" },
  { "<leader>e", group = "Explorer" },
  { "<leader>g", group = "Git" },
  { "<leader>h", group = "Hunk" },
  { "<leader>l", group = "LSP" },
  { "<leader>u", group = "UI" },
})
