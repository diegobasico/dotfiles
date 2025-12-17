return {
  -- Ensure CSS LSP works with QSS
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {
          filetypes = { "css", "scss", "less", "qss" },
        },
      },
    },
  },

  -- Configure formatter for QSS files with CSS parser
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        qss = { "prettier" },
      },
      formatters = {
        prettier = {
          prepend_args = function(self, ctx)
            -- Use CSS parser for .qss files
            if vim.fn.expand("%:e") == "qss" then
              return { "--parser", "css" }
            end
            return {}
          end,
        },
      },
    },
  },
}
