# Dotfiles


My config files. Basically for personal use

## Installation


*NOTE: These instructions delete current settings*

### Automatic

You just have to use `sh bootstrap.sh`. This is important that you are in the repo main directory, or the script will fail.

BOOM! You've done it.

### Manual

Sublime:

    cd ~/.config/sublime-text-3/Packages/
    rm -rf User Installed\ Packages
    ln -s ~/<path_to_this_directory>/sublime/User
    ln -s ~/<path_to_this_directory>/sublime/Installed\ Packages

Terminator

    cd ~/.config/
    rm -rf terminator
    ln -s ~/<path_to_this_directory>/terminator

inputrc

    cd ~/
    rm .inputrc
    ln -s ~/<path_to_this_directory>/.inputrc

pip

    cd ~/
    rm -rf .pip
    ln -s ~/<path_to_this_directory>/.pip

zsh

    cd ~/
    rm -rf .zshrc
    ln -s ~/<path_to_this_directory>/.zshrc

BOOMish! You've done it.