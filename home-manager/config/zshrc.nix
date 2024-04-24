{config, pkgs, ...}:
{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
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
   shellAlias= {
	vim="nvim";
	neofetch="neofetch --kitty --size none";
	moon="curl wttr.in/Moon";
	sun="curl wttr.in/Verona";
	reboot='systemctl reboot';
	poweroff='systemctl poweroff';
	..="cd ..";
	...="cd ../..";
	....="cd ../../..";
	.....="cd ../../../..";
	ls="ls --color=auto";
	ll="ls -alh";
	l="ls -lh";
	clera="clear";
	clrae="clear";
	space_left="df -h";
	restart_nm="sudo systemctl restart nm-priv-helper.service";
	battery="upower -i `upower -e | grep 'BAT'` | grep percentage";
	battery_status="upower -i `upower -e | grep 'BAT'` ";
	set_brightness="sudo brightnessctl --class='backlight' s $1";
	storage='ncdu';
	dc="sudo docker-compose -p ono -f docker-compose.yml -f docker-compose.plugins.yml ";
    }
  };
}
