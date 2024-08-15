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
    };
    initExtra= ''
# Open neovim by connection to a nvim server inside a container
dvim() { 
  if [[ "$1" == "--help" || "$1" == "-h" ]]; then
		echo -e "Usage: dvim <port_name> specific the port that is being exposed by the nvim server inside the docker container"
	else
		server_ip="localhost:$1"
		nvim --remote-ui --server $server_ip 
  fi
}

# Create a dir and create a container from a image that uses the dir as his binded volume
dcreate() { # dcreate <volume_name> <image_name> <container_name>
  if [[ "$1" == "--help" || "$1" == "-h" ]]; then
		echo -e "Usage: dcreate <volume_name> <image_name> <container_name>\nCreate a dir and create a container from a image that uses the dir as his binded volume.\nIf a directory with the same name already exists it is used as the binded volume for the container.\nRemember that port 9321 is always remapped for neovim."
	elif [[ -z "$1" || -z "$2" || -z "$3" ]]; then 
		echo -e "one of the parameter is not defined, remember:\n\t\$1: volume_name\n\t\$2: image_name\n\t\$3: container_name\n"
  else
		mkdir -p "$1" 
		docker run -it -p 9321:9321 --name "$3" --volume $(pwd)/"$1":/data "$2" 
	fi
}

# Connect to a docker container tty 
dconnect() { # dcreate <volume_name> <image_name> <container_name>
  if [[ -z "$1" ]]; then
		echo -e "Usage: dconnect <container_name>\nOpen a bash shell connection to a container virtual tty."
	  
  else
		# FOUND is used to decide if we have to also search considering stopped containers or not:
		FOUND = 0
		if docker ps | grep -q $1; then
				FOUND=1
		fi

		# Start stopped container 
		if  [ "$FOUND" -eq 0 ] && docker ps -a | grep -q $1; then  # Start the stopped container 
				docker start $1 
				docker exec -it $1 /bin/sh
		elif  [ "$FOUND" -eq 1 ]; then # And connect to it :) 
				docker exec -it $1 /bin/sh
		else 
				echo -e "no container named $1 has been found."
		fi
	fi
}
    '';
  };
}
