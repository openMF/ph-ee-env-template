# Use the alpine image as the base
FROM ubuntu:latest

# Install necessary packages
RUN # Add Docker's official GPG key: \
          apt-get update \
          apt-get --assume-yes install ca-certificates curl gnupg \
          install -m 0755 -d /etc/apt/keyrings \
          curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \ 
          chmod a+r /etc/apt/keyrings/docker.gpg \

          # Add the repository to Apt sources:
          echo \
            "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
            $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
            tee /etc/apt/sources.list.d/docker.list > /dev/null \ 
          apt-get update  \ 
          apt-get --assume-yes install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin \

          #install make
          apt-get install --assume-yes make \

          #install kubectl 
          apt-get update \
          # apt-transport-https may be a dummy package; if so, you can skip that package 
          apt-get install -y apt-transport-https ca-certificates curl gpg \ 

          curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key |  gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg \ 

          # This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
          echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' |  tee /etc/apt/sources.list.d/kubernetes.list \ 

          apt-get update \ 
          apt-get install -y kubelet kubeadm kubectl \ 
          apt-mark hold kubelet kubeadm kubectl \ 

          #insatll netcat
          apt install -y netcat 
          
# Set the default command to run when the container starts
CMD ["/bin/sh"]
