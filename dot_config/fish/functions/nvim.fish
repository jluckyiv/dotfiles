# https://gist.github.com/elijahmanor/b279553c0132bfad7eae23e34ceb593b?permalink_comment_id=4517208#gistcomment-4517208
# For anyone who uses the Fish shell.

function avim
    env NVIM_APPNAME=AstroNvim nvim
end

function kvim
    env NVIM_APPNAME=kickstart nvim
end

function lvim
    env NVIM_APPNAME=LazyVim nvim
end

function nvims
    set items AstroNvim LazyVim kickstart
    set config (printf "%s\n" $items | fzf --prompt=" Neovim Config = " --height=~50% --layout=reverse --border --exit-0)
    if [ -z $config ]
        echo "Nothing selected"
        return 0
    else if [ $config = default ]
        set config ""
    end
    env NVIM_APPNAME=$config nvim $argv
end

bind \ca 'nvims\n'
