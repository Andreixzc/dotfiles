return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "black" },
      cpp = { "clang_format" },
    },
    formatters = {
      black = {
        prepend_args = { "--line-length", "79" },
      },
      clang_format = {
        command = "clang-format", -- ou caminho absoluto se necessário
      },
    },
  },
}
