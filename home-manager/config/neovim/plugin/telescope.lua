-- STD 
require('telescope').setup({
	extensions = {
    	fzf = {
      	fuzzy = true,                    -- false will only do exact matching
      	override_generic_sorter = true,  -- override the generic sorter
      	override_file_sorter = true,     -- override the file sorter
      	case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    	}
  	}
})

-- Keybindings 
local map = vim.keymap.set
local tsbuiltin = require('telescope.builtin')
local actions = require("telescope.actions")

-- Essential 
map('n', '<leader>f', tsbuiltin.find_files, {})
-- Buffers 
map('n', '<leader>b', tsbuiltin.buffers, {}) -- Open buffer lists 
map('n', '<leader>o', tsbuiltin.oldfiles, {}) -- Open Oldfiles list

-- Native sorter for better performances 
require('telescope').load_extension('fzf')
