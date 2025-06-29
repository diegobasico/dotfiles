return {
  "mg979/vim-visual-multi",
  branch = "master",
  init = function()
    -- Optional: disable LazyVim keymaps that might conflict
    vim.g.VM_leader = "\\"
  end,
}
