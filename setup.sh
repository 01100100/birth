GIT_EMAIL="davidwhittingham94@gmail.com"
GIT_USER_NAME = "01001100"



# Create ssh key
ssh-keygen -t ed25519 -C "${GIT_EMAIL}" -q -N "" -f ~/.ssh/id_ed25519
echo "Go to https://github.com/settings/ssh/new and enter the created ssh key."
echo "################################################################################"
cat /home/dave/.ssh/id_ed25519.pub
echo "################################################################################"

echo "Updating apt package manager..."
sudo apt update

echo "Installing curl..."
sudo apt install curl

echo "Installing git..."
sudo apt install git
git config --global user.name $GIT_USER_NAME
git config --global user.email $GIT_EMAIL
git config --global core.editor "code --wait"

echo "Installing vs code..."
sudo snap install code --classic

echo "Installing zsh..."
sudo apt install zsh 
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

echo "Installing pip..."
sudo apt-get -y install python3-pip

echo "installing pre-commit..."
pip install pre-commit

echo "Installing go..."
sudo snap install go --classic

echo "Installing poetry..."
curl -sSL https://install.python-poetry.org | python3 -
echo 'export PATH="/home/dave/.local/bin:$PATH"' >> ~/.zshrc


echo "Birth complete!"
