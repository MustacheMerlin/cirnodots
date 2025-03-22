{ config, pkgs, ... }:

{
  imports = [
   ./hardware-configuration.nix
   ./modules/nvidia-drivers.nix
   ./modules/cinnamon.nix
   ./modules/locale.nix
   ./modules/nixld.nix
   ./modules/pipewire.nix
   ./modules/xbone-controller.nix
   ./modules/terminal-programs.nix
   ./modules/gaming-pkgs.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "split_lock_detect=off" ];
  networking.hostName = "Cirno";
  networking.networkmanager.enable = true;

  users.users.lynn = {
    isNormalUser = true;
    description = "Lynn";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };


}
