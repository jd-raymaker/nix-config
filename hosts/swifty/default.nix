{ config, pkgs, ... }:

{
  services.libinput.enable = true;
  services.printing.enable = true;
  networking.hostName = "swifty";
}

