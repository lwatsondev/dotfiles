.DEFAULT_GOAL := stow

.PHONY: stow restow unstow

stow:
	stow -vt ~/.config config
	stow -v --dotfiles -t ~ home
	stow -vt ~/.local/bin local-bin

restow:
	stow -Rvt ~/.config config
	stow -Rv --dotfiles -t ~ home
	stow -Rvt ~/.local/bin local-bin

unstow:
	stow -Dvt ~/.config config
	stow -Dv --dotfiles -t ~ home
	stow -Dvt ~/.local/bin local-bin
