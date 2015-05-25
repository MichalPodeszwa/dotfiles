

rm -rf ~/.inputrc ~/.zshrc ~/.config/sublime-text-3 ~/.config/terminator ~/.zsh ~/.i3 ~/.i3status.conf

mkdir -p ~/.config/ ~/.config/sublime-text-3/Packages

ln -s $PWD/.inputrc ~/.inputrc
ln -s $PWD/.zsh ~/.zsh
ln -s $PWD/.zshrc ~/.zshrc
ln -s $PWD/terminator ~/.config/
ln -s $PWD/sublime/User ~/.config/sublime-text-3/Packages/User
ln -s $PWD/sublime/Installed\ Packages ~/.config/sublime-text-3/Installed\ Packages
ln -s $PWD/.i3 ~/.i3
ln -s $PWD/.i3status.conf ~/.i3status.conf
echo "I need root to link synaptics file"
sudo rm -f /etc/X11/xorg.conf.d/50-synaptics.conf
sudo ln -s $PWD/X11/xorg.conf.d/50-synaptics.conf /etc/X11/xorg.conf.d/50-synaptics.conf
echo "DONE"

read -p "Do you want to change your shell to zsh? (y/n)" choice
case "$choice" in
  y|Y ) chsh -s /usr/bin/zsh;;
  n|N ) exit 0;;
  * ) echo "invalid";;
esac
