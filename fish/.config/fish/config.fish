#shell prompt starship
starship init fish | source
cd $HOME
cat ~/.cache/wal/sequences

function ex 
		/home/tipparn/.local/bin/ex $argv
end 

fish_add_path /home/tipparn/.local/bin
fish_add_path /home/tipparn/.emacs.d/bin
set -Ux XAUTHORITY /home/tipparn/.Xauthority
set -Ux EDITOR /usr/bin/nvim
#set Alias
alias la="exa -agGl" 
#set neovim 
alias vim="nvim"
alias s="startx"
## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
#continue download
alias wget="wget -c"
#application flatpak
alias electronmail="flatpak run com.github.vladimiry.ElectronMail"
#userlist
alias userlist="cut -d: -f1 /etc/passwd"

# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

#youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "


