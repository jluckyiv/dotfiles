# From [Elijah Manor](https://www.youtube.com/watch?v=LkHjJlSgKZY&t=13s)
# https://gist.github.com/elijahmanor/b279553c0132bfad7eae23e34ceb593b?permalink_comment_id=4517208#gistcomment-4517208

function nvims
    set items AstroNvim NvChad "kickstart.nvim" LazyVim
    set config (printf "%s\n" $items | fzf --prompt=" Neovim Config = " --height=~50% --layout=reverse --border --exit-0)
    if [ -z $config ]
        echo "Nothing selected"
        return 0
    else if [ $config = default ]
        set config ""
    end
    env NVIM_APPNAME=$config nvim $argv
end
