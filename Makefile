.PHONY: $(wildcard *)

HOME_TARGETS = \
   alacritty \
   cmus \
   demoji \
   dunst \
   kitty \
   lvim \
   nvim \
   picom \
   river \
   starship \
   swayidle \
   vim \
   waybar \
   wayfire \
   zsh

# home dir 
$(HOME_TARGETS):
	stow -t ~ $@
