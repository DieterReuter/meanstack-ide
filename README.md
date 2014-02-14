meanstack-ide
=============

An instant VitualMachine for application development with the MEAN Stack: 

`M`ongoDB - v2.4.9

`E`xpress - 

`A`ngular - 

`N`ode.js - v0.10.25 (NPM: v1.3.24)


Already globally installed Node.js development tools:

`npm install -g bower` - v1.2.8

`npm install -g grunt-cli` - v0.1.13

`npm install -g yo` - v1.1.2

`npm install -g generator-webapp` - v0.4.7

`npm install -g generator-angular` - v0.7.1


Easy start developing for the MEAN Stack on Ubuntu 12.04 (Precise 64Bit).

# Installation
You will need [Vagrant](http://vagrantup.com) and [VirtualBox](http://virtualbox.org) to install the Ubuntu Box. It will then install all the required parts for a complete MEAN Stack as well as some other tools you may need to start developing.

## Preparing the MEAN Stack IDE Ubuntu box
Just clone this repo and call `vagrant up` with the following commands:

    git clone https://github.com/DieterReuter/meanstack-ide.git
    cd meanstack-ide
    vagrant up

## Adding my Dotfiles
For a full featured Node.js/JavaScript IDE I'd like to recommend installing my personal Dotfiles.
There's an extensively fine tuned VIM 7.4 with JS specific Code Completion, Syntax Highlighting 
and other useful stuff.  Enjoy it.

    bash /vagrant/install-dotfiles-dr.sh

## Add user specific files for Git
To use git via ssh key, you can provide your ssh key in the resources
directory. This directory will be skipped from committing to git.

    resources/.ssh/id_rsa
    resources/.ssh/id_rsa.pub

To provide additional environment variables for git, use the `.extra` file.

    resources/.extra

The contents of the `.extra` file may look like this one:

    # -*- mode: sh -*-
    # vi: set ft=sh :
    # Git credentials
    # Not in the repository, to prevent people from accidentally committing under my name
    GIT_AUTHOR_NAME="Your Username"
    GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
    git config --global user.name "$GIT_AUTHOR_NAME"
    GIT_AUTHOR_EMAIL="your@email.com"
    GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
    git config --global user.email "$GIT_AUTHOR_EMAIL"

Then follow the steps at <https://help.github.com/articles/set-up-git>
If you want to generate SSH keys, follow the steps at <https://help.github.com/articles/generating-ssh-keys>

Now you can clone GitHub repos with

    git clone git@github.com:username/reponame.git


# Licensing
Copyright (c) 2014 Dieter Reuter

MIT License, see LICENSE.txt for more details.
