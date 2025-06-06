require('neogit').setup({
  disable_commit_confirmation = true,
  integrations = {
    diffview = true
  },
  sections = {
    untracked = {
      folded = false
    }
  },
  mappings = {
    status = {
      ["q"] = "Close"
    }
  },
  highlight = {
    -- basic defaults; you might need to adjust based on colorscheme
    section = "Title",
    heading = "Statement",
    item = "Normal"
  }
})

