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
          #p.tree-sitter-yaml
          #p.tree-sitter-proto
          #p.tree-sitter-dockerfile
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

