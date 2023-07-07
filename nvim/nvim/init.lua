vim.opt.autoindent = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrollbind = false
vim.opt.syntax = "on"
vim.opt.tabstop = 2

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
