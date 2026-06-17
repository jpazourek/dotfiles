if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting ""

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx SUDO_EDITOR nvim

fish_vi_key_bindings

starship init fish | source

fastfetch
