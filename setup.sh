#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# --- Collect setup info ---

read -rp "Org name (GitHub org for work repos): " ORG
read -rp "Work email for $ORG [marcelo.risoli@$ORG]: " ORG_EMAIL
ORG_EMAIL="${ORG_EMAIL:-marcelo.risoli@$ORG}"
read -rp "Personal name [Marcelo Risoli]: " NAME
NAME="${NAME:-Marcelo Risoli}"
read -rp "Personal email [celorisoli@gmail.com]: " PERSONAL_EMAIL
PERSONAL_EMAIL="${PERSONAL_EMAIL:-celorisoli@gmail.com}"
read -rp "SSH signing key path [~/.ssh/id_ed25519]: " SSH_KEY
SSH_KEY="${SSH_KEY:-~/.ssh/id_ed25519}"

# --- Workspace ---

mkdir -p ~/workspace/mrisoli
mkdir -p ~/workspace/"$ORG"
echo "created ~/workspace/mrisoli and ~/workspace/$ORG"

# --- Gitconfig ---

sed \
  -e "s|{{ORG}}|$ORG|g" \
  -e "s|{{NAME}}|$NAME|g" \
  -e "s|{{DEFAULT_EMAIL}}|$PERSONAL_EMAIL|g" \
  -e "s|{{SSH_KEY_PATH}}|$SSH_KEY|g" \
  "$DOTFILES/.gitconfig.template" > ~/.gitconfig
echo "created ~/.gitconfig"

cat > ~/.gitconfig-"$ORG" <<EOF
[user]
	email = $ORG_EMAIL
	name = $NAME
EOF
echo "created ~/.gitconfig-$ORG"

# --- Nvim submodule ---

git -C "$DOTFILES" submodule update --init --recursive
echo "initialized nvim submodule"

# --- Symlinks ---

_link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -e "$dst" ]; then
    echo "SKIP $dst (exists, not a symlink)"
    return
  fi
  ln -s "$src" "$dst"
  echo "linked $dst -> $src"
}

_link "$DOTFILES/.config/nvim"    ~/.config/nvim
_link "$DOTFILES/.config/mise"    ~/.config/mise
_link "$DOTFILES/.config/ghostty" ~/.config/ghostty
_link "$DOTFILES/.zsh"            ~/.zsh
_link "$DOTFILES/.zshrc"          ~/.zshrc
_link "$DOTFILES/.tool-versions"  ~/.tool-versions

# --- ZSH secrets ---

mkdir -p "$DOTFILES/.zsh/secrets"
touch "$DOTFILES/.zsh/secrets/$ORG.sh"
touch "$DOTFILES/.zsh/secrets/mrisoli.sh"
echo "created .zsh/secrets/$ORG.sh and .zsh/secrets/mrisoli.sh"

echo ""
echo "done. populate ~/.zsh/secrets/$ORG.sh and ~/.zsh/secrets/mrisoli.sh with your secrets."
