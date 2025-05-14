{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    alacritty
    fd
    ripgrep
    tealdeer
    git
    git-lfs
    yazi
    fzf
    jq
    eza
    sshfs
    tmux
    zoxide
    bottom
    vim-full
  ];
}
