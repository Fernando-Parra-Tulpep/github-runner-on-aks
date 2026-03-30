FROM summerwind/actions-runner:latest
RUN sudo apt update -y \
  && umask 0002 \
  && sudo apt install -y ca-certificates curl apt-transport-https lsb-release gnupg

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

RUN sudo rm -rf /var/lib/apt/lists/*

# Download and install kubectl 
RUN sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN sudo chmod +x ./kubectl
RUN sudo mv ./kubectl /usr/local/bin/kubectl
