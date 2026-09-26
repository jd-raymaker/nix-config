{ config, pkgs, ... }:

{
  services.xserver.libinput.enable = true;
  services.printing.enable = true;
  networking.hostName = "swifty";
}

