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

vim.keymap.set('n', 'LB', 'o<Esc>k', { noremap = true, silent = true, desc = 'Blank line below' })
vim.keymap.set('n', 'LU', 'O<Esc>j', { noremap = true, silent = true, desc = 'Blank line above' })
vim.keymap.set('n', '<C-f>', '<C-f>zz', { noremap = true, silent = true, desc = 'Page down (centered)' })
vim.keymap.set('n', '<C-b>', '<C-b>zz', { noremap = true, silent = true, desc = 'Page up (centered)' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true, desc = 'Half page down (centered)' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true, desc = 'Half page up (centered)' })
vim.keymap.set('v', 'cpc', '"+y', { noremap = true, silent = true, desc = 'Yank to system clipboard' })
vim.keymap.set('v', 'cpp', '"+p', { noremap = true, silent = true, desc = 'Paste from system clipboard' })

vim.opt.rtp:prepend(lazypath)
vim.opt.guifont='CodeNewRoman'

vim.cmd(":set number")

vim.wo.relativenumber = true

-- @l on a word: log it as  console.log('word:', word)
local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

vim.fn.setreg("l", "yiwoconsole.log('" .. esc .. "pa:', " .. esc .. "pa)" .. esc)

require("vim-options")
require("lazy").setup("plugins")
