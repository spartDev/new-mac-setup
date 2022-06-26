#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous\n\n"

brew_install "Spectacle" "spectacle" "--cask"
brew_install "Caffeine" "caffeine" "--cask"
brew_install "Appcleaner" "appcleaner" "--cask"
brew_install "Spotify" "spotify" "--cask"
brew_install "Transmit" "transmit" "--cask"
brew_install "Unarchiver" "the-unarchiver" "--cask"
brew_install "Elmedia Player" "elmedia-player" "--cask"
brew_install "Mas" "mas"
brew_install "Postman" "postman" "--cask"
brew_install "Rambox" "rambox" "--cask"
brew_install "Hyper Terminal" "hyper" "--cask"
brew_install "Docker" "docker" "--cask"
mas_install "Tweetbot" 557168941
mas_install "Fantastical" 975937182
mas_install "Unsplash Wallpapers" 1284863847
mas_install "WhatsApp" 1147396723
mas_install "Hotspot Shield" 771076721
mas_install "ColorSlurp" 1287239339
mas_install "Slack" 803453959
