{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    steam
    discord
    mangohud
    gamemode
    gamescope
    steam-run
  ];
}
