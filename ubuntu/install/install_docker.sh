# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# Pull dependencies
sudo apt-get update
sudo apt-get install \
	     	ca-certificates \
	     	curl \
		gnupg \
		lsb-release

# Add docker GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up repo
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install the repo
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Add docker to the user group
sudo usermod -aG docker ${USER}
su - ${USER}
