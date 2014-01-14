#!/bin/bash -x
mv -f package.box package.box.old
vagrant pristine -f
vagrant halt
vagrant package
vagrant box remove my-box
