

rm -rf ~/.inputrc ~/.pip ~/.zshrc ~/.config/sublime-text-3 ~/.config/terminator

mkdir -p ~/.config/ ~/.config/sublime-text-3/Packages

ln -s $PWD/.inputrc ~/.inputrc
ln -s $PWD/.pip ~/.pip
ln -s $PWD/.zshrc ~/.zshrc
ln -s $PWD/terminator ~/.config/
ln -s $PWD/sublime/User ~/.config/sublime-text-3/Packages/User
ln -s $PWD/sublime/Installed\ Packages ~/.config/sublime-text-3/Installed\ Packages
echo "DONE"

read -p "Do you want to change your shell to zsh? (y/n)" choice
case "$choice" in
  y|Y ) chsh -s /usr/bin/zsh;;
  n|N ) exit 0;;
  * ) echo "invalid";;
esac
