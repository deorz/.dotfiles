if not status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PATH "$HOME/.orbstack/bin" "$HOME/.cargo/bin" "$HOME/go/bin" "$HOME/.local/bin" /opt/local/bin /opt/local/sbin $PATH
set -gx EDITOR nvim
set -gx GOOGLE_CLOUD_PROJECT "integrated-ray-466317-r9"
set -Ux PYENV_ROOT $HOME/.pyenv

test -d $PYENV_ROOT/bin; and fish_add_path $PYENV_ROOT/bin
test ! -e "$HOME/.x-cmd.root/local/data/fish/rc.fish" || source "$HOME/.x-cmd.root/local/data/fish/rc.fish" # boot up x-cmd.

pyenv init - fish | source
zoxide init fish | source
