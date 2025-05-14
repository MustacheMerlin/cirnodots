TODAY=$(date '+%a %F')
GIT_MESSAGE=$(git log -1 --pretty=%s | cut -c -80)
sudo NIXOS_LABEL_VERSION="NIXOS $TODAY $GIT_MESSAGE" nixos-rebuild switch --flake .#cirno
