#
# ███████╗██╗███████╗██╗  ██╗
# ██╔════╝██║██╔════╝██║  ██║
# █████╗  ██║███████╗███████║
# ██╔══╝  ██║╚════██║██╔══██║
# ██║     ██║███████║██║  ██║
# ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
# A smart and user-friendly command line
# https://fishshell.com
# cSpell:words ajeetdsouza cppflags ldflags pkgconfig pnpm nvim Nord gopath nvimpager ripgreprc ripgrep zoxide joshmedeski sharkdp neovim lucc

starship init fish | source # https://starship.rs/
zoxide init fish | source # 'ajeetdsouza/zoxide'

set -gx CPPFLAGS -I/opt/homebrew/opt/sqlite/include
set -gx LDFLAGS -L/opt/homebrew/opt/sqlite/lib
set -gx PKG_CONFIG_PATH /opt/homebrew/opt/sqlite/lib/pkgconfig
set -gx PNPM_HOME /Users/jluckyiv/Library/pnpm # https://pnpm.io/

set -Ux BAT_THEME Nord # 'sharkdp/bat' cat clone 
set -Ux EDITOR nvim # 'neovim/neovim' text editor 
set -Ux fish_greeting # disable fish greeting
set -U FZF_DEFAULT_COMMAND "fd -H -E '.git'"
set -Ux GOPATH (go env GOPATH) # https://golang.google.cn/
set -Ux KIT_EDITOR /opt/homebrew/bin/nvim # https://www.scriptkit.com/
set -Ux LANG en_US.UTF-8
set -Ux LC_ALL en_US.UTF-8
set -Ux NODE_PATH "~/.nvm/versions/node/v16.19.0/bin/node" # 'nvm-sh/nvm'
set -Ux VISUAL nvim

set -Ux FZF_DEFAULT_OPTS "--reverse \
--border rounded \
--no-info \
--pointer='' \
--marker=' ' \
--ansi \
--color='16,bg+:-1,gutter:-1,prompt:4,pointer:5,marker:6'"

set -Ux FZF_TMUX_OPTS "-p \
--reverse \
--border rounded \
--no-info \
--pointer='' \
--marker=' ' \
--ansi \
--color='16,bg+:-1,gutter:-1,prompt:4,pointer:5,marker:6'"

set -Ux FZF_CTRL_R_OPTS "--border-label=' history ' \
--header='ctrl-d: delete' \
--prompt='  '"

# ordered by priority - bottom up
fish_add_path /opt/homebrew/bin # https://brew.sh/
fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/opt/sqlite/bin
fish_add_path $GOPATH/bin
fish_add_path $PNPM_HOME
fish_add_path $HOME/.local/bin
# fish_add_path $HOME/.config/tmux/plugins/tmux-nvr/bin
fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin
fish_add_path $HOME/.config/bin # my custom scripts

abbr -a -- bb 'brew bundle install --cleanup --file ~/Brewfile'
abbr -a -- g git
abbr -a -- gg lazygit
abbr -a -- ls exa
abbr -a -- sf 'source ~/.config/fish/config.fish'
abbr -a -- st 'tmux source ~/.config/tmux/tmux.conf'
abbr -a -- ta 'tmux a'
abbr -a -- tat 'tmux attach -t'
abbr -a -- td 't ~/.local/share/chezmoi'
abbr -a -- tk 'tmux kill-server'
abbr -a -- tldr tldr\ --list\ \|\ fzf\ --header\ \'tldr\ \(tealdeer\)\'\ --reverse\ --preview\ \'tldr\ \{1\}\'\ --preview-window=right,80\%\ \|\ xargs\ tldr
abbr -a -- tn 'tmux new -s (basename (pwd))'
abbr -a -- vb 'chezmoi edit --apply ~/Brewfile'
abbr -a -- vf 'chezmoi edit --apply ~/.config/fish/config.fish'
abbr -a -- vk 'chezmoi edit --apply ~/.config/kitty/kitty.conf'
abbr -a -- vt 'chezmoi edit --apply ~/.config/tmux/tmux.conf'

source ~/.asdf/asdf.fish
