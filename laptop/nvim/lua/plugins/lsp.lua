return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "off", -- Desliga verificação de tipo
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly", -- Só checa arquivos abertos
                extraPaths = {
                  -- Add your project's root directory here
                  vim.fn.getcwd(),
                },
              },
            },
          },
        },
      },
    },
  },
}