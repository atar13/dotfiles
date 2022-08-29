.PHONY: $(wildcard *)

HOME_TARGETS = \
   nvim \
   river \
   starship \
   waybar \
   wayfire \
   zsh


# home dir 
$(HOME_TARGETS):
	stow -t ~ $@

