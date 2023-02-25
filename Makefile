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

ROOT_TARGETS = \
   nixos


# home dir 
$(HOME_TARGETS):
	stow -t ~ $@

# root dir
$(ROOT_TARGETS):
	stow -t / $@
