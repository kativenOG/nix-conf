{
  description = "Kati Nixos Configuration Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager?ref=release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    home-manager-unstable.url = "github:nix-community/home-manager";
    home-manager-unstable.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = { nixpkgs, home-manager, nixpkgs-unstable, home-manager-unstable }@inputs: {
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
				  specialArgs = { inherit inputs; };
          modules = [
            ./hosts/laptop/configuration.nix
					  ./nixos-modules/main.nix
          ];
        };

        work = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
				  specialArgs = { inherit inputs; };
          modules = [
            ./hosts/work/configuration.nix
					  ./nixos-modules/main.nix
          ];
        };

				/* 
        server = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/server/configuration.nix
            home-manager.nixosModules.home-manager
          ];
        }; 
				*/
      };

      hmModules = {
        "kativen@laptop"= {
						imports = [ 
							 ./hosts/laptop/home.nix 
							 ./home-manager-modules/main.nix 
						];
          	_module.args = { inherit inputs; };
        };

        "kativen@work" = {
						imports = [ 
							./hosts/work/home.nix 
						  ./home-manager-modules/main.nix 
						];
          	_module.args = { inherit inputs; };
        };

				# "kativen@server" = {
        # 	imports = [ 
				# 		./hosts/work/home.nix 
				# 	  ./home-manager-modules/main.nix 
				# 	];
    		# 	_module.args = { inherit inputs; };
    		# };

      };
    };
}
