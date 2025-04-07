{ config, pkgs, ... }:

{
  imports = [
   ./hardware-configuration.nix
   ./modules/nvidia-drivers.nix
   #./modules/cinnamon.nix
   #./modules/hyprland.nix
   ./modules/plasma.nix
   ./modules/locale.nix
   ./modules/nixld.nix
   ./modules/pipewire.nix
   ./modules/xbone-controller.nix
   ./modules/terminal-programs.nix
   ./modules/gaming-pkgs.nix
   ./modules/openrgb.nix
   ./modules/coolercontrol.nix
   ./modules/vr.nix
   ./modules/corectrl.nix
   ./modules/sunshine.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "split_lock_detect=off" ];
  boot.kernelModules = ["amdgpu"];

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  hardware.opengl.extraPackages = with pkgs; [
    rocmPackages.clr.icd
  ];
  #environment.variables.AMD_VULKAN_ICD = "RADV";
  environment.variables.__NV_PRIME_RENDER_OFFLOAD = 0;

  networking.hostName = "Cirno";
  networking.networkmanager.enable = true;

  home-manager.backupFileExtension = "backup";

  users.users.lynn = {
    isNormalUser = true;
    description = "Lynn";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      clinfo
      koboldcpp
      vulkan-tools
      protonvpn-gui
    ];
  };

  environment.systemPackages = with pkgs; [ lact ];
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];

  security.polkit.enable = true;

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 5001 5002 8188 3216 ];
  networking.firewall.allowedUDPPorts = [ 5001 5002 8188 3216 ];

  hardware.steam-hardware.enable = true;

  environment.etc."current-system-packages".text =
    let
      packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
      sortedUnique = builtins.sort builtins.lessThan (pkgs.lib.lists.unique packages);
      formatted = builtins.concatStringsSep "\n" sortedUnique;
    in
      formatted;
}
