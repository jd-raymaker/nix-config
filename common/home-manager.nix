{ inputs, pkgs, ... }:

let
  myUser = "jaydee";
  myHome = "/home/${myUser}";
in
{
  imports = [
    # Pulls the module directly out of the flake input
    inputs.home-manager.nixosModules.home-manager
  ];

  # Centralized Home Manager system settings
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    
    # Define your system users here
    users.${myUser} = {
      home.username = myUser;
      home.homeDirectory = myHome;
      home.stateVersion = "26.05";

      programs.kitty = {
        enable = true;
        enableGitIntegration = true;
        themeFile = "base2tone-suburb-dark";
        settings = {
          enable_audio_bell = false;
          background_opacity = 0.95;
	  confirm_os_window_close = 0;
        };
      };

      programs.home-manager.enable = true;
    };
  };
}
