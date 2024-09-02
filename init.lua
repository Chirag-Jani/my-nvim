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

vim.keymap.set('n', 'lb', 'o<Esc>k', { noremap = true, silent = true })
vim.keymap.set('n', 'lu', 'O<Esc>j', { noremap = true, silent = true })
vim.opt.rtp:prepend(lazypath)
vim.cmd(":set number")
vim.opt.guifont='CodeNewRoman'
vim.wo.relativenumber = true
require("vim-options")
require("lazy").setup("plugins")

