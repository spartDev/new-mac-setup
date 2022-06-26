
#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Installs\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

bash ./xcode.sh
bash ./homebrew.sh
bash ./bash.sh

bash ./git.sh
bash ./node.sh
bash ./browsers.sh
bash ./compression_tools.sh
bash ./gpg.sh
bash ./image_tools.sh
bash ./misc.sh
bash ./npm.sh
bash ./vscode.sh
bash ./web_font°tools.sh
bash ./web_font.sh
