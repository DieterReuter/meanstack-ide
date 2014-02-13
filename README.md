meanstack-ide
=============

An instant VitualMachine for application development with the MEAN Stack: 

`M`ongoDB - v2.4.9, see [MongoDB.com](http://www.mongodb.com)

`E`xpress - , see [ExpressJS.com](http://expressjs.com)

`A`ngular - , see [AngularJS.org](http://angularjs.org)

`N`ode.js - v0.10.25 (NPM: v1.3.24), see [NodeJS.org](http://nodejs.org)


Already globally installed Node.js development tools:

`npm install -g bower` - v1.2.8, see [Bower.io](http://bower.io)

`npm install -g grunt-cli` - v0.1.13, see [GruntJS.com](http://gruntjs.com)

`npm install -g yo` - v1.1.2, see [Yeoman.io](http://yeoman.io)

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

or

    git clone https://github.com/DieterReuter/dotfiles.git ~/code/dotfiles
    cd ~/code/dotfiles
    ./sync.sh -f		


# Licensing
Copyright (c) 2014 Dieter Reuter

MIT License, see LICENSE.txt for more details.
