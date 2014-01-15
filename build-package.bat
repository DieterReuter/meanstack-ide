call vagrant pristine -f
call vagrant halt
mv -f package.box package.box.old
call vagrant package
call vagrant box remove my-box
