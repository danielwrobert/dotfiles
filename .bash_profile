# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
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

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Finder Dock Mail Safari iTunes iCal Address\ Book SystemUIServer" killall

### BEGIN MY SETTINGS ###
# Sets path for Python 2.7
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Sets path for Node.js
export NODE_PATH="/usr/local/bin/node"
# Sets path for NPM
export NPM_PATH="/usr/local/bin/npm"

# ENV VARIABLES AND FUNCTIONS FOR VIRTUALENVWRAPPER (UNCOMMENT AFTER INSTALL)
#export WORKON_HOME=$HOME/virtualenvs
# DON'T USE NEXT LINE - KEEP COMMENTED .. USE NEXT PATH:
##. $HOME/bin/virtualenvwrapper.sh
# USE THIS PATH:
#. /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh

## MySQL CONFIG PATH (NOT CURRENTLY THE CORRECT PATH - NEED TO RESEARCH)
export PATH=/usr/local/mysql/bin:$PATH
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

# RVM for easy Ruby installation
# This loads RVM into a shell session (Should be last occurance in this file! http://bit.ly/sFXsQE)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
