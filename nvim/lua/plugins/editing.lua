return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("config.autopairs")
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("config.autotag")
    end,
  },
}
