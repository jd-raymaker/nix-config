{ config, pkgs, ... }:

{
  # Graphics
  hardware.amdgpu.opencl.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  nixpkgs.config.rocmSupport = true;

  # Linux AMDGPU Controller
  environment.systemPackages = with pkgs; [ lact ];
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
  services.lact.enable = true;
}
