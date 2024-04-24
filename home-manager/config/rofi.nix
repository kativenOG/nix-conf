{config, pkgs, ...}:
{
  programs.rofi= {
    enable = true;
    extraConfig={
	modi="window,drun,run";
	width=750;
	show-match=false;
	separator-style="solid";
	hide-scrollbar=true;
    };
    theme = "~/nix-conf/home-manager/config/nord.rasi";
  };
}
