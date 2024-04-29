{config, pkgs, ...}:
{
    programs.git = {
      enable = true;
      userName  = "kativenOG";
      userEmail = "mangrella.andrea@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = false;
      };
	  extraConfig = {
	  	url = {
      	  "git@github.com" = {
      		 insteadOf = "https://github.com/";
      	  };
      	};
	  };
    };
}
