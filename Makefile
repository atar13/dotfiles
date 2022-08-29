.PHONY: $(wildcard *)

HOME_TARGETS = \
   nvim \
   river \
   waybar \
   wayfire \
   zsh


# home dir 
$(HOME_TARGETS):
	stow -t ~ $@

