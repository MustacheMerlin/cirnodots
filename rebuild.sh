TODAY=$(date '+%a %F')
GIT_MESSAGE=$(git log -1 --pretty=%s | cut -c -80)
export NIXOS_LABEL="CIRNO NIXOS $TODAY....$GIT_MESSAGE"
export NIXOS_LABEL=$NIXOS_LABEL
export NIXOS_LABEL="${NIXOS_LABEL// /_}"
export NIXOS_LABEL="${NIXOS_LABEL//[^a-zA-Z0-9_:\-\.]/}"
export NIXOS_LABEL_VERSION=$NIXOS_LABEL
sudo nixos-rebuild switch --flake .#cirno

