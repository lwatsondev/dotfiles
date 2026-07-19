# dotfiles

Personal dotfiles for a Gentoo Linux desktop running Sway/Wayland, fish as
primary shell (bash as fallback). Managed with GNU Stow.

## Layout

`home/` is the single stow package and mirrors `$HOME` exactly: with
`--dotfiles`, `dot-foo` -> `.foo` at link time (e.g. `home/dot-bashrc` ->
`~/.bashrc`, `home/dot-config/` -> `~/.config/`).

`firefox/`, `termux/`, `windows-terminal/` at repo root are reference
configs applied manually on their respective platforms. They are not part
of the stow package and not symlinked.

## Deploy

See `README.md`: `make` / `make restow` / `make unstow`.

## Conventions

- **Gitignore pattern**: each app directory under `home/dot-config/`
  gitignores its own runtime state (logs, caches, secrets, sockets, pid
  files, plugin dirs, venvs) so only static config is tracked.
  `home/dot-config/systemd/` is the deliberate exception. It has no
  gitignore and is fully tracked. Both are intentional. Don't propose
  changing either.

## No CI/tests

There is no test suite, linter, or CI in this repo. Verification is manual:
apply changes with stow and check the resulting symlinks/behavior.
