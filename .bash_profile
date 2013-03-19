# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

### BEGIN MY SETTINGS ###
## Tells system to look in /usr/local/bin BEFORE /usr/bin:
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

## Sets path for Python 2.7
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

## Sets path for Node.js
export NODE_PATH="/usr/local/bin/node"
## Sets path for NPM
export NPM_PATH="/usr/local/bin/npm"

## DRUSH
export PATH=$PATH:$HOME/drush

## ANDROID DEVELOPER TOOLS
export PATH=$PATH:$HOME/Developer/ADT/sdk/tools
## ANDROID ADB
export PATH=$PATH:$HOME/Developer/ADT/sdk/platform-tools

## ENV VARIABLES AND FUNCTIONS FOR VIRTUALENVWRAPPER (UNCOMMENT AFTER INSTALL)
export WORKON_HOME=$HOME/virtualenvs
## Path for Virtualenvwrapper:
. /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh

## MySQL CONFIG PATH
export PATH=/usr/local/mysql/bin:$PATH
## Not needed - seems to be causeing an error in OSX 10.8+ .. commenting out for now:
#export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/mysql/lib/

## RVM for easy Ruby installation
# This loads RVM into a shell session (Should be last occurance in this file! http://bit.ly/sFXsQE)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
