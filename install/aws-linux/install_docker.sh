# Update and pull dependencies
sudo yum update
sudo yum search docker

# Install docker package
sudo yum install docker

# Add docker to the user group
sudo usermod -aG docker ${USER}
id ${USER}

newgrp docker

# Enable docker
sudo systemctl enable docker
sudo systemctl start docker
