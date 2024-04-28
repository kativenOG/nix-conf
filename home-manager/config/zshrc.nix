{config, pkgs, ...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion=true;
    #autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
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
   shellAliases= {
	lvim="nvim";
	neofetch="neofetch --kitty --size none";
	moon="curl wttr.in/Moon";
	sun="curl wttr.in/Verona";
	reboot="systemctl reboot";
	poweroff="systemctl poweroff";
	ls="exa --color=auto";
	ll="exa-alh";
	l="exa -lh";
	clera="clear";
	clrae="clear";
	space_left="df -h";
	restart_nm="sudo systemctl restart nm-priv-helper.service";
	battery="upower -i `upower -e | grep 'BAT'` | grep percentage";
	battery_status="upower -i `upower -e | grep 'BAT'` ";
	set_brightness="sudo brightnessctl --class='backlight' s $1";
	storage="ncdu";
	dc="sudo docker-compose -p ono -f docker-compose.yml -f docker-compose.plugins.yml ";
    };
    initExtra= ''
      export PATH=$PATH:~/.local/bin
    '';
  };
}
