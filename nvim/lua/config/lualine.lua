require("lualine").setup({
  options = {
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(mode)
          return mode:lower()
        end,
      },
    },
    lualine_b = {
      { "branch", icon = "" },
      {
        "diff",
        symbols = { added = "+", modified = "~", removed = "-" },
      },
    },
    lualine_c = {
      { "filename", path = 0 },
    },
    lualine_x = {
      "encoding",
      "fileformat",
      { "filetype", icon = true },
    },
    lualine_y = {
      "progress",
    },
    lualine_z = {
      "location",
    },
  },
})
