function vim --wraps=nvim --description 'alias vim=nvim'
    nvim $argv

end

function v --wraps=nvim --description 'alias v=nvim'
    nvim $argv

end

# From [Elijah Manor](https://www.youtube.com/watch?v=LkHjJlSgKZY&t=13s)
# https://gist.github.com/elijahmanor/b279553c0132bfad7eae23e34ceb593b?permalink_comment_id=4517208#gistcomment-4517208
# For anyone who uses the Fish shell.

function avim --wraps='NVIM_APPNAME=AstroNvim nvim' --description 'alias avim=NVIM_APPNAME=AstroNvim nvim'
    NVIM_APPNAME=AstroNvim nvim $argv

end

function cvim --wraps='NVIM_APPNAME=NvChad nvim' --description 'alias cvim=NVIM_APPNAME=NvChad nvim'
    NVIM_APPNAME=NvChad nvim $argv

end

function kvim --wraps='NVIM_APPNAME=kickstart.nvim nvim' --description 'alias kvim=NVIM_APPNAME=kickstart.nvim nvim'
    NVIM_APPNAME=kickstart.nvim nvim $argv

end

function lvim --wraps='NVIM_APPNAME=LazyVim nvim' --description 'alias lvim=NVIM_APPNAME=LazyVim nvim'
    NVIM_APPNAME=LazyVim nvim $argv

end

function nvims
    set items AstroNvim "kickstart.nvim" LazyVim NvChad
    set config (printf "%s\n" $items | fzf --prompt=" Neovim Config = " --height=~50% --layout=reverse --border --exit-0)
    if [ -z $config ]
        echo "Nothing selected"
        return 0
    else if [ $config = default ]
        set config ""
    end
    env NVIM_APPNAME=$config nvim $argv
end
