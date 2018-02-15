#!/usr/bin/env bash

eval "$(rbenv init -)"

alias kill-retail-connections="psql -c 'select pg_terminate_backend(pg_stat_activity.pid) from pg_stat_activity where pg_stat_activity.datname = '\''retail_development'\'' and pid <> pg_backend_pid()'"

alias core='cd ~/src/better-core'

alias gbranches="git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)' --count 15"

alias branchbye="git checkout master && git pull --ff-only && git checkout stage && git pull --ff-only && git merge --no-edit origin/master && git push origin stage"

alias sleep="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

alias reset-retail-bettermentdb="cd ~/src/better-core  && ./fresh -f && cd retail && bundle exec rake db:reset"

autocorrect ()
{
    echo 'Running Rubocop on all files (with cache)';
    FAILED_FILES=$(bundle exec rubocop -f files);
    if [ -n "$FAILED_FILES" ]; then
        echo "Errors found with the following files. Running autocorrect on them.";
        echo $FAILED_FILES;
        bundle exec rubocop --auto-correct $FAILED_FILES;
    else
        echo 'No Files to AutoCorrect!';
    fi
}

PATH=$HOME/git/arcanist/bin:$PATH
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
PATH=~/bin:$PATH
# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt
export EDITOR="vim"
# Load Bash It
source $BASH_IT/bash_it.sh

[ -f ~/.bashrc ] && source ~/.bashrc
