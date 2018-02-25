#################################################################################
# USER PROMPTS
#################################################################################

# enable apt-add-repository
read -p "Allow apt-add-repository? This may be requried for 3rd party software (y/n): " -n 1 -r REPLY_APT_REPO
echo
if [[ $REPLY_APT_REPO =~ ^[Yy]$ ]]
then
	sudo apt install software-properties-common
else
	echo "apt-add-repository skipped"
fi

# prompt to install git, if not installed already
command -v git > /dev/null || read -p "Install git? (y/n): " -n 1 -r REPLY_GIT
echo

# prompt to install svn if not available
command -v svn > /dev/null || read -p "Install subversion? (y/n): " -n 1 -r REPLY_SVN
echo

# install sl
command -v sl > /dev/null || read -p "Install steam locomotive? (y/n): " -n 1 -r REPLY_SL
echo

# prompt - refind (EFI boot mgr)
read -p "Install refind boot manager? (y/n): " -n 1 -r REPLY_REFIND
echo

# prompt - VS Code
command -v code > /dev/null || read -p "Install VS Code? (y/n): " -n 1 -r REPLY_CODE
echo





#################################################################################
# INSTALLATION
#################################################################################

# do all the installation approved by user
echo "Doing the installations you asked for..."

# install git
if [[ $REPLY_GIT =~ ^[Yy]$ ]]
then
	echo "Installing git..."
	yes Y | sudo apt install git
fi

# install svn
if [[ $REPLY_SVN =~ ^[Yy]$ ]]
then
	echo "Installing svn..."
	yes Y | sudo apt install subversion
fi

# install sl
if [[ $REPLY_SL =~ ^[Yy]$ ]]
then
	echo "Installing steam locomotive..."
	yes Y | sudo apt install sl
fi

# install refind
if [[ $REPLY_REFIND =~ ^[Yy]$ ]]
then
	echo "Installing refind..."
	yes Y | sudo apt-add-repository ppa:rodsmith/refind &&
	sudo apt-get update &&
	yes Y | sudo apt-get install refind
fi

# install VS Code
if [[ $REPLY_CODE =~ ^[Yy]$ ]]
then
	echo "Installing VS Code..."
	curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
	sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
	sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
	sudo apt-get update
	yes Y | sudo apt-get install code
fi



