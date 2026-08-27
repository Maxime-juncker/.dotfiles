return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = {
      "NvimTreeToggle",
      "NvimTreeFocus",
      "NvimTreeFindFile",
    },
    keys = {
      {
        "<leader>e",
        function()
          require("nvim-tree.api").tree.toggle({ focus = true })
        end,
        desc = "Toggle file tree",
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
      require("config.filetree")
    end,
  },
}
