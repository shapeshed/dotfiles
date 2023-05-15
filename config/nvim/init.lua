local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Set leader to SPACE, needed before lazy

require("lazy").setup("plugins")

require("set")
-- require("shapeshed.keymaps")
require("statusline")
-- require("shapeshed.autocmd")
-- require("shapeshed.filetype")
