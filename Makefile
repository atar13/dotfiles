.PHONY: $(wildcard *)

HOME_TARGETS = \
   demoji \
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

