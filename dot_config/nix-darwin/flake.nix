{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core.url = "github:homebrew/homebrew-core";
    homebrew-core.flake = false;
    homebrew-bundle.url = "github:homebrew/homebrew-bundle";
    homebrew-bundle.flake = false;
    homebrew-cask.url = "github:homebrew/homebrew-cask";
    homebrew-cask.flake = false;
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew, homebrew-core, homebrew-bundle, homebrew-cask, ... }:
  let
    configuration = { pkgs, config, ... }: {
      nixpkgs.config.allowUnfree = true;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.fish.enable = true;
      # programs.zsh.enable = true;
      
      environment.shells = [pkgs.fish];

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # Enable sudo Touch ID authentication.
      security.pam.services.sudo_local.touchIdAuth = true;

      # Manage macOS system settings.
      system.defaults = {
        dock.autohide = true;
        NSGlobalDomain.AppleKeyboardUIMode = 3;
        finder.FXPreferredViewStyle = "Nlsv";
        loginwindow.GuestEnabled = false;
      };
      # Let Nix know where the user's home directory is.
      users.knownUsers = [ "jluckyiv" ];
      users.users.jluckyiv.uid = 501;
      users.users.jluckyiv.name = "jluckyiv";
      users.users.jluckyiv.home = "/Users/jluckyiv";
      users.users.jluckyiv.shell = pkgs.fish;
      system.activationScripts.setFishAsShell.text = ''
        dscl . -create /Users/jluckyiv UserShell /run/current-system/sw/bin/fish
      '';

      # Build any users that are not in the system
      nix.enable = true;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [
            pkgs._1password-cli
            pkgs.atuin
            pkgs.bat
            pkgs.btop
            pkgs.chezmoi
            elmPackages.elm
            elmPackages.elm-analyse
            elmPackages.elm-doc-preview
            elmPackages.elm-format
            elmPackages.elm-json
            elmPackages.elm-language-server
            elmPackages.elm-live
            elmPackages.elm-optimize-level-2
            elmPackages.elm-review
            elmPackages.elm-test
            elmPackages.elm-test-rs
            pkgs.eza
            pkgs.fd
            pkgs.fish
            pkgs.flyctl
            pkgs.fzf
            # pkgs.gh
            pkgs.git
            pkgs.go
            pkgs.gofumpt
            pkgs.golangci-lint
            pkgs.gotestsum
            pkgs.go-task
            pkgs.hugo
            pkgs.jq
            pkgs.lazygit
            pkgs.lua
            pkgs.luarocks
            pkgs.imagemagick
            pkgs.neofetch
            pkgs.neovim
            pkgs.opam
            pkgs.pandoc
            pkgs.pdfgrep
            pkgs.pkg-config
            pkgs.poppler
            pkgs.qrtool
            pkgs.rename
            pkgs.ripgrep
            pkgs.ruby
            pkgs.slides
            pkgs.sqlite
            pkgs.starship
            pkgs.sttr
            pkgs.tectonic
            pkgs.tldr
            pkgs.tmux
            pkgs.tree-sitter
            pkgs.wget
            pkgs.yq
            pkgs.zoxide
            pkgs.zstd
        ];

      # Use Nix to install fonts.
      fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
      ];

      homebrew = {
          enable = true;
          onActivation.autoUpdate = true;
          onActivation.upgrade = true;
          onActivation.cleanup = "zap";

          brews = [ 
            "gh"
            "nodejs"
            "thefuck"
          ];
          casks = [
            "1password"
            "alfred"
            "cheatsheet"
            "crossover"
            "customshortcuts"
            "devonthink"
            "docker"
            "dropbox"
            "firefox"
            "fleet"
            "fluor"
            "ghostty"
            "gitbutler"
            "github"
            "goland"
            "jetbrains-toolbox"
            "karabiner-elements"
            "keyboard-maestro"
            "keyboardcleantool"
            "keycastr"
            "mactex"
            "microsoft-edge"
            "moom"
            "morgen"
            "obsidian"
            "openinterminal"
            "orion"
            "setapp"
            "tailscale"
            "textexpander"
            "vlc"
            "warp"
            "wezterm"
            {
              name = "wine-stable";
              args = {no_quarantine = true;};
            }
            "xquartz"
            "zed"
            "zen-browser"
            "zoom"
            "zotero"
          ];

          masApps = {
            "Amphetamine" = 937984704;
            "Cardhop" = 1290358394;
            "Day One" = 1055511498;
            "Dice" = 1479250666;
            "Drafts" = 1435957248;
            "DuckDuckGo Privacy for Safari" = 1482920575;
            "Fantastical" = 975937182;
            "Goodnotes 6" = 1444383602;
            "Keynote" = 409183694;
            "Kindle" = 302584613;
            "Microsoft Excel" = 462058435;
            "Microsoft PowerPoint" = 462062816;
            "Microsoft Word" = 462054704;
            "Numbers" = 409203825;
            "OneDrive" = 823766827;
            "Pages" = 409201541;
            "Paprika Recipe Manager 3" = 1303222628;
            "Parcel" = 639968404;
            "Patterns" = 429449079;
            "Reeder" = 1529448980;
            "Save to Reader" = 1640236961;
            "Super Agent" = 1568262835;
            "URL Linker" = 1289119450;
            "uBlacklist for Safari" = 1547912640;
          };
        };

    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Jacksons-M3-MacBook-Pro-14
    darwinConfigurations."Jacksons-M3-MacBook-Pro-14" = nix-darwin.lib.darwinSystem {
      modules = [ 
      configuration 
      home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.jluckyiv = import ./home.nix;
      }
      ];
    };
  };
}
