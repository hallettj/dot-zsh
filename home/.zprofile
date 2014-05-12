# Run all scripts in ~/.config/profile.d"
PROFILES_DIR="$HOME/.config/profile.d"
if [ -d "$PROFILES_DIR" ]; then
  for PROFILE in "$PROFILES_DIR"/*; do
    source $PROFILE
  done
fi

