# XDG partial support.
# https://wiki.archlinux.org/title/XDG_Base_Directory#Support
set -x ASPELL_CONF "per-conf $XDG_CONFIG_HOME/aspell/aspell.conf; personal $XDG_CONFIG_HOME/aspell/en.pws; repl $XDG_CONFIG_HOME/aspell/en.prepl"
set -x SQLITE_HISTORY "$XDG_STATE_HOME/sqlite_history"
set -x PSQL_HISTORY "$XDG_CACHE_HOME/pg/psql_history"
set -x MYSQL_HISTFILE "$XDG_DATA_HOME/mysql_history"
set -x LESSHISTFILE -

# Per-shell tty for gpg pinentry fallback/loopback.
if status is-interactive; and isatty stdin
    set -x GPG_TTY (tty)
end

set -x TERMINFO "$XDG_DATA_HOME/terminfo"
set -x TERMINFO_DIRS "$XDG_DATA_HOME/terminfo:/usr/share/terminfo"

# Set BROWSER to the first available command.
if not set -q BROWSER
    set -l browsers firefox-bin firefox chromium-bin chromium
    for browser in $browsers
        if command -q $browser
            set -gx BROWSER $browser
            break
        end
    end
end

# Python
set -x VIRTUAL_ENV_DISABLE_PROMPT true
set -x PYTHON_HISTORY "$XDG_STATE_HOME/python/history"
set -x WORKON_HOME "$XDG_DATA_HOME/virtualenvs"

# Node
set -x NODE_REPL_HISTORY "$XDG_DATA_HOME/node_repl_history"
set -x NVM_DIR "$XDG_DATA_HOME/nvm"
