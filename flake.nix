{
    description = "My NixOS config(maybe)";

    inputs = {
	nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
	nixpkgs-master.url = "github:nixos/nixpkgs?ref=master";
	nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.11";
	home-manager = {
	    url = "github:nix-community/home-manager";
	    inputs.nixpkgs.follows = "nixpkgs";
	};
    };

    outputs = { self, nixpkgs, nixpkgs-master, nixpkgs-stable, home-manager, ... } @ inputs : 
  
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
