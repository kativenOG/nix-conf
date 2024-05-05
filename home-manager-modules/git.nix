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
		  # Always fetch with ssh from github, so you have access rights
      	  "git@github.com:" = {
      		 insteadOf = "https://github.com/";
      	  };
      	};
	  };
    };
}
