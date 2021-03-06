#############
#
# https://www.gnu.org/software/bash/manual/html_node/Aliases.html
# Following the below sugegstion from the default ~/.bashrc file
#
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
#
# This below section must be part of the ~/.bashrc file, towards the start of the file
#
# if [ -f ~/.bash_aliases ]; then
# . ~/.bash_aliases
# fi
#
#############

# upgrade system and remove unwanted packages afterwards
alias upgradesys='sudo pkcon refresh && sudo pkcon -y update && sudo apt autoremove -y && sudo apt autoclean -y'

# restart networkmanager service using system control
alias restartNMW='sudo systemctl restart network-manager'

# restart networkmanager service using nm's own utility
alias restartNMCli='nmcli networking off ; sleep 10 ; nmcli networking on'

# LibVrt (VirtualBox Guests) and KVM (Android Emulators) conflict and do not run together.
# Stop KVM emulation, by disabling the kernel module
alias kvmstop="sudo rmmod kvm_intel ; sudo rmmod kvm"

# Start KVM emulation, by enabling the kernel module
alias kvmstart="sudo insmod /lib/modules/$(uname -r)/kernel/arch/x86/kvm/kvm.ko ; sudo insmod /lib/modules/$(uname -r)/kernel/arch/x86/kvm/kvm-intel.ko"

# Map NeoVim to vi
alias vi="nvim"

# Start nVim in Realonly mode when needed
alias vir="nvim -R"

# Make some possibly destructive commands more interactive.
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Alias list of files to be readable and easy on the eyes.
alias ll='ls -larth --color=auto'
alias ls='ls -Fa --color=auto'

# Make output of commands human readable & use colors
alias df="df -h"
alias du="du -h"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Make directory navigation painless
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# Show open ports by default
alias showports='netstat -tulanp'

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -10'

# get top process eating cpu
alias pscpu='ps auxf | sort -nr -k 3 | head -10'

# Make wget start with continue option by default
alias wget='wget -c'

# Nordvpn related commands (QuickConnect and Disconnect)
alias vpnc="nordvpn c"
alias vpnd="nordvpn d"

#############
#
# The next section modifies the behavior of bash
#
#############

# Set the default editor to vim.
export EDITOR=nvim

# Avoid succesive duplicates in the bash command history.
export HISTCONTROL=ignoredups

# Append commands to the bash command history file (~/.bash_history)
# instead of overwriting it.
shopt -s histappend

# Append commands to the history every time a prompt is shown,
# instead of after closing the session.
PROMPT_COMMAND='history -a'
