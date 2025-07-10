return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    "mfussenegger/nvim-dap-python",
  },
  event = "VeryLazy",
  opts = {
    name = ".venv", -- optional: name of the venv to search for automatically
    auto_refresh = true,
    dap_enabled = true, -- makes it work with debugpy
    lspconfig = true,   -- automatically configures LSP for selected venv
  },
  keys = {
    { "<leader>vs", "<cmd>VenvSelect<CR>", desc = "Select VirtualEnv" },
    { "<leader>vc", "<cmd>VenvSelectCached<CR>", desc = "Select Cached Venv" },
  },
}
