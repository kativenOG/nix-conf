
require("toggleterm").setup{
      -- size can be a number or function which is passed the current terminal
      size = 20,
      -- open_mapping = "",
      hide_numbers = true, 
      autochdir = true, 
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      persist_size = true,
      -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
      close_on_exit = true, -- close the terminal window when the process exits
       -- Change the default shell. Can be a string or a function returning a string
      shell = vim.o.shell,
      auto_scroll = true, -- automatically scroll to the bottom on terminal output
      -- This field is only relevant if direction is set to 'float'
      float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border =  'curved',
        winblend = 3,
      },
      winbar = {
        enabled =  false,
        name_formatter = function(term) --  term: Terminal
          return term.name
        end
      },
    }

-- Close Current Buffer 
map("n", "<A-2>", ":ToggleTerm direction=tab <cr>", {remap = true, silent = true })
-- Close Current Buffer and Ignore changes 
map("n", "<A-3>", ":ToggleTerm direction=float <cr>", {remap = true, silent = true })

