# Zsh autocomplete using brew install zsh-autocomplete
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh





# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    ssh-agent
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# System update, upgrades, package search, etc. commands
alias upd='brew update && brew upgrade' # Update and upgrade using Homebrew
alias inst='brew install' # Install package using Homebrew
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
alias caff='caffeinate' # Caffeinate the system to keep it awake

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
alias config='cd ~/.config' # Change directory into ˜/.config
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
pokemon-colorscripts --no-title -r 1,3,6 # Display a random pokemon without the name from generations 1,3,6

# Thefuck
eval $(thefuck --alias) # Enable thefuck to run in the terminal


# Zsh sintax highligtning
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
