# System update, upgrades, package search, etc. commands
alias upd='brew update && brew upgrade' # Update and upgrade using Homebrew
alias install='brew install' # Install package using Homebrew
alias search='brew search' # Search a package using Homebrew
alias brewcache='brew cleanup' # Clear the package cache, freeing disk space

# General setup commands 
alias sudo='sudo ' # Facilitate sudo command

alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree

alias c='clear' # Clear the terminal

alias h='history' # Output the terminal session history in the terminal

alias which='type -a' # Help determine how a command would be interpreted

alias grep='grep --color=auto' # Enable color highlight to match the text in grep
alias fgrep='fgrep --color=auto' # Enable color highlight to match the text in fgrep
alias egrep='egrep --color=auto' # Enable color highlight to match the text in egrep

alias untar='tar -xvzf' # Unzip a .tar.gz

alias zshrc='source ~/.zshrc' # Fetch ~/.zshrc for changes in the config

alias reb='sudo reboot' # Reboot the system
alias shut='sudo shutdown -h now' # Shutdown the system without delay

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
alias downloads='cd ~/Downloads' # Change directory into ~/Downloads
alias share='cd /usr/local/bin' # Change directory into /usr/local/bin
alias opt='cd /usr/local/bin' # Change directory into /usr/local/opt

# Version control commands
alias clone='git clone' # Clone a GitHub repo
alias clonedepth1='git clone --depth=1' # Clone a GitHub repo with only the last commit
alias gac='git add -A && git commit -m "directory management" && git push' # Push changes to a GitHub repo with a generic message
alias gitkeep='find . -type d -empty -not -path "./.git/*" -exec touch {}/.gitkeep \;' # Find all folders without content from the current to the subdirectories and put a .gitkeep file

# Repositories navigation commands
alias setup='cd ~/0001_Github_Repos/0001_MacOS_Setup' # Change directory into the setup project
alias personal='cd ~/0001_Github_Repos/0002_Personal_repos' # Change directory into the personal projects
alias work='cd ~/0001_Github_Repos/0003_Work' # Change directory into the work projects
alias various='cd ~/0001_Github_Repos/0004_Various' # Change directory into various projects

# Fun commands
alias pokdialga='pokemon-colorscripts --name dialga' # Output Dialga in the shell
alias pipes1='pipes.sh -t1' # Display pipes with theme 1
alias pipes2='pipes.sh -t2' # Display pipes with theme 2
alias pipes3='pipes.sh -t3' # Display pipes with theme 3
alias pipes4='pipes.sh -t4' # Display pipes with theme 4
alias pipes5='pipes.sh -t5' # Display pipes with theme 5
alias pipes6='pipes.sh -t6' # Display pipes with theme 6
alias pipes7='pipes.sh -t7' # Display pipes with theme 7
alias pipes8='pipes.sh -t8' # Display pipes with theme 8
alias pipes9='pipes.sh -t9' # Display pipes with theme 9

# Display Pokemon
pokemon-colorscripts --no-title -r 1,3,6 # DVisplay a random pokemon without the name from generations 1,3,6

# Plugins
plugins=(git ssh-agent)

# Thefuck
eval $(thefuck --alias) # Enable thefuck to run in the terminal
