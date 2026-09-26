{
  description = "A very basic flake";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations = {
      vm-devbox = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/vm-devbox/hardware-configuration.nix
	  ./hosts/vm-devbox/default.nix
	  ./common/default.nix
        ];
    };
  };
}
