.DEFAULT_GOAL := stow

.PHONY: stow restow unstow

stow:
	mkdir -p ~/.config ~/.config/systemd/user ~/.local/bin
	stow -v --dotfiles -t ~ home

restow:
	stow -Rv --dotfiles -t ~ home

unstow:
	stow -Dv --dotfiles -t ~ home
