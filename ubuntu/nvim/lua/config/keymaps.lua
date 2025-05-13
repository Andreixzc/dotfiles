-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hererocks
--
--

-- vim.keymap.set("n", "<F3>", function()
--   require("conform").format({ async = true, lsp_fallback = true })
-- end, { noremap = true, silent = true, desc = "Format buffer" })

vim.keymap.set("n", "<F3>", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { noremap = true, silent = true, desc = "Format buffer" })
