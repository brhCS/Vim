#!/usr/bin/env zsh
set -euo pipefail

# Helper script for migrating a NixPkgs Rust pkg to the new cargoSha256
# verification. Run from the root of a NixPkgs git checkout.
if [ -z "$1" ]; then
    echo "USAGE: $0 <attribute>"
    echo "EXAMPLE: $0 ripgrep"
    exit 1
fi

ATTR=$1
FNAME=$(EDITOR=ls nix edit -f . $ATTR)

section() {
    echo "********************************************************************************"
    echo "$ATTR: $1"
    echo "********************************************************************************"
}

main() {
    if ! grep -q "Delete this on next update" $FNAME; then
        echo "Did not find what I was looking for; probably already done?"
        exit 1
    fi

    sed -i '/.*Delete this on next update.*/,/^$/d' $FNAME

    section "Nuking cargoSha256 reference for $FNAME, then rebuilding"
    sed -i 's|cargoSha256.*|cargoSha256 = "0000000000000000000000000000000000000000000000000000";|' $FNAME;
    nix-build -A $ATTR 2>&1 | tee /tmp/nix-rust-logfile-$ATTR || true
    actual=$(grep 'got:.*sha256:.*' /tmp/nix-rust-logfile-$ATTR | cut -d':' -f3- | tail -1)
    echo "Build of $ATTR determined that cargoSha256 should be $actual"
    sed -i "s|cargoSha256.*|cargoSha256 = \"$actual\";|" $FNAME

    section "Rebuilding with updated hash, expecting a pass:"
    nix-build -A $ATTR || exit 1

    section "Finished successfully!"
}

main
