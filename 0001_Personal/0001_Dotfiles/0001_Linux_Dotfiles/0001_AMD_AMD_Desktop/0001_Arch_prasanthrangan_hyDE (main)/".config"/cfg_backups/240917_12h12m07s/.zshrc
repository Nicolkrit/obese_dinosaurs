# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Path to powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# List of plugins used
plugins=( git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting )
source $ZSH/oh-my-zsh.sh

# In case a command is not found, try to find the package that has it
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]] ; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

function in {
    local -a inPkg=("$@")
    local -a arch=()
    local -a aur=()

    for pkg in "${inPkg[@]}"; do
        if pacman -Si "${pkg}" &>/dev/null ; then
            arch+=("${pkg}")
        else 
            aur+=("${pkg}")
        fi
    done

    if [[ ${#arch[@]} -gt 0 ]]; then
        sudo pacman -S "${arch[@]}"
    fi

    if [[ ${#aur[@]} -gt 0 ]]; then
        ${aurhelper} -S "${aur[@]}"
    fi
}

# Helpful aliases (original from HyDE)
#alias  c='clear' # clear terminal, already present, ignored
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
#alias un='$aurhelper -Rns' # uninstall package, already present, ignored
#alias up='$aurhelper -Syu' # update system/package/aur, already present, ignored
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list availabe package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
#alias vc='code' # gui code editor, already present, ignored



# Handy change dir shortcuts (original from HyDE) 
#alias ..='cd ..' , already present, ignored
#alias ...='cd ../..' , already present, ignored
#alias .3='cd ../../..' , already present, ignored
#alias .4='cd ../../../..' , already present, ignored
#alias .5='cd ../../../../..' , already present, ignored



# System update, upgrades, package search, etc. commands
alias upd='sudo pacman -Syu' # Update using pacman
alias pac='sudo pacman -S' # Install package using pacman
alias updnew='sudo pacman -Syyu' # Refresh nurrirs and update using pacman
alias search='pacman -Ss' # Search a package using pacman

alias y='yay' # Update using yay
alias ync='yay --noconfirm' # Update using yay without confirmations
alias yaynew='yay -Syuu' # Refresh nurrirs and update using yay
alias inst='yay -S' # Install a package using yay
alias search='yay -Ss' # Search a package using yay
alias yaycache='yay -Scc' # Clear the package cache, freeing disk spaces
alias rem='yay -R' # Remove a package using yay




# General setup commands 
alias sudo='sudo ' # Facilitate sudo command
alias c='clear' # Clear the terminal
alias h='history' # Output the terminal session hystory in the terminal
alias which='type -a' # Help determine how a command would be interpreted
alias grep='grep --color=auto' # Enable color highlight to match the text in grep
alias fgrep='fgrep --color=auto' # Enable color highlight to match the text in fgrep
alias erep='egrep --color=auto' # Enable color highlight to match the text in egrep
alias untar='tar -xvzf' # Unzip a .zip
alias zshrc='source ~/.zshrc' # Fetch ~/.zshrc for changes in the config

alias reb='reboot' # Reboot the system
alias shut='shutdown -h now' # Shutdown the system without delay

alias del='sudo rm -r' # Remove a file or a directory recursively
alias cp='cp -i' # Ask user confirmation before overwriting existing files
alias mkdir='mkdir -p' # Creates parent directory if needed



# System navigation setup commands
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'



# System navigation commands 
alias downloads='cd ~/Downloads' # Change directory into ~Downloads
alias lib='cd /usr/lib' # Change directory into /usr/lib
alias share='cd /usr/share' # Change directory into /usr/share
alias config='cd ~/.config/' # Change directory into ~/.config



# Version control commands
alias clone='git clone' # Clone a github repo
alias clonedepth1='git clone --depth=1' # Clone a github repos only the last commit
alias gac='git add -A && git commit -m "directory management" && git push' # Push changes to a github repos with a generic messages
alias gitkeep='find . -type d -empty -not -path "./.git/*" -exec touch {}/.gitkeep \;' # Find all folders without content from the current to the subdirectories and put a .gitkeep file
alias gpamaster='cd /home/krit/0001_Github_Repos && ./gitpullmaster.sh' # Find all repositories from the root to the subdirectories and pull the latest changes from branch master
alias gpamain='cd /home/krit/0001_Github_Repos && ./gitpullmain.sh'  # Find all repositories from the root to the subdirectories and pull the latest changes from branch main



# Repositories navigation commands
alias setup='cd /home/krit/0001_Github_Repos/0001_Linux_Setup' # Change directory into the linux setup github repos
alias personal='cd /home/krit/0001_Github_Repos/0002_Personal_Repos' # Change directory into the personal github repos
alias work='cd /home/krit/0001_Github_Repos/0003_Work' # Change directory into the work github repos
alias other='cd /home/krit/0001_Github_Repos/0004_Various' # Change directory into the various github repos



# Fun commands
alias boxesdog='echo "Popi Popi" | boxes -d dog -a c' # Show an ascii dog with a message
alias cv='cava' # Use cava to display the audio bars in the shell
alias infbonsai='cbonsai -S' # Loop an infinite bonsai
alias pokdialga='pokemon-colorscripts --name dialga' # Output dialga in the shell
alias pipes1='pipes.sh -t1' # Display pipes with theme 1
alias pipes2='pipes.sh -t2' # Display pipes with theme 2
alias pipes3='pipes.sh -t3' # Display pipes with theme 3
alias pipes4='pipes.sh -t4' # Display pipes with theme 4
alias pipes5='pipes.sh -t5' # Display pipes with theme 5
alias pipes6='pipes.sh -t6' # Display pipes with theme 6
alias pipes7='pipes.sh -t7' # Display pipes with theme 7
alias pipes8='pipes.sh -t8' # Display pipes with theme 8
alias pipes9='pipes.sh -t9' # Display pipes with theme 9


# Hyprland specific commands
alias hymonitors='hyprctl monitors' # Display connected monitors
alias hyclients='hyprctl clients' # Display currently open applications
alias hyprlandconf=' nvim ~/.config/hypr/hyprland.conf' # Neovim into the hyprland base configuration
alias hyprlandkeybindings='nvim ~/.config/hypr/keybindings.conf' # Neovim into the hyprland base keybindings configuration



# HyDE specific commands
alias sddmtheme='Hyde sddm theme' # Change sddm theme
alias HyDEupd='cd ~/HyDE/Scripts && git pull && ./install.sh -r' # Update last changes from HyDE and put old configurations in ~/.config/cfg_backups
alias HyDErestore='Hyde restore ...' # Update last changes from HyDE with restore and backup options
alias HyDEthemes='Hyde theme patch' # Go again through the installation of themes and choice of sddm themes


# Other configuration helper commands
alias wallpaperfix='swwwallpaper.sh' # Force to apply the current swww wallpaper, for example if it is black, eg not displaying. Alternative to system reboot

# Always mkdir a path (this doesn't inhibit functionality to make a single dir) (original from HyDE) 
#alias mkdir='mkdir -p' , already present, ignored

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Display Pokemon
pokemon-colorscripts --no-title -r 1,3,6 # Display a random pokemon without the name from generations 1,3,6

# The fuck
eval $(thefuck --alias) # Enable thefuck to run in the terminal
