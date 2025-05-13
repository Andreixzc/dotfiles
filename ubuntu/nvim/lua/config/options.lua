-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.colorcolumn = "80" -- Show ruler at 80 characters
vim.g.python_black_args = { "--line-length", "79" } -- Set Black formatting rules
vim.g.python_flake8_args = { "--max-line-length", "79" } -- Set Flake8 rules
vim.opt.relativenumber = false
