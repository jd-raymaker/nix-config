# Personal nix-config

## Prerequisites

### Enable experimental features nix and flakes
`/etc/nixos/configuration.nix`
```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```
Then rebuild and switch
`sudo nixos-rebuild switch`
