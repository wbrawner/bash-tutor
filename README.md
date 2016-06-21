Interactive Linux/Bash Tutorial
===============================

## v0.1.0

### What is this?

The purpose of this tutorial is to teach the basic concepts of Linux and bash to aspiring Linux system administrators. While there are plenty of on-line tutorials that already achieve this, I've set out to create one that would be run from the command line, to integrate learners even more in the environment that they will be working in. This is just a work in progress, so feel free to take it and do what you want with it.

### How does it work?

This tutorial goes over several commands and concepts related to bash and linux, before prompting the user to run them and see for themselves how it works. None of the commands are actually run, however, until the user gets the command right. This is a security feature to prevent newbies from accidentally ruining their system. 

### License and Contributing

I've decided to use the MIT license for this project, because I want this to be freely available to anyone and everyone. So take it, change it, modify it, do what you want with it. Feel free to make a pull request if you want to contribute something to the code as well. I'd be happy to include them :)

Roadmap
-------

### v1.0 File system management
  * Concepts:
    - Basic overview of file system structure
    - running commands, using flags & arguments
  * Commands:
    - ~~ls~~
    - cd
    - mv
    - cp
    - rm
    - touch
    - mkdir
    - pwd

### v2.0 Reading and editing files
  * Concepts:
    - pipes
    - directing output (overwrite vs append)
  * Commands
    - vim
    - vimtutor
    - cat
    - tail
    - head
    - echo

### v3.0 User and group management
  * Concepts:
    - Users & Groups
    - Permissions
    - File attributes
  * Commands:
    - useradd
    - usermod
    - groupadd
    - chmod
    - chown
    - lsattr
    - chattr

### v4.0 Managing software
  * Concepts:
    - Packages
    - Package managers
  * Commands
    - dpkg/rpm
    - apt-get/dnf/yum/zypper

### v5.0 SSH
  * Concepts:
    - Managing remote systems
    - SSH Keys
  * Commands
    - ssh
    - sftp
    - scp
    - ssh-keygen

### v6.0 System processes:
  * Concepts:
    - Processes
    - Memory/CPU usage
  * Commands:
    - ps
    - top
    - htop
    - kill
    - killall
