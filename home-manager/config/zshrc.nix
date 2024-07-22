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
	    neofetch="fastfetch";
			sun="curl wttr.in/Verona";
	    moon="curl wttr.in/Moon";
			wltree="swaymsg -t get_tree";
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
		  # dcreate=""; 
    };
    initExtra= ''
export PATH=$PATH:~/.local/bin:~/go/bin
GOPRIVATE="github.com/ONO-Lean-Logistics/*"
export CGO_ENABLED=1


# Create a dir and create a container from a image that uses the dir as his binded volume
dcreate() { # dcreate <volume_name> <image_name> <container_name>
  if [[ "$1" == "--help" || "$1" == "-h" || -z "$1" ]]; then
		echo -e "Usage: dcreate <volume_name> <image_name> <container_name>\nCreate a dir and create a container from a image that uses the dir as his binded volume.\nIf a directory with the same name already exists it is used as the binded volume for the container."
	elif [[ -z "$1" || -z "$2" || -z "$3" ]]; then 
		echo -e "one of the parameter is not defined, remember:\n\t\$1: volume_name\n\t\$2: image_name\n\t\$3: container_name\n"
  else
		mkdir -p "$1" 
		docker run -it --name "$3" --volume $(pwd)/"$1":/data "$2" /bin/sh
	fi
}
    '';
  };
}
