function c --wraps=chezmoi --description 'alias c=chezmoi'
    chezmoi $argv

end

function caff --wraps='chezmoi add ~/.config/fish/functions --recursive' --description 'alias caff=chezmoi add ~/.config/fish/functions --recursive'
    chezmoi add ~/.config/fish/functions --recursive $argv

end

function ce --wraps='chezmoi edit --apply' --description 'alias ce=chezmoi edit --apply'
    chezmoi edit --apply $argv

end

function ce --wraps='chezmoi edit --apply' --description 'alias ce=chezmoi edit --apply'
    chezmoi edit --apply $argv

end

function cg --wraps='chezmoi git' --description 'alias cg=chezmoi git'
    chezmoi git $argv

end

function cu --wraps='chezmoi update && chezmoi apply' --description 'alias cu=chezmoi update && chezmoi apply'
    chezmoi update && chezmoi apply $argv

end
