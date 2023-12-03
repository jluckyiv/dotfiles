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



#bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

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
fish_add_path $HOME/.cargo/bin

abbr -a -- amc 'open -a "Pages" "/Users/jluckyiv/Library/Mobile Documents/com~apple~Pages/Documents/AMC checklist.pages"'
abbr -a -- bb 'brew bundle install --cleanup --file ~/Brewfile'
abbr -a -- fsc 'open -a "Pages" "/Users/jluckyiv/Library/Mobile Documents/com~apple~Pages/Documents/FSC checklist.pages"'
abbr -a -- g git
abbr -a -- gg lazygit
abbr -a -- ls eza
abbr -a -- pdfe 'open -a "PDF Expert"'
abbr -a -- pp 'open -a "Microsoft PowerPoint"'
abbr -a -- sc 'open -a "Pages" "/Users/jluckyiv/Library/Mobile Documents/com~apple~Pages/Documents/SC checklist.pages"'
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
abbr -a -- vkb 'chezmoi edit --apply ~/.config/karabiner/karabiner.json'
abbr -a -- vkt 'chezmoi edit --apply ~/.config/kitty/kitty.conf'
abbr -a -- vj 'chezmoi edit --apply ~/.config/jago/config.yaml'
abbr -a -- vt 'chezmoi edit --apply ~/.config/tmux/tmux.conf'
abbr -a -- vvc 'chezmoi edit --apply ~/.config/nvim/lua/config/'
abbr -a -- vva 'chezmoi edit --apply ~/.config/nvim/lua/config/autocmds.lua'
abbr -a -- vvk 'chezmoi edit --apply ~/.config/nvim/lua/config/keymaps.lua'
abbr -a -- vvl 'chezmoi edit --apply ~/.config/nvim/lua/config/lazy.lua'
abbr -a -- vvo 'chezmoi edit --apply ~/.config/nvim/lua/config/options.lua'
abbr -a -- pdfe 'open -a "PDF Expert"'
abbr -a -- word 'open -a "Microsoft Word"'
abbr -a -- xl 'open -a "Microsoft Excel"'

source ~/.asdf/asdf.fish
source ~/.config/op/plugins.sh
source ~/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
