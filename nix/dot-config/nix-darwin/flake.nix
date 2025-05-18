{
    description = "deorz nix-darwin system flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        nix-darwin.url = "github:LnL7/nix-darwin";
        nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
        nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    };

    outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
        let
            configuration = { pkgs, config, ... }: {
                # List packages installed in system profile. To search by name, run:
                # $ nix-env -qaP | grep wget
                environment.systemPackages =
                    [
                        pkgs.eza
                        pkgs.fd
                        pkgs.ripgrep
                        pkgs.fzf
                        pkgs.vim
                        pkgs.neovim
                        pkgs.yazi
                        pkgs.btop
                        pkgs.fastfetch
                        pkgs.lazygit
                        pkgs.starship
                        pkgs.stow
                        pkgs.uv
                        pkgs.zoxide
                        pkgs.kubelogin-oidc
                        pkgs.go
                        pkgs.poetry
                        pkgs.pyenv
                        pkgs.tmux
                    ];

                homebrew = {
                    enable = true;
                    brews = [
                        "zsh-syntax-highlighting"
                        "zsh-autosuggestions"
                        "nvm"
                        "laio"

                        # Only for building Pillow...
                        "libjpeg"
                        "zlib"
                    ];
                    taps = [
                        "nikitabobko/tap"
                        {
                            name = "ck3mp3r/laio-cli";
                            clone_target = "https://github.com/ck3mp3r/laio-cli/";
                            force_auto_update = true;
                        }
                    ];
                    casks = [
                        "aerospace"
                        "alacritty"
                        "font-jetbrains-mono-nerd-font"
                        "font-monaspace"
                        "telegram-desktop"
                        "tunnelblick"
                        "orbstack"
                        "mos"
                        "syncthing"
                        "zed"
                        "betterdisplay"
                    ];
                    masApps = {
                        "Numbers" = 409203825;
                        "Pages" = 409201541;
                    };
                    onActivation.cleanup = "zap";
                    onActivation.autoUpdate = true;
                    onActivation.upgrade = true;
                };

                system.defaults = {
                    NSGlobalDomain.KeyRepeat = 2;
                    spaces.spans-displays = false;
                    finder.ShowStatusBar = true;
                    finder.ShowPathbar = true;
                    finder.CreateDesktop = false;
                    dock.autohide  = true;
                    dock.show-recents = false;
                    dock.tilesize = 48;
                    # dock.expose-group-by-app = true;
                    dock.mru-spaces = false;
                    dock.persistent-apps = [
                        "/Applications/Arc.app"
                        "/Applications/Ghostty.app"
                        "/System/Applications/Mail.app"
                        "/System/Applications/Calendar.app"
                        "/System/Applications/Messages.app"
                        "/System/Applications/FaceTime.app"
                        "/System/Applications/System Settings.app"
                    ];
                };

                # Auto upgrade nix package and the daemon service.
                # services.nix-daemon.enable = true;
                # nix.package = pkgs.nix;

                # Necessary for using flakes on this system.
                nix.settings.experimental-features = "nix-command flakes";

                # Enable alternative shell support in nix-darwin.
                # programs.fish.enable = true;

                # Set Git commit hash for darwin-version.
                system.configurationRevision = self.rev or self.dirtyRev or null;

                # Used for backwards compatibility, please read the changelog before changing.
                # $ darwin-rebuild changelog
                system.stateVersion = 5;

                # The platform the configuration will be used on.
                nixpkgs.hostPlatform = "aarch64-darwin";
            };
        in
            {
            # Build darwin flake using:
            # $ darwin-rebuild build --flake .#Deniss-MacBook-Air
            darwinConfigurations."Deniss-MacBook-Air" = nix-darwin.lib.darwinSystem {
                modules = [
                    configuration 
                    nix-homebrew.darwinModules.nix-homebrew
                    {
                        nix-homebrew = {
                            enable = true;
                            enableRosetta = true;
                            user = "deorz";
                            autoMigrate = true;
                        };
                    }
                ];
            };

            # Expose the package set, including overlays, for convenience.
            darwinPackages = self.darwinConfigurations."Deniss-MacBook-Air".pkgs;
        };
}
