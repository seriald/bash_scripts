#! /bin/bash
#
# source: 
# https://unix.stackexchange.com/questions/6345/how-can-i-get-distribution-name-and-version-number-in-a-simple-shell-script

# Setting global user details
echo "Configuring git"
git config --global user.name "Robert Fleming"
git config --global user.email robert.fleming@vitori.org

# Setting .gitignore settings
echo "Setting .gitignore settings"
echo ""
touch ~/.gitignore
git config --global core.excludesFile ~/.gitignore

echo "*.log" >> ~/.gitignore 
echo ".DS_Store" >> ~/.gitignore

## Removing duplicate entries

# sort ~/.gitignore | uniq -u
perl -ne 'print if ! $a{$_}++' ~/.gitignore | tee ~/.gitignore.tmp
mv ~/.gitignore.tmp ~/.gitignore
echo ""
cat ~/.gitignore

# Detecting OS being used
echo "Detecting OS"
echo "..."

if [ "$(uname)" = "Darwin" ]; then
    OS="Darwin"

elif [ "$(uname)" = "*MINGW64*" ]; then
    OS="Windows"

elif [ "$(uname)" = "Linux" ]; then
    if [ -f /etc/os-release ]; then
        # freedesktop.org and systemd
        . /etc/os-release
        OS=$NAME
        VER=$VERSION_ID
        elif type lsb_release >/dev/null 2>&1; then
        # linuxbase.org
        OS=$(lsb_release -si)
        VER=$(lsb_release -sr)
        elif [ -f /etc/lsb-release ]; then
        # For some versions of Debian/Ubuntu without lsb_release command
        . /etc/lsb-release
        OS=$DISTRIB_ID
        VER=$DISTRIB_RELEASE
        elif [ -f /etc/debian_version ]; then
        # Older Debian/Ubuntu/etc.
        OS=Debian
        VER=$(cat /etc/debian_version)
        elif [ -f /etc/SuSe-release ]; then
        # Older SuSE/etc.
        OS=suse
        elif [ -f /etc/redhat-release ]; then
        # Older Red Hat, CentOS, etc.
        OS=redhat
        VER=$(cat /etc/redhat_version)
        ...
    else
        # Fall back to uname, e.g. "Linux <version>", also works for BSD, 
etc.
        OS=$(uname -s)
        VER=$(uname -r)
    fi
fi

echo "Operating System detected $OS"
echo ""

# Install packages based on OS
echo "Installing Git-Extras for $OS"

case $OS in
	*"Debian"*)
	
	sudo apt  install git-extras
esac

case $OS in
        *"Darwin"*)
        brew install git-extras
esac

case $OS in
        *"Windows"*)   
        echo "No known install available for $OS"  
esac 

case $OS in
        *"redhat"*)
        sudo yum install git-extras
esac


case $OS in
	*"Kali"*)
	sudo apt install git-extras
esac

case $OS in
        *"Raspbian"*)
        sudo apt install git-extras
esac

