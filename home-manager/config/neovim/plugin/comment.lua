require('Comment').setup(
  {
      sticky = true,  ---the cursor stays at its position
      padding = true, ---space between comment and the line

      --- Keybindings
      toggler = {
          line = '<leader>//', ---Line-comment toggle keymap
          block ='<leader>..', ---Block-comment toggle keymap
      },
      opleader = {
          line = '<leader>/',
          block = '<leader>.',
      },

      ---Enable keybindings
      mappings = {
          basic = true,
      },
  })
