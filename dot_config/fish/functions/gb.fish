function gb --wraps='gh repo clone $argv -- --bare .bare' --description 'create a bare worktree folder'
    gh repo clone $argv -- .bare --bare
    echo "gitdir: ./.bare" >.git
    git worktree add main
    echo "Created worktree at ./main"
    echo "Add existing worktrees with 'git worktree add <branch>'"
    echo "Add new worktrees with 'git worktree add -b <branch> <path>'"
end
