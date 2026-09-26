{
  description = "JayDee personal flake";
  
  inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      home-manager.url = "github:nix-community/home-manager";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      vm-devbox = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit home-manager; };
        modules = [
          ./hosts/vm-devbox/hardware-configuration.nix
          ./hosts/vm-devbox/default.nix
          ./common/default.nix
          ./common/home-manager.nix
        ];
      };
    };
  };
}
