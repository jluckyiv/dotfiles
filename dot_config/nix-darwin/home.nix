# Home-manager config for jluckyiv.
# Packages only — chezmoi owns all config files.
# Portable across darwin (nix-darwin) and future linux (standalone home-manager).
{ config, pkgs, lib, ... }:

{
  home.username = "jluckyiv";
  home.homeDirectory =
    if pkgs.stdenv.isDarwin then "/Users/jluckyiv"
    else "/home/jluckyiv";

  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # All dev tools as packages. Config files are managed by chezmoi.
  home.packages = with pkgs; [
    atuin
    bat
    btop
    chezmoi
    direnv
    eza
    fd
    fzf
    go
    gofumpt
    gotestsum
    go-task
    hugo
    imagemagick
    jq
    lazygit
    lua
    luarocks
    mask
    neofetch
    neovim
    ngrok
    nix-direnv
    opam
    opencode
    pandoc
    pdfgrep
    pkg-config
    qrtool
    rename
    ripgrep
    ripgrep-all
    ruby
    slides
    sqlite
    starship
    sttr
    tectonic
    tldr
    tmux
    tree-sitter
    wget
    yq
    zoxide
    zstd
  ];
}
