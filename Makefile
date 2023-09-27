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
   scripts \
   starship \
   swayidle \
   tmux \
   vim \
   waybar \
   wayfire \
   zsh

# home dir 
$(HOME_TARGETS):
	stow -t ~ $@
