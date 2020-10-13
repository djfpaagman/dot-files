# My dot files
These are the config files I use to set up my system the way I like it. I use OS X but I guess it will also work on Linux. Please use at your own risk :)

## General setup
```sh
git clone git@github.com:djfpaagman/dot-files.git ~/.dot-files
```

## Dependencies

* [macvim](https://github.com/macvim-dev/macvim)
* [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
* [alacritty](https://github.com/alacritty/alacritty)
* [powerlevel10k](https://github.com/romkatv/powerlevel10k)
* [tmux](https://github.com/tmux/tmux)

## Vim
```sh
ln -s ~/.dot-files/vimrc ~/.vimrc
ln -s ~/.dot-files/vim ~/.vim
ln -s ~/.dot-files/p10k.zsh ~/.p10k.zsh
ln -s ~/.dot-files/zshrc ~/.zshrc
ln -s ~/.dot-files/alacritty.yml ~/.alacritty.yml
ln -s ~/.dot-files/tmux.conf ~/.tmux.conf
ln -s ~/.dot-files/tmux ~/.tmux

```
