{
    description = "yfle on nix";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
          };
      };

      outputs = { nixpkgs, home-manager, ... }: {
          nixosConfigurations.wulf = nixpkgs.lib.nixosSystem {
              system = "x86_64-linux";
              modules = [
                  ./configuration.nix
                  home-manager.nixosModules.home-manager
                  {
                      home-manager = {
                          userGlobalPkgs = true;
                          useUserPackages = true;
                          users.ylfe = import ./home.nix;
                          backupFileExtension = "backup";
                        };
                    };
              ];
            };
        };
  }
