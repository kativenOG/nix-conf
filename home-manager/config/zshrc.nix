{config, pkgs, ...}:
{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    zsh-autoenv.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
       enable = true;
       theme = "lambda";
       plugins = [
         "git"
         "vi-mode"
         "sudo"
         "colored-man-pages"
         "node"
       ];
    };
    zshrcExtra = (builtins.readFile ./zshrc); 
  };
}
