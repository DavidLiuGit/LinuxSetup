echo "Setup bash aliases by writing them to .bashrc"
echo "restart terminals after this is finished, or run source ~/.bashrc"

cat >> ~/.bashrc

# my aliases:

# less, starting reading from the end. Useful for reading most recent history
alias lessg="less +G"

# quick search for file recursively in current and sub dirs
alias ff="find . -iname "
