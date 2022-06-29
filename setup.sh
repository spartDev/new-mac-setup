#!/bin/bash

declare -r GITHUB_REPOSITORY="spartDev/new-mac-setup"

declare -r DOTFILES_ORIGIN="git@github.com:$GITHUB_REPOSITORY.git"
declare -r DOTFILES_TARBALL_URL="https://github.com/$GITHUB_REPOSITORY/tarball/main"
declare -r DOTFILES_UTILS_URL="https://raw.githubusercontent.com/$GITHUB_REPOSITORY/main/bin/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare DOTFILES_DIRECTORY="$HOME/.dotfiles"
declare skipQuestions=false

# ----------------------------------------------------------------------
# | Helper Functions                                                   |
# ----------------------------------------------------------------------

check_internet_connection() {
    if [ ping -q -w1 -c1 google.com &>/dev/null ]; then
        printf "Please check your internet connection";
        exit 0
    fi
}

download() {

    local url="$1"
    local output="$2"

    if command -v "curl" &> /dev/null; then

        curl \
            --location \
            --silent \
            --show-error \
            --output "$output" \
            "$url" \
                &> /dev/null

        return $?

    elif command -v "wget" &> /dev/null; then

        wget \
            --quiet \
            --output-document="$output" \
            "$url" \
                &> /dev/null

        return $?
    fi

    return 1

}

download_dotfiles() {

    local tmpFile=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_in_purple "\n • Clone GitHub repository\n\n"

    if [ ! -d "$DOTFILES_DIRECTORY" ]; then
        execute \
            "git clone --quiet --recurse-submodules -j8 $DOTFILES_ORIGIN $DOTFILES_DIRECTORY" "Cloning in '$DOTFILES_DIRECTORY'"
    else
        ask_for_confirmation "'$DOTFILES_DIRECTORY' already exists, do you want to delete it?"
        if answer_is_yes; then
            rm -Rf $DOTFILES_DIRECTORY
            execute \
                "git clone --quiet --recurse-submodules -j8 $DOTFILES_ORIGIN $DOTFILES_DIRECTORY" "Cloning in '$DOTFILES_DIRECTORY'"
        fi
    fi

    print_result $? "Clone success" "true"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    cd "$DOTFILES_DIRECTORY" \
        || return 1

}

download_utils() {

    local tmpFile=""

    tmpFile="$(mktemp /tmp/XXXXX)"

    download "$DOTFILES_UTILS_URL" "$tmpFile" \
        && . "$tmpFile" \
        && rm -rf "$tmpFile" \
        && return 0

   return 1

}

verify_os() {

    declare -r MINIMUM_MACOS_VERSION="10.10"

    local os_name="$(get_os)"
    local os_version="$(get_os_version)"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if the OS is `macOS` and
    # it's above the required version.

    if [ "$os_name" == "macos" ]; then

        if is_supported_version "$os_version" "$MINIMUM_MACOS_VERSION"; then
            return 0
        else
            printf "Sorry, this script is intended only for macOS %s+" "$MINIMUM_MACOS_VERSION"
        fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    else
        printf "Sorry, this script is intended only for macOS!"
    fi

    return 1

}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {

    # Ensure that the following actions
    # are made relative to this file's path.

    cd "$(dirname "${BASH_SOURCE[0]}")" \
        || exit 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    check_internet_connection

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Load utils

    if [ -a "./bin/utils.sh" ]; then
        . "./bin/utils.sh" || exit 1
    else
        download_utils || exit 1
    fi

    print_in_purple "\n   Init new mac setup\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Ensure the OS is supported and
    # it's above the required version.

    verify_os \
        || exit 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ask_for_sudo

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if this script was run directly (./<path>/setup.sh),
    # and if not, it most likely means that the dotfiles were not
    # yet set up, and they will need to be downloaded.

    printf "%s" "${BASH_SOURCE[0]}" | grep "setup.sh" &> /dev/null \
        || download_dotfiles

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    #source ./bin/create_directories.sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    #source ./bin/create_symbolic_links.sh "$@"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    #source ./bin/create_local_config_files.sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

   # source ./bin/installs/main.sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    #source ./bin/preferences/main.sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # if cmd_exists "git"; then

    #     if [ "$(git config --get remote.origin.url)" != "$DOTFILES_ORIGIN" ]; then
    #         source ./bin/initialize_git_repository.sh "$DOTFILES_ORIGIN"
    #     fi

    #     # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    #     if ! $skipQuestions; then
    #         source ./bin/update_content.sh
    #     fi

    # fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # if ! $skipQuestions; then
    #     source ./bin/restart.sh
    # fi

}

main "$@"

