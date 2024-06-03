{config, pkgs, ...}:
{
    programs.git = {
      enable = true;
		  delta.enable = true;
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
		delta.options = {
			decorations = {
			  commit-decoration-style = "bold blue box ul";
			  file-decoration-style = "none";
			  file-style = "bold blue ul";
			};
			features = "decorations";
			whitespace-error-style = "22 reverse";
		};	
       
	};       
}
        
