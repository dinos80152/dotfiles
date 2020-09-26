#!/bin/sh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# install plugin
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install colors
gem install colorls

ln -sf $PWD/.gitconfig $HOME/.gitconfig
ln -sf $PWD/.zshrc $HOME/.zshrc
ln -sf $PWD/.profile $HOME/.profile
ln -sf $PWD/.oh-my-zsh/custom/powerlevel9k.sh $HOME/.oh-my-zsh/custom/powerlevel9k.sh
