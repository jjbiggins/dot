#!/usr/bin/env bash
# Idempotent Cloud Agent setup for this dotfiles repository.
# Installs the tooling used to edit, lint, and load the shell/vim configs,
# then validates that every bash dotfile parses.
set -euo pipefail

echo "==> Installing packages (shellcheck, vim, bash-completion)"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update -qq
sudo apt-get install -y -qq shellcheck vim bash-completion

# The dotfiles source "$HOME/.cargo/env". This image ships rust under
# /usr/local/cargo, so expose a compatibility shim rather than editing the
# tracked dotfiles. Skipped cleanly if rust is not present.
if [ ! -e "$HOME/.cargo/env" ] && [ -e /usr/local/cargo/env ]; then
  echo "==> Linking ~/.cargo/env -> /usr/local/cargo/env"
  mkdir -p "$HOME/.cargo"
  ln -sf /usr/local/cargo/env "$HOME/.cargo/env"
fi

echo "==> Validating bash dotfiles parse (bash -n)"
BASH_FILES=(
  .bash_profile
  .bash_login
  .bash_logout
  .profile
  .bashrc
  .bashrc_aliases
  .functions
  .macos.sh
)
fail=0
for f in "${BASH_FILES[@]}"; do
  if [ -f "$f" ]; then
    if bash -n "$f"; then
      echo "    ok   $f"
    else
      echo "    FAIL $f"
      fail=1
    fi
  fi
done

if [ "$fail" -ne 0 ]; then
  echo "==> Syntax validation failed" >&2
  exit 1
fi

echo "==> Setup complete"
