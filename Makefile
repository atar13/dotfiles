.PHONY: $(wildcard *)

HOME_TARGETS = \
   alacritty \
   demoji \
   dunst \
   kitty \
   lvim \
   nvim \
   picom \
   river \
   starship \
   vim \
   waybar \
   wayfire \
   zsh


# home dir 
$(HOME_TARGETS):
	stow -t ~ $@

