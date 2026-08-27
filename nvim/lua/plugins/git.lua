return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("config.gitsigns")
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewFileHistory",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
    },
    keys = {
      {
        "<leader>gd",
        "<cmd>DiffviewOpen<CR>",
        desc = "Open Git diff view",
      },
      {
        "<leader>gq",
        "<cmd>DiffviewClose<CR>",
        desc = "Close Git diff view",
      },
      {
        "<leader>gh",
        "<cmd>DiffviewFileHistory %<CR>",
        desc = "Show file Git history",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("config.diffview")
    end,
  },
}
