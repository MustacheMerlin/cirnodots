{ config, pkgs, ... }:

{
  programs.gamemode.enable = true;
  environment.systemPackages = with pkgs; [
    steam
    discord
    mangohud
    gamescope
    steam-run
    umu-launcher
  ];
}
