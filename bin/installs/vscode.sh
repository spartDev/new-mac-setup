
#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_plugin() {
    execute "code --install-extension $2" "$1 (plugin)"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Visual Studio Code\n\n"                                :

# Install VSCode
brew_install "Visual Studio Code" "visual-studio-code" "--cask"

printf "\n"

# Install the VSCode plugins
install_plugin "Atom KeymAp" "ms-vscode.atom-keybindings"
install_plugin "Active File In StatusBar" "RoscoP.ActiveFileInStatusBar"
install_plugin "Auto Rename Tag" "formulahendry.auto-rename-tag"
install_plugin "Babel Javascript" "mgmcdermott.vscode-language-babel"
install_plugin "Code Spell Checker" "streetsidesoftware.code-spell-checker"
install_plugin "DotEnv" "mikestead.dotenv"
install_plugin "EditorConfig" "EditorConfig.EditorConfig"
install_plugin "ESLint" "dbaeumer.vscode-eslint"
install_plugin "File Icons" "vscode-icons-team.vscode-icons"
install_plugin "French - Code Spell Checke" "streetsidesoftware.code-spell-checker-french"
install_plugin "Git Graph" "mhutchie.git-graph"
install_plugin "GitHub Markdown Preview" "bierner.github-markdown-preview"
install_plugin "GitLens" "eamodio.gitlens"
install_plugin "Import Cost" "wix.vscode-import-cost"
install_plugin "IntelliCode" "VisualStudioExptTeam.vscodeintellicode"
install_plugin "Jest Snippets" "andys8.jest-snippets"
install_plugin "Live Share" "MS-vsliveshare.vsliveshare"
install_plugin "MarkdownLint" "DavidAnson.vscode-markdownlint"
install_plugin "npm Intellisense" "christian-kohler.npm-intellisense"
install_plugin "One Dark Pro Theme" "zhuangtongfa.Material-theme"
install_plugin "Path Intellisense" "christian-kohler.path-intellisense"
install_plugin "Prettier - Code formatter" "esbenp.prettier-vscode"
install_plugin "Prisma" "Prisma.prisma"
install_plugin "Remix Run Snippets" "amimaro.remix-run-snippets"
install_plugin "Tailwind CSS IntelliSense" "bradlc.vscode-tailwindcss"
install_plugin "Vitest" "ZixuanChen.vitest-explorer"
install_plugin "YAML" "redhat.vscode-yaml"


# Close VSCode
osascript -e 'quit app "Visual Studio Code"'
