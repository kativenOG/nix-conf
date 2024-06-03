{config, pkgs, ...}:
{
  programs.waybar.enable = true;
   
  programs.waybar.settings = {
  bottomBar = {
    layer= "top";
    position= "bottom";

    modules-center= ["temperature" "memory" "cpu" "disk"];
    modules-left= ["custom/nixosIcon" "sway/workspaces"];
    modules-right= [ "pulseaudio" "network" "battery"];

		# Left 
    "custom/nixosIcon" = {
		  format = "";
		  on-click = "home-manager switch";
		 };

    "sway/workspaces"= {
      disable-scroll= true;
			format= "{icon}";
      all-outputs= true;
    };


		# Middle
    "memory" = {
      	interval = 5;
      	format = " {}%";
        tooltip = true;
    };
		"temperature"= {
		    "critical-threshold"= 80;
		    "format-critical"= "{icon} {temperatureC}°C";
		    "format"= "{icon} {temperatureC}°C";
		    "format-icons"= [""  "" ""];
				"interval" = 2;
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

		# Right
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
 	 #custom-nixosIcon {
     color: #eceff4;
	 	margin: 5px;
	 	border-radius: 10px;
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
	 
   #temperature,#disk,#cpu,#memory,#battery,#network,#pulseaudio {
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
	 
	 #temperature, #cpu, #memory, #disk, #network {
	 	color: #d08770;
	 }
   
   '';
}

