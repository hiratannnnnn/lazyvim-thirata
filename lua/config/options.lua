-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false
vim.opt.wrap = false
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.guicursor = vim.o.guicursor:gsub("t:[^,]*", "t:block-blinkon600-blinkoff600-TermCursor")

if vim.g.neovide then
	vim.g.neovide_theme = "dark"
	vim.o.background = "dark"
	vim.o.guifont = "JetBrainsMono Nerd Font Mono:h14"
end
