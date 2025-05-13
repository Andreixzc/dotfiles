-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    local filepath = vim.fn.expand("%:p")
    -- Garante que o arquivo seja formatado corretamente
    vim.cmd("silent! write") -- salva antes de rodar
    local result = vim.fn.system({ "/home/andrei/work/venvs/gv3/bin/black", "--line-length", "79", filepath })

    -- Verifica se o comando foi executado corretamente
    if vim.v.shell_error ~= 0 then
      print("Erro Ao formatar")
      print(result) -- exibe a saída do Black para ver o erro
    else
      print("Arq formatado") -- mostra a confirmação
    end

    -- Recarrega o arquivo formatado
    vim.cmd("edit!")
  end,
})
-- template cpp
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.cpp",
  command = "0r ~/.template.cpp",
})

-- selecionar tudo com ctrl A
vim.keymap.set("n", "<C-a>", ":%y+<CR>", { noremap = true, silent = true, desc = "Copy all to clipboard" })

-- comentar com CTRL /
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, desc = "Toggle comment line" })
vim.keymap.set("v", "<C-_>", "gc", { remap = true, desc = "Toggle comment block" })
