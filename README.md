# Personal nix-config

## Prerequisites

### Enable experimental features nix and flakes
`/etc/nixos/configuration.nix`
```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```
Then rebuild and switch
`sudo nixos-rebuild switch`

## How to rebuild for spesific machine
`sudo nixos-rebuild switch --flake .#machine`

Replace `#machine` with one of the `nixosConfigurations` in `flake.nix` (ex. `#vm-devbox`)
