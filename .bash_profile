# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don't want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,aliases_private,functions,functions_private,profile}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

### BEGIN MY SETTINGS ###
## Tells system to look in /usr/local/bin BEFORE /usr/bin:
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

## DRUSH
export PATH=$PATH:$HOME/Developer/drush

## ANDROID DEVELOPER TOOLS
export PATH=$PATH:$HOME/Developer/ADT/sdk/tools
## ANDROID ADB
export PATH=$PATH:$HOME/Developer/ADT/sdk/platform-tools

## ENV VARIABLES AND FUNCTIONS FOR VIRTUALENVWRAPPER (UNCOMMENT AFTER INSTALL)
export WORKON_HOME=$HOME/virtualenvs
## Path for Virtualenvwrapper:
. /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh

## MySQL CONFIG PATH
# NOTE: This is for the system MySQL and I have since removed it.
#export PATH=/usr/local/mysql/bin:$PATH
## Not needed - seems to be causeing an error in OSX 10.8+ .. commenting out for now
#export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/mysql/lib/

## PHP CLI version (via Homebrew)
#export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"

# WP-CLI directory (Set when using MAMP)
#export PATH=/Users/danielrobert/.wp-cli/bin:$PATH
#export WP_CLI_PHP=/Applications/MAMP/bin/php/php5.5.9/bin/php

# Composer
export PATH="$PATH:$HOME/.composer/vendor/bin"

# PHP_CodeSniffer & WordPress Coding Standards - https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards
export PATH="$PATH:$HOME/wpcs/vendor/bin"

# WP-CLI Bash completions
source $HOME/.wp-cli/vendor/wp-cli/wp-cli/utils/wp-completion.bash

# Set SVN Default Editor to VIM
export SVN_EDITOR=vim

# GIT Autocomplete
source ~/.git-completion.bash

# Set up path jumping with symbolic links
# Ref - http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
export MARKPATH=$HOME/.marks
function jump {
	cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
	mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
	rm -i "$MARKPATH/$1"
}
function marks {
	\ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}
# Tab completion for Jump and Unmark commands
_completemarks() {
  local curw=${COMP_WORDS[COMP_CWORD]}
  local wordlist=$(find $MARKPATH -type l -exec basename {} \;)
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}
complete -F _completemarks jump unmark

## NODE.JS
# Sets path for Node.js
export NODE_PATH="/usr/local/bin/node"
# Sets path for NPM
export NPM_PATH="/usr/local/bin/npm"
# Sets path for NPM root value
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

## PYTHON
# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

## RUBY
# RVM for easy Ruby installation
# This loads RVM into a shell session (Should be last occurance in this file! http://bit.ly/sFXsQE)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
