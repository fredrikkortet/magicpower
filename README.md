# MagicPower
## This is my dotfiles


## Installing

To get the dotfiles you will need `git` and GNU `stow` 

Clone the repository in your Home directory `~`

```bash
git clone https://github.com/fredrikkortet/magicpower.git
```
Then cd into the directory and run `stow` to get symlink everything you can either symlink the whole dotfiles or just one you want.
```bash 
cd magicpower
```
To symlink all dotfiles:
```bash
stow */
```
To only choose one:
```bash
stow alacritty
```
