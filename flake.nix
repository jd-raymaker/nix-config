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
          ./users/jaydee/default.nix
          ./users/jaydee/home-manager.nix
        ];
      };
      swifty = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit home-manager; };
        modules = [
          ./common/default.nix
          ./hosts/swifty/default.nix
          ./hosts/swifty/hardware-configuration.nix
          ./dev/docker.nix
          ./dev/vm.nix
          ./users/jaydee/default.nix
          ./users/jaydee/home-manager.nix
        ];
      };
      lenowo = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit home-manager; };
        modules = [
          ./common/default.nix
          ./hosts/lenowo/default.nix
          ./hosts/lenowo/hardware-configuration.nix
          ./dev/docker.nix
          ./users/jaydee/default.nix
          ./users/jaydee/home-manager.nix
        ];
      };
      jd-systems = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit home-manager; };
        modules = [
          ./common/default.nix
          ./hosts/jd-systems/default.nix
          ./hosts/jd-systems/hardware-configuration.nix
          ./dev/docker.nix
          ./dev/vm.nix
          ./users/jaydee/default.nix
          ./users/jaydee/home-manager.nix
        ];
      };
    };
  };
}
