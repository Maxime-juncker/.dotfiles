-- Disable LazyVim's keymaps to avoid the Snacks error
vim.g.lazyvim_disable_keymaps = true
vim.g.lazyvim_check_order = false           
vim.g.lazyvim_disable_keymaps   = true   -- disable keymaps (this you already tried)
vim.g.loaded_lazyvim            = true   -- prevent LazyVim from loading its own config
vim.g.loaded_lazyvim_config     = true   -- disable additional LazyVim configurations
vim.g.loaded_lazyvim_keymaps    = true                                                  

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  install = { colorscheme = { "vscode" } },
  checker = { enabled = true },
})
