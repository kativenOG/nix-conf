require("nvim-tree").setup({
  hijack_cursor = false,
  view = {
    width = 35,
  },
  renderer = {
	indent_markers = {
      enable = true,
    },
  },
  update_focused_file = {
	enable = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", {silent = true })
