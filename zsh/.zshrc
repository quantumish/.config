# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/lib/emsdk/upstream/emscripten:/usr/lib/emsdk/node/12.18.1_64bit/bin:/usr/lib/emsdk:/usr/lib/emscripten/:$HOME/.cargo/bin/:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/quantumish/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
plugins=(git)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ydl="youtube-dl --extract-audio --audio-format mp3 -o '%(title)s.%(ext)s'"
alias neofetch="neofetch --ascii ~/.config/neofetch/arch.ascii"
alias gs="git status"
alias nano=mg
alias ls=lsd
alias hexdump=hexyl
alias cat=bat
alias rm=rip
alias gcc="gcc -Wall -Werror -pedantic-errors"
alias g++="g++ -Wall -Weffc++ -Werror -pedantic-errors"


function recompile() {
    cd ~/.config/$1
    sudo make clean install &> /dev/null
    cd -
}

function fix_titles() {
    for a in *
	id3v2 -t ${a%.mp3} $a
}

function themeage() {
    wal -i $1 &> /dev/null
    xdotool key alt+r &> /dev/null
    emacsclient --eval "(load-theme 'ewal-doom-one)" &> /dev/null
    /home/quantumish/.local/bin/pywalfox update
    python ~/test.py colors-wal-dwm2.h
    python ~/test.py colors-wal-dmenu2.h
    python ~/test.py zathurarc
    python ~/test.py colors-vis
    #recompile ~/herbe
    recompile dmenu
    #recompile ~/st
}

function say() {
    echo "\n(SayText \"$1\")" | festival --pipe
}

EVENTS=("A thick layer of fog manifests itself ahead of you in an instant..." "A blood moon is rising..." "The skies clear to reveal faraway galaxies..." "An ambient glow lingers in the night..." "Starry skies emerge from the pale sky..." "You are compelled to watch an old-timey Western film..." "The world seems to lose its color..." "A light fog reveals itself in the night..." "The sun shines down on you full force..." "You feel the temperature dropping...")
WALLPAPERS=("firewatch-monochrome.jpg" "firewatch-red.png" "firewatch-galaxy.jpg" "firewatch-night.png" "firewatch-stars.jpeg" "firewatch-sepia.jpg" "firewatch-desaturated.jpg" "firewatch-monochrome2.png" "firewatch-warm.png" "firewatch-cool.png")

function event() {
    RAND_INDEX="$(shuf -i 1-${#EVENTS[@]} -n 1)"
    notify-send ${EVENTS[RAND_INDEX]} && themeage ~/.config/wallpapers/${WALLPAPERS[RAND_INDEX]}
}

eval $(thefuck --alias)
eval "$(zoxide init zsh)"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source  /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
if [[ "$TERM" == "dumb" ]]
then
    unsetopt zle
    unsetopt prompt_cr
    unsetopt prompt_subst
    unfunction precmd
    unfunction preexec
    PS1='$ '
fi;
