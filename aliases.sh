echo "Setup bash aliases by writing them to .bashrc"
echo "restart terminals after this is finished, or run source ~/.bashrc"

echo "\n\n\n"  >> ~/.bashrc

# my aliases:

# less, starting reading from the end. Useful for reading most recent history
echo 'alias lessg="less +G" ' >> ~/.bashrc

# quick search for file recursively in current and sub dirs
echo 'alias ff="find . -iname "' >> ~/.bashrc

# disable trackpad acceleration
xset q | grep -A 1 Pointer
xset m 0/1 4

source ~/.bashrc

