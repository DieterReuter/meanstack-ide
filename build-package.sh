#!/bin/bash -x
vagrant destroy -f
vagrant up
vagrant halt
mv -f package.box package.box.old
vagrant package
vagrant box remove my-box
