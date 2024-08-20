{
  description = "ActivityWatch flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        python = pkgs.python39;
      in
      {
        packages.default = pkgs.stdenv.mkDerivation rec {
          pname = "activitywatch";
          version = "0.13.1";

          src = pkgs.fetchzip {
            url = "https://github.com/ActivityWatch/activitywatch/releases/download/v${version}/activitywatch-v${version}-linux-x86_64.zip";
            sha256 = "mcytv001Ofqb+Rzn6KpTR7uotXBKWsHks7b//OB5sDg=";
            stripRoot = false;
          };

          nativeBuildInputs = [ pkgs.makeWrapper python.pkgs.wrapPython ];
          buildInputs = [ python ];

          installPhase = ''
            mkdir -p $out/bin $out/lib
            cp -r activitywatch/* $out/lib/

            # Create wrapper scripts for each executable
            for file in $out/lib/aw-*; do
              if [ -f "$file" ] && [ -x "$file" ]; then
                makeWrapper "$file" "$out/bin/$(basename "$file")" \
                  --set AW_DIR "$out/lib" \
                  --prefix LD_LIBRARY_PATH : "${python}/lib" \
                  --prefix PATH : "${python}/bin"
              fi
            done

            # Wrap aw-qt separately
            makeWrapper "$out/lib/aw-qt" "$out/bin/aw-qt" \
              --set AW_DIR "$out/lib" \
              --prefix LD_LIBRARY_PATH : "${python}/lib" \
              --prefix PATH : "${python}/bin"

            # Create a desktop entry
            mkdir -p $out/share/applications
            cp $out/lib/aw-qt.desktop $out/share/applications/activitywatch.desktop
           
            # Install icons
            mkdir -p $out/share/icons/hicolor/scalable/apps
            cp $out/lib/media/logo/logo.svg $out/share/icons/hicolor/scalable/apps/activitywatch.svg
            mkdir -p $out/share/icons/hicolor/512x512/apps
            cp $out/lib/media/logo/logo.png $out/share/icons/hicolor/512x512/apps/activitywatch.png
          '';

          postFixup = ''
            wrapPythonPrograms
          '';

          meta = with pkgs.lib; {
            description = "The open-source time tracker with a focus on extensibility and privacy";
            homepage = "https://activitywatch.net/";
            license = licenses.mpl20;
            platforms = [ "x86_64-linux" ];
            maintainers = with maintainers; [ ];
          };
        };

        apps.default = flake-utils.lib.mkApp {
          drv = self.packages.${system}.default;
          name = "aw-qt";
        };
      }
    );
}