.PHONY: $(wildcard *)

HOME_TARGETS = \
   demoji \
   dunst \
   kitty \
   lvim \
   nvim \
   picom \
   river \
   starship \
   waybar \
   wayfire \
   zsh


# home dir 
$(HOME_TARGETS):
	stow -t ~ $@

