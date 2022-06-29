#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Installs\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

source ./xcode.sh
source ./homebrew.sh
source ./bash.sh

source ./git.sh
source ./node.sh
source ./browsers.sh
source ./compression_tools.sh
source ./gpg.sh
source ./image_tools.sh
source ./misc.sh
source ./npm.sh
source ./vscode.sh
source ./web_font_tools.sh
source ./web_font.sh
