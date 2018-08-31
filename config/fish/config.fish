set -U EDITOR nvim

source ~/.asdf/asdf.fish

alias git "hub"
alias ts "tmux new -s"
alias vim "nvim"

set -gx PATH $PATH /Users/jluckyiv/.local/bin /Users/jluckyiv/.dotnet/tools

if test -f /Users/jluckyiv/.secret
    source /Users/jluckyiv/.secret
end
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
