#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias apup='sudo pacman -Syu'
alias depap='sudo pacman -Rns'
alias sepap='pacman -Ss'
alias po='sudo poweroff'
alias farlayout='setxkbmap -layout us,ir -option grp:alt_shift_toggle'
alias ytformat='yt-dlp --proxy 127.0.0.1:12334 --cookies-from-browser firefox -F'
alias ytdown='yt-dlp --proxy 127.0.0.1:12334 --cookies-from-browser firefox -f'
alias ytdownbest='yt-dlp --proxy 127.0.0.1:12334 --cookies-from-browser firefox -f "bv*+ba/b"'
alias ytdownbestplaylist='yt-dlp --proxy 127.0.0.1:12334 --cookies-from-browser firefox -f "bv*+ba/b" --playlist-start' #10 link --> from video 10 of the playlist
alias ytcc='yt-dlp --rm-cache-dir'


chh() { curl "cheat.sh/$1"; }
cpufreqs() { watch -n 1 "lscpu | grep MHz; echo '---'; grep 'cpu MHz' /proc/cpuinfo"; }

PS1='[\u@\h \W]\$ '
#PS1='> '

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

export PATH=$PATH:/home/masoud/.scripts

