function cu --wraps='chezmoi update && chezmoi apply' --description 'alias cu=chezmoi update && chezmoi apply'
  chezmoi update && chezmoi apply $argv
        
end
