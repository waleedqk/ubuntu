# find files and folders

**Search current dir for file**

    find . -name "file.ext"

**Find folder from root**

    sudo find / -name foldername -type d

**Find folder, follow symbolic links**

    find -L /dir/to/start -xtype l -samefile ~/Pictures
