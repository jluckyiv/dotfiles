# Dotfiles (chezmoi-managed)

This is a chezmoi-managed dotfiles repo. The source of truth is this directory (`~/.local/share/chezmoi/`). Target files in `~/` are deployed copies.

## Rules

- **Never edit target files directly** (e.g., `~/.config/nix-darwin/flake.nix`). Always edit the chezmoi source file (e.g., `dot_config/nix-darwin/flake.nix`).
- After editing, run `chezmoi apply <target-path>` to deploy, or `chezmoi apply` for everything.
- Use `chezmoi diff` to preview changes before applying.

## Adding new dotfiles

To bring an untracked config file under chezmoi management:

```
chezmoi add ~/.config/sometool/config.toml
```

This copies the target into the source dir with chezmoi naming conventions (e.g., `dot_config/sometool/config.toml`). Then edit the source copy going forward.

## Chezmoi naming conventions

- `dot_` prefix → `.` (e.g., `dot_config/` → `.config/`)
- `private_` prefix → file permissions 0600
- `.tmpl` suffix → Go template (uses `chezmoi data` for variables)
- `run_once_` / `run_onchange_` → scripts that run on apply

## Goals

- **Multi-machine portability**: config should make it easy to set up a new Apple Silicon Mac from scratch. Potential future Linux remote via standalone home-manager.
- Username is always `jluckyiv`. Only target platforms: aarch64-darwin and potentially x86_64-linux.

## Tools

- Package manager: nix-darwin (`dot_config/nix-darwin/flake.nix`) + home-manager (`home.nix`)
- Homebrew for GUI apps, casks, and Mac App Store apps (managed via nix-homebrew in flake.nix)
- Shell: fish
- User is on macOS (Darwin), Apple Silicon only

## Nix-darwin troubleshooting

The user is not a nix expert. When fixing nix errors, always explain what went wrong and why the fix works.

Common error patterns:

- **Version pin conflicts** (like `not satisfied by version X.Y.Z`): A package's dependency upper bounds are stricter than what nixpkgs provides. Fix with `pythonRelaxDeps` or by removing the package if unnecessary.
- **Hash mismatches**: Upstream source changed. Update the hash with `nix-prefetch-url` or `nix flake update`.
- **Missing dependencies**: Add to `buildInputs` or `nativeBuildInputs` in an overlay/override.
- **Cross-machine failures**: Usually caused by hardcoded paths or platform-specific packages. Use `pkgs.stdenv.isDarwin` / `pkgs.stdenv.isLinux` conditionals or hostname-based splits.

Workflow for nix errors:
1. Read the error output carefully — the last 25 lines usually contain the cause.
2. Identify the pattern (version pin, hash, missing dep, etc.).
3. Apply the minimal fix.
4. Explain the root cause to the user.
5. Rebuild: `darwin-rebuild switch --flake ~/.config/nix-darwin`

## Work tracking

Track all dotfiles work through GitHub issues on `jluckyiv/dotfiles`. Use `gh issue list --repo jluckyiv/dotfiles` to check open issues at the start of a session. Do not maintain a separate TODO list in this file.

## Neovim

- Uses LazyVim distro (`dot_config/nvim/`)
- Custom plugin specs go in `lua/plugins/` — LazyVim merges them with its defaults
- When updating LazyVim, check that custom keymaps and plugin specs still work
- **Spell file drift**: `spell/en.utf-8.add` accumulates new words on disk. Periodically run `chezmoi add ~/.config/nvim/spell/` to capture them.

## Security

- **Never commit plaintext secrets.** Use chezmoi `.tmpl` files with `onepasswordRead` for secrets.
- `.gitconfig` should use credential helpers or `gh auth`, not embedded PATs.
- Check `chezmoi status` output for `.tmpl` errors before committing — broken 1Password references block all chezmoi operations.
