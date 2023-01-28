GIT_USER_NAME="davidwhittingham94@gmail.com"

# Create ssh key
ssh-keygen -t ed25519 -C "${GIT_USER_NAME}" -q -N "" -f ~/.ssh/id_ed25519
echo "Go to https://github.com/settings/ssh/new and enter the created ssh key."
echo "################################################################################"
cat /home/dave/.ssh/id_ed25519.pub
echo "################################################################################"

echo "Installing and setting up the linux-surface kernel"
# Import the keys needed to sign packages.
wget -qO - https://raw.githubusercontent.com/linux-surface/linux-surface/master/pkg/keys/surface.asc |
    gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/linux-surface.gpg
# Add the repository configuration.
echo "deb [arch=amd64] https://pkg.surfacelinux.com/debian release main" |
    sudo tee /etc/apt/sources.list.d/linux-surface.list
# Update apt package manager.
sudo apt update

echo "Installing the linux-surface kernel and its dependencies..."
sudo apt install linux-image-surface linux-headers-surface iptsd libwacom-surface

echo "Enabling the iptsd service for touchscreen support..."
sudo systemctl enable iptsd

echo "Installing https://github.com/linux-surface/linux-surface..."

sudo apt install linux-surface-secureboot-mok

# The bootloader will pick up the kernel by default, but you should
echo "Updating its configuration to make sure kernel was recognized..."
sudo update-grub

echo "Birth complete!"

echo "The next line should contains the string 'surface'. If it doesn't contain that string, you are still using the default kernel and need to configure your bootloader."
uname -a
