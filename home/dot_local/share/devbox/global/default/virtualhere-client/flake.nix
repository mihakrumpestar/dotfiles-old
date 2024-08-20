{
  description = "VirtualHere USB Client (vhuit64) flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "virtualhere-client";
          version = "latest";

          src = pkgs.fetchurl {
            url = "https://www.virtualhere.com/sites/default/files/usbclient/vhuit64";
            sha256 = "sha256-UeIP0svk9j1/8NtNbu08O77aR60wA9y20tN1gQTCirM=";
          };

          dontUnpack = true;

          installPhase = ''
            mkdir -p $out/bin
            cp $src $out/bin/virtualhere-client
            chmod +x $out/bin/virtualhere-client
          '';

          meta = with pkgs.lib; {
            description = "VirtualHere USB Client";
            homepage = "https://www.virtualhere.com/";
            #license = licenses.unfree;
            platforms = platforms.linux;
          };
        };

        apps.default = flake-utils.lib.mkApp {
          drv = self.packages.${system}.default;
        };
      }
    );
}