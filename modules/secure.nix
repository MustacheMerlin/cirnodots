{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    keepassxc
    gocryptfs
  ];
}
