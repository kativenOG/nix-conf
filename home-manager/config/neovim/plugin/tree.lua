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
  filters = {
    dotfiles = true,
  },
})

-- Key Mappings
map = vim.api.nvim_set_keymap
map("n", "<leader>e", ":NvimTreeToggle<cr>", {silent = true })
