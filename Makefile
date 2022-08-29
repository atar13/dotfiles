.PHONY: $(wildcard *)

HOME_TARGETS = \
   lvim \
   nvim \
   river \
   starship \
   waybar \
   wayfire \
   zsh


# home dir 
$(HOME_TARGETS):
	stow -t ~ $@

