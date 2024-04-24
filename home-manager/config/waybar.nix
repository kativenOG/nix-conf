{config, pkgs, ...}:
{
  programs.waybar.enable = true;
   
  programs.waybar.settings = {
  bottomBar = {
    layer= "top";
    position= "bottom";

    modules-center= ["memory" "cpu" "disk"];
    modules-left= ["sway/workspaces"];
    modules-right= [ "pulseaudio" "network" "battery"];
    "sway/workspaces"= {
      disable-scroll= true;
      all-outputs= true;
      format= "{icon}";
      persistent_workspaces= {
      	"1"= [];
      	"2"= [];
      	"3"= [];
      	"4"= [];
      	"5"= [];
      	"6"= [];
      	"7"= [];
      	"8"= [];	
      };
     format-icons= {
        "1"= "1";
        "2"= "2";
        "3"= "3";
        "4"= "4";
        "5"= "5";
        "6"= "6";
        "7"= "7";
        "8"= "8";
      };
    };
    "memory" = {
      	interval = 5;
      	format = " {}%";
        tooltip = true;
    };
    "cpu" = {
      	interval = 5;
      	format = " {usage:2}%";
        tooltip = true;
    };
    "disk" = {
        format = " {free}";
        tooltip = true;
    };
    "battery"= {
        states= {
            good= 80;
            warning= 30;
            critical= 15;
        };
        bat= "BAT0";
        format= "{icon} {capacity}%";
        format-charging= "󰂄 {capacity}%";
        format-plugged= " {capacity}%";
        format-discharging= "󰚦 {capacity}%";
        format-alt= "{icon} {time}";
        format-icons= ["" "" "" "" ""];
    };
    "network"= {
        format= "{ifname}";
        format-wifi= " {essid}";
        format-disconnected= "";
        tooltip-format-wifi= "{signalStrength}%";
        max-length= 20;
    };
    
    "pulseaudio"= {
        format= "{icon} {volume}%";
        format-bluetooth= "{icon} {volume}%";
        format-muted= "󰝟";
        format-icons= {
            headphone= "󰋍";
            default= ["" ""];
        };
        scroll-step= 2;
        on-click= "pulsemixer";
    };
  };

  topBar= {
    layer= "bottom";
    position= "top";
    modules-center= ["clock"];
    "clock"= {
        format= "{:%H:%M}";
    };
  };
  };

  programs.waybar.style = ''
	 * {
	    border: none;
	    border-radius: 0;
	    font-family: monospace;
	    font-size: 14px;
	    min-height: 0;
	}
	
	window#waybar {
	    background: #3b4252;
	    color: white;
	}
	#workspaces {
		background-color: #4c566a;
		margin: 5px;
		margin-left: 10px;
		border-radius: 5px;
	}
	#workspaces button {
	    padding: 0 10px;
	    color: #eceff4;
	}
	
	#workspaces button.focused {
	    color: #2e3440;
	    background-color: #88c0d0;
	    border-radius: 5px;
	}
	
	#workspaces button:hover {
		background-color: #5e81ac;
		border-radius: 5px;
	}
	
        #disk,#cpu,#memory,#battery, #network,#pulseaudio {
		background-color: #4c566a;
		padding: 0px 10px;
		margin: 5px 0px;
	}
	
	
	#custom-power {
		color: #2e3440;
		background-color: #bf616a;
		border-radius: 5px;
		margin-right: 10px;
		margin-top: 5px;
		margin-bottom: 5px;
		margin-left: 0px;
		padding: 0px 10px;
	}

	#clock {
		background-color: #4c566a;
	  color: rgb(240,240,240);
	  padding-left: 5px;
	  padding-right: 5px;
	  padding-top: 1px;
	  padding-bottom: 1px;
		margin-top: 5px;
		margin-bottom: 5px;
	  font-size: 0.38cm;
	}
	
	#battery {
	    color: #a3be8c;
	}

	@keyframes blink {
	    to {
	        background-color: #ffffff;
	        color: black;
	    }
	}
	
	#cpu, #memory, #disk, #network {
		color: #d08770;
	}
  
  '';
}

