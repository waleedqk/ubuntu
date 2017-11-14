# GIT

**Set SSH-Key**



**Ignore Local changes - git pull**

    git fetch --all
    git reset --hard origin/master

    git reset --hard origin/<branch_name>

    git checkout master
    git pull --all

**Retrieve the remote git address of a repo**

    git config --get remote.origin.url
    git remote show origin

**Change git access to SSH for repo**

    git remote set-url origin git@github.com:username/repo-name.git