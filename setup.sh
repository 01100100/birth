GIT_EMAIL="davidwhittingham94@gmail.com";
GIT_USER_NAME="01001100"

echo "👶👶👶👶👶👶"

echo "Generating ssh key..."
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
git config --global push.autoSetupRemote "true"
git config --global core.editor "code --wait"

echo "Installing vs code..."
sudo snap install code --classic

echo "Installing zsh..."
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

echo "Installing pip..."
sudo apt-get -y install python3-pip

echo "installing pre-commit..."
pip install pre-commit --break-system-packages

echo "Installing go..."
sudo snap install go --classic

echo "Installing node..."
sudo apt install npm

echo "Installing npm..."
sudo snap install npm

echo "Installing ffmpeg..."
sudo apt install ffmpeg

echo "Installing htop..."
sudo snap install htop

echo "Installing poetry..."
curl -sSL https://install.python-poetry.org | python3 -
echo 'export PATH="/home/dave/.local/bin:$PATH"' >> ~/.zshrc

echo "Installing flyctl..."
curl -L https://fly.io/install.sh | sh
echo 'export PATH="$HOME/.fly/bin:$PATH"' >> ~/.zshrc

echo "Installing vlc..."
sudo snap install vlc

echo "Installing docker..."
curl -fsSL https://get.docker.com | sh

echo "Installing gh cli..."
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
    && sudo mkdir -p -m 755 /etc/apt/keyrings \
    && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
    && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y

echo "Authorizing gh cli..."
gh auth login

echo "Birth complete!"
