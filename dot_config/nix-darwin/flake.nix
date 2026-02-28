{
  description = "jluckyiv's nix-darwin system flake with home-manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
  let
    username = "jluckyiv";

    darwinHosts = {
      "Jacksons-M3-MacBook-Pro-14" = { system = "aarch64-darwin"; };
      # "second-mac" = { system = "aarch64-darwin"; };
    };

    mkDarwinConfig = hostname: { system }: nix-darwin.lib.darwinSystem {
      inherit system;
      modules = [
        ({ pkgs, config, ... }: {

          nixpkgs.config.allowUnfree = true;

          system.primaryUser = username;

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Enable alternative shell support in nix-darwin.
          programs.fish.enable = true;

          environment.shells = [pkgs.fish];

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 5;

          # Enable sudo Touch ID authentication.
          security.pam.services.sudo_local.touchIdAuth = true;

          # Manage macOS system settings.
          system.defaults = {
            dock.autohide = true;
            NSGlobalDomain.AppleKeyboardUIMode = 3;
            finder.FXPreferredViewStyle = "Nlsv";
            loginwindow.GuestEnabled = false;
          };

          users.knownUsers = [ username ];
          users.users.${username} = {
            uid = 501;
            name = username;
            home = "/Users/${username}";
            shell = pkgs.fish;
          };
          system.activationScripts.setFishAsShell.text = ''
            dscl . -create /Users/${username} UserShell /run/current-system/sw/bin/fish
          '';

          nix.enable = true;

          # Minimal system packages — just enough for bootstrap.
          # Dev tools live in home.nix via home-manager.
          environment.systemPackages = with pkgs; [
            _1password-cli
            direnv
            fish
            git
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
              "flyctl"
              "nodejs"
              "poppler"
              "thefuck"
            ];
            casks = [
              "1password"
              "alfred"
              "brave-browser"
              "cheatsheet"
              "claude"
              "claude-code"
              "crossover"
              "customshortcuts"
              "devonthink"
              "docker-desktop"
              "dropbox"
              "firefox"
              "fleet"
              "fluor"
              "ghostty"
              "gitbutler"
              "github"
              "goland"
              "gstreamer-runtime"
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
              "tailscale-app"
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

        })
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "hm-backup";
          home-manager.users.${username} = import ./home.nix;
        }
      ];
    };
  in
  {
    darwinConfigurations = builtins.mapAttrs mkDarwinConfig darwinHosts;

    # Future: standalone home-manager for Linux remotes
    # homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
    #   pkgs = nixpkgs.legacyPackages.x86_64-linux;
    #   modules = [ ./home.nix ];
    # };
  };
}
