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

-- Delete without copying to register (like your vanilla vim setup)
vim.keymap.set("n", "d", '"_d', { noremap = true, silent = true, desc = "Delete without yanking" })
vim.keymap.set("v", "d", '"_d', { noremap = true, silent = true, desc = "Delete without yanking" })
vim.keymap.set("n", "dd", '"_dd', { noremap = true, silent = true, desc = "Delete line without yanking" })
vim.keymap.set("n", "D", '"_D', { noremap = true, silent = true, desc = "Delete to end of line without yanking" })
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true, desc = "Delete character without yanking" })
vim.keymap.set("n", "X", '"_X', { noremap = true, silent = true, desc = "Delete character backward without yanking" })

-- Keep leader+d for explicit delete without yanking (as backup)
vim.keymap.set("n", "<leader>d", '"_d', { noremap = true, silent = true, desc = "Delete without yanking (explicit)" })
vim.keymap.set("v", "<leader>d", '"_d', { noremap = true, silent = true, desc = "Delete without yanking (explicit)" })

-- If you want to explicitly yank and delete, use leader+x
vim.keymap.set("n", "<leader>x", "d", { noremap = true, silent = true, desc = "Cut (delete and yank)" })
vim.keymap.set("v", "<leader>x", "d", { noremap = true, silent = true, desc = "Cut (delete and yank)" })
