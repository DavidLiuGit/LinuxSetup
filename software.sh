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
command -v sl > /dev/null || read -p "Install steam locomotive? (y/n)" -n 1 -r REPLY_SL
echo

# prompt - refind (EFI boot mgr)
read -p "Install refind boot manager? (y/n)" -n 1 -r REPLY_REFIND
echo



#################################################################################
# do all the installation approved by user
echo "Doing the installations you asked for..."

# install git
if [[ $REPLY_GIT =~ ^[Yy]$ ]]
then
	echo "Installing git..."
	sudo apt install git
fi

# install svn
if [[ $REPLY_SVN =~ ^[Yy]$ ]]
then
	echo "Installing svn..."
	sudo apt install subversion
fi

# install sl
if [[ $REPLY_SL =~ ^[Yy]$ ]]
then
	echo "Installing steam locomotive..."
	sudo apt install sl
fi

# install refind
if [[ $REPLY_REFIND =~ ^[Yy]$ ]]
then
	echo "Installing refind..."
	sudo apt-add-repository ppa:rodsmith/refind &&
	sudo apt-get update &&
	sudo apt-get install refind
fi



