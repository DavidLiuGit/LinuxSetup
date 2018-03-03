#################################################################################
# USER PROMPTS
#################################################################################

# enable apt-add-repository
read -p "Allow apt-add-repository? This may be requried for 3rd party software (y/n): " -n 1 -r REPLY_APT_REPO
echo
if [[ $REPLY_APT_REPO =~ ^[Yy]$ ]]
then
	sudo apt install software-properties-common > /dev/null
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

# install npm
command -v npm > /dev/null || read -p "Install NPM? (y/n): " -n 1 -r REPLY_NPM
echo

# install reactjs & create-react-app, provided that npm is installed
command -v npm > /dev/null && 
command -v create-react-app > /dev/null || read -p "Install create-react-app? (y/n): " -n 1 -r REPLY_REACTJS
echo

# install babel, provided that npm is installed
command -v npm > /dev/null &&
command -v babel > /dev/null || read -p "Install babel? (y/n): " -n 1 -r REPLY_BABEL
echo

# prompt - refind (EFI boot mgr)
dpkg --list | grep refind > /dev/null || read -p "Install refind boot manager? (y/n): " -n 1 -r REPLY_REFIND
echo

command -v chromium-browser > /dev/null || read -p "Install chromium? (y/n): " -n 1 -r REPLY_CHROMIUM
echo

# prompt - VS Code
command -v code > /dev/null || read -p "Install VS Code? (y/n): " -n 1 -r REPLY_CODE
echo

# prompt - Spotify
command -v spotify > /dev/null || read -p "Install Spotify client? (y/n): " -n 1 -r REPLY_SPOTIFY
echo

# prompt - PowerTOP
command -v powertop > /dev/null || read -p "Install PowerTop? (y/n): " -n 1 -r REPLY_POWERTOP
echo

# prompt - elementary tweaks
dpkg --list | grep elementary-tweaks > /dev/null || read -p "Elementary OS only: install Elementary-Tweaks? (y/n): " -n 1 -r REPLY_ELEMENTARY_TWEAKS
echo

# prompt - htop
command -v htop > /dev/null || read -p "Install htop? (y/n): " -n 1 -r REPLY_HTOP
echo

#################################################################################
# INSTALLATION
#################################################################################

# do all the installation approved by user
echo "Doing the installations you asked for..."
apt-get moo

# install git
if [[ $REPLY_GIT =~ ^[Yy]$ ]]
then
	echo "Installing git..."
	yes Y | sudo apt install git &&
	git config --global push.default simple
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

# install npm
if [[ $REPLY_NPM =~ ^[Yy]$ ]]
then
	echo "Installing NPM..."
	yes Y | sudo apt install npm
	yes Y | sudo apt install nodejs-legacy
fi

# install reactjs & create-react-app
if [[ $REPLY_REACTJS =~ ^[Yy]$ ]]
then
	echo "Installing React..."
	yes Y | sudo npm install -g create-react-app
fi

# install babel & babel-cli
if [[ $REPLY_BABEL =~ ^[Yy]$ ]]
then
	echo "Installing Babel..."
	yes Y | sudo npm install -g babel
	yes Y | sudo npm install -g babel-cli
fi

# install refind
if [[ $REPLY_REFIND =~ ^[Yy]$ ]]
then
	echo "Installing refind..."
	yes Y | sudo apt-add-repository ppa:rodsmith/refind &&
	sudo apt-get update &&
	yes Y | sudo apt-get install refind
fi

# install chromium
if [[ $REPLY_CHROMIUM =~ ^[Yy]$ ]]
then
	echo "Installing chromium..."
	sudo add-apt-repository ppa:canonical-chromium-builds/stage && 
	sudo apt-get update &&
	sudo apt-get install chromium-browser
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

# install Spotify
if [[ $REPLY_SPOTIFY =~ ^[Yy]$ ]]
then
	yes Y |	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410 &&
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list &&
	sudo apt-get update &&
	yes Y | sudo apt-get install spotify-client
fi

# install PowerTop
if [[ $REPLY_POWERTOP =~ ^[Yy]$ ]]
then
	yes Y | sudo apt-get install powertop
fi

# install elementary-tweaks
if [[ $REPLY_ELEMENTARY_TWEAKS =~ ^[Yy]$ ]]
then
	yes Y | sudo add-apt-repository ppa:philip.scott/elementary-tweaks &&
	sudo apt-get update &&
	sudo apt-get install elementary-tweaks
fi

# install htop
if [[ $REPLY_HTOP =~ ^[Yy]$ ]]
then
	echo "Installing htop..."
	yes Y | sudo apt install htop
fi
