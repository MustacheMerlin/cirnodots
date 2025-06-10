{ config, pkgs, ... }:

{
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "lynn" ];
#  virtualisation.docker.rootless = {
#    enable = true;
#    setSocketVariable = true;
#  }; # enable with systemctl --user enable --now docker and check with systemctl --user status docker
#
#  virtualisation.docker.daemon.settings = {
#    userland-proxy = false;
#    experimental = true;
#    metrics-addr = "0.0.0.0:9323";
#    ipv6 = true;
#    fixed-cidr-v6 = "fd00::/80";
#    data-root = "/mnt/bigchungus/docker";
#  };

}
