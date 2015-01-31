# General installation
* Clone to home directory
* Run 'make.sh'
* The script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# Vim config
* Wipe out your `~/.vimrc` file and `~/.vim` directory (back up if you wish)
* `git clone https://github.com/derekwyatt/vim-config.git ~/.vim`
* `cd ~/.vim/bundle && ./get`
* `ln ~/.vim/vimrc ~/.vimrc`
* Start Vim

Occassionally, the bundles may need updating.  To do this, `cd ~/.vim && ./update`