{config, pkgs, ...}:

{
  programs.neovim = 
  {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true; 

    extraPackages = with pkgs; [
      lua-language-server
      rnix-lsp
      wl-clipboard
    ];

    plugins = with pkgs.vimPlugins; [
      # Skill issues 
      luasnip
      neodev-nvim 

      # Statusline
      nvim-web-devicons
      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''${builtins.readFile ./neovim/plugin/lualine.lua} '';
      }

      # Theme
      {
        plugin = nord-nvim;
        config = "colorscheme nord";
      }

      # LSP 
      cmp-nvim-lsp
      cmp_luasnip
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''${builtins.readFile ./neovim/plugin/lsp.lua} '';
      }
	  # Better Buffer del
      {
        plugin = nvim-bufdel;
        type = "lua";
		config = ''
			require('bufdel').setup {
			  next = 'tabs',
			  quit = true,  -- quit Neovim when last buffer is closed
			}
			-- Close Current Buffer 
			map("n", "<leader>c", ":BufDel <cr>", {remap = true, silent = true })
			-- Close Current Buffer and Ignore changes 
			map("n", "<leader>C", ":BufDel! <cr>", {remap = true, silent = true })
		'';
	  }
      # Comment Shortcuts 
      {
        plugin = comment-nvim;
        type = "lua";
        config = ''${builtins.readFile ./neovim/plugin/comment.lua} '';
      }
      # Auto Completion 
      friendly-snippets # remember that flutter is not added by default
      {
        plugin = nvim-cmp;
        type = "lua";
        config = ''${builtins.readFile ./neovim/plugin/cmp.lua} '';
      }
	  # Maybe I can do this with telescope 
      {
      	plugin=bufferline-nvim;
	    type = "lua";
	    config = ''
			require("bufferline").setup{}
	    	vim.api.nvim_set_keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
	    	vim.api.nvim_set_keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
	    '';
      }

      # Telescope 
      telescope-fzf-native-nvim
      {
        plugin = telescope-nvim;
        type = "lua";
        config = ''${builtins.readFile ./neovim/plugin/telescope.lua} '';
      }

      # Treesitter 
      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-go
          p.tree-sitter-json
          p.tree-sitter-yaml
          p.tree-sitter-proto
          p.tree-sitter-dockerfile
        ]));
        type = "lua";
        config = ''${builtins.readFile ./neovim/plugin/treesitter.lua} '';
      }
      
    ];

    # Lua file general stuff stuff 
    extraLuaConfig = ''

      ${builtins.readFile ./neovim/options.lua}

    '';
  };

}

