{config, pkgs, ...}:

{
  programs.neovim = 
  {
    enable = true;
    defaultEditor = true; 
	# Bro Im really dumb 
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      wl-clipboard

	  # All the language servers that allow me to write bad code every day of the week 
	  gopls 
	  nodePackages.pyright
	  nodePackages.bash-language-server
	  yaml-language-server
      lua-language-server
      rnix-lsp
    ];

    plugins = with pkgs.vimPlugins; [
      # Skill issues 
      luasnip
      neodev-nvim 

	  # Need this for lualine, nvim-tree and alpha
      nvim-web-devicons 

	  # Landing page
	  plenary-nvim # dependecy
	  {
        plugin = alpha-nvim;
        type = "lua";
        config = ''${builtins.readFile ./neovim/plugin/alpha.lua}'';
      }

	  # Git integration
      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = ''${builtins.readFile ./neovim/plugin/git.lua}'';
	  }

	  # Toggle term
      {
        plugin = toggleterm-nvim;
        type = "lua";
        config = '' ${builtins.readFile ./neovim/plugin/term.lua}'';
      }

      # Statusline
      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''${builtins.readFile ./neovim/plugin/lualine.lua} '';
      }

      # Theme
      {
        plugin = tokyonight-nvim;
        config = "colorscheme tokyonight-moon";
      }

      # LSP 
      cmp-nvim-lsp
      cmp_luasnip
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''${builtins.readFile ./neovim/plugin/lsp.lua} '';
      }

	  # Better Buffer Deletion
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
	
	  # UFO Folding plugin
	  promise-async # ufo dependecie
	  {
       plugin= nvim-ufo;
	   type = "lua";
	   config = ''
			local ufo = require("ufo")

			-- Nvim lsp as LSP client
			-- Tell the server the capability of foldingRange,
			-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.foldingRange = {
			    dynamicRegistration = false,
			    lineFoldingOnly = true
			}
			local language_servers = require("lspconfig").util.available_servers()
			for _, ls in ipairs(language_servers) do
			    require('lspconfig')[ls].setup({
			        capabilities = capabilities
			    })
			end

			-- Keybindings
			vim.keymap.set('n', 'zR', ufo.openAllFolds)
			vim.keymap.set('n', 'zM', ufo.closeAllFolds)

			ufo.setup{}
	   '';
	  }
	   
	  # File explorer 
	  {
        plugin = nvim-tree-lua;
        type = "lua";
        config = ''${builtins.readFile ./neovim/plugin/tree.lua} '';

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

    # Lua file general stuff 
    extraLuaConfig = ''

      ${builtins.readFile ./neovim/options.lua}

    '';
  };

}

