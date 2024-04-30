{config, pkgs, ...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion=true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
       enable = true;
       theme = "lambda";
       plugins = [
         "vi-mode"
         "sudo"
         "node"
       ];
    };
   shellAliases= {
	lvim="nvim";
	neofetch="neofetch --kitty";
	moon="curl wttr.in/Moon";
	sun="curl wttr.in/Verona";
	ls="exa --color=auto";
	ll="exa-alh";
	l="exa -lh";
	clera="clear";
	clrae="clear";
	space_left="df -h";
	battery="acpi";
	set_brightness="sudo brightnessctl --class='backlight' s $1";
	storage="ncdu";
	dc="docker compose -p ono -f docker-compose.yml -f docker-compose.plugins.yml ";
    };
    initExtra= ''
      export PATH=$PATH:~/.local/bin:~/go/bin
	  GOPRIVATE="github.com/ONO-Lean-Logistics/*"
	  export CGO_ENABLED=1
    '';
  };
}
