#!/bin/bash

# First, we'll define some paths to programs that we'll need. This is good
# practice for security and it also arguably keeps the script clean

LS="/usr/bin/ls --color=auto"

# Next, we'll simplify the mini-quizzes by wrapping them in a function. The 
# idea behind this is to provide a safe environment for the learner to run 
# commands in, while still feeling like a bash shell. 

function test_command {
    while true; do
        read -p "$TUTOR_PROMPT" command
        case $command in
            "$1") $2; break;;
            *) echo "Hmm, that didn't quite look right. Try typing '$1' and pressing Enter"
        esac
    done
}

cat <<EOF
______   __      ___  _   _   ______  _   _  ______  _____ ______
|  _  \\ /  \\   /  __|| | | | |__  __|| | | ||__  __|/  _  \\|  _  \\ 
| |_| //  0 \\ |  |__ | |_| |   | |   | | | |  | |   | / \\ || |_| /
|  _ < | __  | \\___ \\|  _  |   | |   | | | |  | |   | | | ||    < 
| |_| \\| | | | ___| || | | |   | |   | \\_/ |  | |   | \\_/ || |\\  \\
|_____/|_| |_| |____/|_| |_|   |_|   \\_____/  |_|   \\_____/|_| |_|  

Welcome to the interactive bash tutorial! To exit this tutorial at any \
time, press Ctrl+C. That is, press and hold the Control Key (Ctrl), and then \
press the C Key.

EOF

if [[ -z $USER ]]; then
    echo -e "What is your name?" 
    while [[ -z $USER ]]; do
        read USER
    done
    echo "Great! Let's get started then, $USER"
fi

# The user's progress will be stored in a hidden file in their home directory.
# This will just store a bunch of environment variables to track their 
# progress. This will be more useful as the tutorial gets longer.

if [[ ! -e ~/.bash_tutor_progress ]]; then 
    echo "USER=$USER" > ~/.bash_tutor_progress
else
    source ~/.bash_tutor_progress
    echo "Welcome back, $USER"
fi
echo

TUTOR_PROMPT="$USER@bash-tutor \$ "

echo "First and foremost, let's get you familiar with your environemt. Bash \
is a type of shell, which allows you to run commands on your computer or \
server. You can think of it like a window that strips away all the fancy \
graphics and user interfaces and leads you directly to the operating system. \
The part of the shell where you type these commands for the computer or server \
is called the prompt. For this tutorial, your prompt will consist of your \
name, the '@' symbol, and the name of this tutorial (bash-tutor) followed by \
your current working directory (the folder that you are currently in) and a $ \
sign, which is a common convention in bash. Let's start with your first \
command: ls. The ls command lists the files and directories in the folder that \
you are in by default. Try running it now"

test_command ls $LS

echo "Great work! Most commands can also take options (also known as flags) that modify their behavior. These options are usually preceded by a single or double hyphen. For example, with ls you can pass the -l flag to list more information on each of the files and directories. Try it now:"

test_command "ls -l" "$LS -l"

echo "Don't worry about what all of this means right now. We'll cover it later. For now, you can practice some other flags. A good one to remember is the --help flag, which usually provides you with a list of options you can use. This is sometimes shortened to just -h. For now though, let's talk about arguments. Arguments are additional pieces of information that you can give to a command to "


