#!/bin/bash

# First, we'll define some paths to programs that we'll need. This is good
# practice for security and it also arguably keeps the script clean

CP=/usr/bin/cp
ECHO="echo -e"
LS="/usr/bin/ls --color=auto"
MKDIR=/usr/bin/mkdir
MV=/usr/bin/mv
RM=/usr/bin/rm
SLEEP=/usr/bin/sleep
TOUCH=/usr/bin/touch

# Next, we'll simplify the mini-quizzes by wrapping them in a function. The 
# idea behind this is to provide a safe environment for the learner to run 
# commands in, while still feeling like a bash shell. 

function test_command
{
    # Usage: test_command <hint> <command to run>
    while true; do
        read -p "$TUTOR_PROMPT" command
        case $command in
            "$1") $2; break;;
            *) $ECHO "Hmm, that didn't quite look right. Try typing '$1' and pressing Enter"
        esac
    done
}

function save_progress
{
    # Usage: save_progress <user> <tutor prompt> <progress>
    cat <<EOF > ~/.bash_tutor_progress
USER=$1
TUTOR_PROMPT="$2"
PROGRESS=$3
EOF
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

$SLEEP 2

if [[ -z $USER ]]; then
    $ECHO -e "What is your name?" 
    while [[ -z $USER ]]; do
        read USER
    done
    $ECHO "Great! Let's get started then, $USER"
fi

# The user's progress will be stored in a hidden file in their home directory.
# This will just store a bunch of environment variables to track their 
# progress. This will be more useful as the tutorial gets longer.

TUTOR_PROMPT="$USER@bash-tutor ~ \$ "

if [[ ! -f ~/.bash_tutor_progress ]]; then 
    PROGRESS="1.0"
    save_progress $USER "$TUTOR_PROMPT" "1.0"
else
    source ~/.bash_tutor_progress
    $ECHO "Welcome back, $USER"
fi

while true; do
    case $PROGRESS in
        "1.0")
            $ECHO "First and foremost, let's get you familiar with your environemt. Bash \
is a type of shell, which allows you to run commands on your computer or \
server. You can think of it like a window that strips away all the fancy \
graphics and user interfaces and leads you directly to the operating system. \
The part of the shell where you type these commands for the computer or server \
is called the prompt.";

            $SLEEP 2;

            $ECHO "For this tutorial, your prompt will consist of your \
name, the '@' symbol, and the name of this tutorial (bash-tutor) followed by \
your current working directory (the folder that you are currently in) and a $ \
sign, which is a common convention in bash. The '~' symbol is short-hand for \
your home directory, which is where all of your personal folders and files \
are kept. Let's start with your first command: ls. The ls command lists the \
files and directories in the folder that you are in by default. Try running \
it now:\n";

            test_command ls $LS;

            $SLEEP 2;

            save_progress $USER "$TUTOR_PROMPT" "1.1";

            ;&

        "1.1")
            $ECHO "\nMost commands can also take options (also known as flags) \
that modify their behavior. These options are usually preceded by a single or \
double hyphen. For example, with ls you can pass the -l flag to list more \
information on each of the files and directories. Try it now:\n";

            test_command "ls -l" "$LS -l";

            $SLEEP 2;

            $ECHO "\nDon't worry about what all of this means right now. We'll \
cover it later. For now, you can practice some other flags. A good one to \
remember is the --help flag, which usually provides you with a list of \
options you can use. This is sometimes shortened to just -h. Try it now.";

            test_command "ls -h" "$LS -h";

            $SLEEP 2;

            $ECHO "Arguments are additional pieces of information that you can give to a \
command that usually change the location of where the command is run. For \
example, running the 'ls' command as we did before lists the contents of the \
current directory we are in. If you supply ls with a file or folder on the \
system though, it will print out that file's name or that folder's contents. \
Try running 'ls' on the '/' directory.\n";

            test_command "ls /" "$LS /";

            $SLEEP 2;

            $ECHO "\nWhat you're looking at is the root directory of your \
system. This is basically what holds all of the files and folders that run \
the Linux operating system. We'll go over what each folder is for in a later \
lesson.";

            $SLEEP 2;

            save_progress $USER "$TUTOR_PROMPT" "1.2";

            ;&

        "1.2")
            $ECHO "Being able to look at different folder contents is nice, but \
sometimes you may need to be able to move around into different folders \
for easier access to your files. To do this, you use the 'cd' command. Try 
running it now, and change to the /etc directory.\n";

            $SLEEP 2;

            test_command "cd /etc" "cd /etc";

            TUTOR_PROMPT="$USER@bash-tutor /etc \$ ";

            $ECHO $TUTOR_PROMPT;

            $SLEEP

            $ECHO "\nThe 'cd' command, without any arguments, brings you back to \
your home directory. Try it now.\n";

            test_command "cd" "cd";

            TUTOR_PROMPT="$USER@bash-tutor ~ \$ ";

            $ECHO $TUTOR_PROMPT;

            $SLEEP 2; 

            save_progress $USER "$TUTOR_PROMPT" "1.3";

            ;&

        "1.3")
            $ECHO "\nWhen you move around a lot, you may forget where you are. \
Luckily, there's a command for situations just like that. 'pwd' is what \
you'll be looking for. You can remember it as 'print working directory', if \
that helps. Try running it now.\n";

            test_command "pwd" "pwd";

            $SLEEP 2; 

            save_progress $USER "$TUTOR_PROMPT" "1.4";

            ;&

        "1.4")
            $ECHO "\nNow we'll get into creating files and directories. We'll \
start with the 'touch' command. The 'touch' command allows you to create an \
empty file. Try using it now to create a file called 'file1.txt' now.\n";

            test_command "touch file1.txt" "$TOUCH file1.txt";

            $SLEEP 2; 

            save_progress $USER "$TUTOR_PROMPT" "1.5";

            ;&

        "1.5")
            $ECHO "\nOnce you've created a file, it's also helpful to be able \
to copy it. To do this, you use the 'cp' command. 'cp' takes two arguments by \
default, first the original file, and then the new copy. Try copying \
'file1.txt' to a new file named 'file2.txt'.\n";

            test_command "cp file1.txt file2.txt" "$CP file1.txt file2.txt";

            $SLEEP 2; 

            save_progress $USER "$TUTOR_PROMPT" "1.6";

            ;&

        "1.6")
            $ECHO "\nDirectories can be created with the 'mkdir' command. Try \
creating a directory called 'test' now.\n";

            test_command "mkdir test" "$MKDIR test";

            $SLEEP 2; 

            save_progress $USER "$TUTOR_PROMPT" "1.7";

            ;&

        "1.7")
            $ECHO "\nYou can also move files around from the command line. \
To do this, you use the 'mv' command. Try moving 'file1.txt' into the 'test/' \
directory. Directories are usually appended with a '/'.\n";

            test_command "mv file1.txt test/" "$MV file1.txt test/";

            $SLEEP 2; 

            $ECHO "\n'mv' is also useful for renaming files from the command \
line. This also takes two arguments, in the same way that 'cp' does. Try \
renaming 'file2.txt' to 'file3.txt' now.\n"

            test_command "mv file2.txt file3.txt" "$MV file2.txt file3.txt";

            $SLEEP 2; 

            save_progress $USER "$TUTOR_PROMPT" "1.8";

            ;&

        "1.8")
            $ECHO "\nLet's not leave all of these test files lying around. \
To delete files from the command line, you use the 'rm' command. Be very \
careful with this though, because once a file is deleted from the command \
line, it's gone forever. At the very least it is very expensive to recover. \
For this tutorial though, you're safe. Go ahead and delete 'file3.txt' now.\n";

            test_command "rm file3.txt" "$RM file3.txt";

            $SLEEP 2; 

            $ECHO "\nDeleting directories requires the '-r' option. I usually \
like to add the '-f' flag with this as well, because otherwise 'rm' will ask \
you to confirm each file deletion. When you pass multiple options in the same \
command, you can put them together with the same hyphen. Try running 'rm with \
both the 'r' and 'f' flags on the test directory..\n";

            test_command "rm -rf test" "$RM -rf test";

            $SLEEP 2; 

            save_progress $USER "$TUTOR_PROMPT" "2.0";

            ;&

        "2.0")
            $ECHO "\nCongrats on completing the first part of the tutorial!\n"

            $ECHO "\nYou've reached the end of the tutorial, for now. Check \
back on either the GitHub page for this project, or my personal blog at \
https://wbrawner.com/blog, where I will also be posting updates, to see if \
there is a newer version with more lessons. Thanks for testing!";
            break;;
    esac
done
