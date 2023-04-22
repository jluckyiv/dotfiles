function caff --wraps='chezmoi add ~/.config/fish/functions --recursive' --description 'alias caff=chezmoi add ~/.config/fish/functions --recursive'
  chezmoi add ~/.config/fish/functions --recursive $argv
        
end
