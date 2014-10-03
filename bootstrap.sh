

rm -rf ~/.inputrc ~/.pip ~/.zshrc ~/.config/sublime-text-3 ~/.config/terminator

mkdir -p ~/.config/terminator ~/.config/sublime-text-3/Packages

ln -s $PWD/.inputrc ~/.inputrc
ln -s $PWD/.pip ~/.pip
ln -s $PWD/.zshrc ~/.zshrc
ln -s $PWD/terminator ~/.config/terminator
ln -s $PWD/sublime/User ~/.config/sublime-text-3/Packages/User
ln -s $PWD/sublime/Installed\ Packages ~/.config/sublime-text-3/Installed\ Packages

echo "DONE"