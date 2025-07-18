{
    description = "My NixOS config(maybe)";

    inputs = {
	nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
	nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.11";
	home-manager = {
	    url = "github:nix-community/home-manager";
	    inputs.nixpkgs.follows = "nixpkgs";
	};
	/*
	hyprland.url = "github:hyprwm/Hyprland";
	hyprland-plugins = {
	    url = "github:hyprwm/hyprland-plugins";
	    inputs.nixpkgs.follows = "nixpkgs";
	};
	flake-parts.url = "github:hercules-ci/flake-parts";
	*/
	maomaowm.url = "github:DreamMaoMao/maomaowm";
    };

    outputs = { self, nixpkgs, nixpkgs-stable, home-manager, flake-parts, maomaowm, ... } @ inputs : 
  
    let 
	system = "x86_64-linux";
	lib = nixpkgs.lib;
	specialArgs = { inherit system inputs; };

    in 
    {
	nixosConfigurations = {
	    tsuki = lib.nixosSystem {
		inherit specialArgs;                        #This would make input available anywhere in NixOS config
		modules = [
		    # Tsuki configuration.nix
		    ./hosts/tsuki/configuration.nix

		    inputs.maomaowm.nixosModules.maomaowm 

		    home-manager.nixosModules.home-manager {
			home-manager.useGlobalPkgs = true;
			home-manager.useUserPackages = true;
			home-manager.backupFileExtension = "backup";

			home-manager.users.vaayuu = import ./home-manager/home.nix;
		    } 
		];
	    };
	};
    };
}
