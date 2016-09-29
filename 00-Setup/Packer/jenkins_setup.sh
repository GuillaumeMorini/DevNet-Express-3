#!/bin/bash
set -x 
sleep 30 # wait a big before we begin this madness. 
mkdir /home/core/java
mkdir /home/core/jenkins
cd /home/core/java
wget -O java.tar.gz http://javadl.sun.com/webapps/download/AutoDL?BundleId=83376
tar xzvf java.tar.gz
rm java.tar.gz
rm /home/core/.bashrc
echo 'export PATH=$PATH:/home/core/java/jre1.7.0_51/bin/' > /home/core/.bashrc
mkdir -p /home/core/.ssh/authorized_keys.d
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLjMPpiDsaTqFD6KEVs4fjraORH2Qdr2VpUwwFP1LTXklJkySG+EH+SbNJ2De9oYdtbBxZfPeVYQZidrkDo3ZzVs5Ee75uqNfrhRFHGa68SgOXgEM/UYkuF+tzG97150uxTLlThpgpwXhO1MuOkU2eW6uTTnsWZOqR7D51Yo1cOs7EAzVuuM2T7w7ANZk+OpjCObAEwAEOoe6ILUW84MXq0ZsOurR3pE10S6C1JLomBkQUHsyISdu0PkqSNTQtSEzvBkCzXdypRfxOPmVDGCdryqCvc7ml5onmKS1F9BMb2Ead0iAiWSNiyqWgy3J9qJLSvEEEGmuzQvF7lX4ThrPJ' >/home/core/.ssh/authorized_keys.d/jenkins
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLjMPpiDsaTqFD6KEVs4fjraORH2Qdr2VpUwwFP1LTXklJkySG+EH+SbNJ2De9oYdtbBxZfPeVYQZidrkDo3ZzVs5Ee75uqNfrhRFHGa68SgOXgEM/UYkuF+tzG97150uxTLlThpgpwXhO1MuOkU2eW6uTTnsWZOqR7D51Yo1cOs7EAzVuuM2T7w7ANZk+OpjCObAEwAEOoe6ILUW84MXq0ZsOurR3pE10S6C1JLomBkQUHsyISdu0PkqSNTQtSEzvBkCzXdypRfxOPmVDGCdryqCvc7ml5onmKS1F9BMb2Ead0iAiWSNiyqWgy3J9qJLSvEEEGmuzQvF7lX4ThrPJ' >/home/core/.ssh/authorized_keys

echo 'ssh-dss AAAAB3NzaC1kc3MAAACBAMJubadTbAOOxe3eTuTKdaHArA59qYmWKPwoiVrIokytEqKaoBC8hhu+GMy5OuXrM+8A3k36I0YjMcN5tWQ0fHeH2QysQWonndztixzs8m71Dau7OTOILDZaF6FP+BN8CLje4pW4e4RHxF7Eko0GIF82hJI+7xnj5YQB2nrHWNQ/AAAAFQCVTRrwUUv9JdT4WtjM+sl/BwEz+QAAAIAYl/OHqw3NYfccH32kRpRlVSHKE48xf+UhYrrMzga7C0Ub6ZMUvaBkapr1Gv9YNLlazbRC2jgaakiXEBHiAQZMiGvpNAQW8zm7V+VRS8VZynA0vkM7//gDBCms56CYsPZI/V7Qxpyl0igRaJo6zq5KZHkKYNBWt84Sh9pFsWtngwAAAIALcj+nJziobZsSDQV5dqG5CjLpDZbufNeuFOoBsjoMWyFPkLJoNYfTjJfqU8a+dlBdi4V8lae5RsF+eHoVrGu/ehwty6LD+QKFUNAtTR0zqtuydqlosXodejarmTpLppnPnS4eAQ3oh8o2FZnLBX4eOlw4qPEPbDrFNbDQ6q7eUw==' >> /home/core/.ssh/authorized_keys.d/jenkins
echo 'ssh-dss AAAAB3NzaC1kc3MAAACBAMJubadTbAOOxe3eTuTKdaHArA59qYmWKPwoiVrIokytEqKaoBC8hhu+GMy5OuXrM+8A3k36I0YjMcN5tWQ0fHeH2QysQWonndztixzs8m71Dau7OTOILDZaF6FP+BN8CLje4pW4e4RHxF7Eko0GIF82hJI+7xnj5YQB2nrHWNQ/AAAAFQCVTRrwUUv9JdT4WtjM+sl/BwEz+QAAAIAYl/OHqw3NYfccH32kRpRlVSHKE48xf+UhYrrMzga7C0Ub6ZMUvaBkapr1Gv9YNLlazbRC2jgaakiXEBHiAQZMiGvpNAQW8zm7V+VRS8VZynA0vkM7//gDBCms56CYsPZI/V7Qxpyl0igRaJo6zq5KZHkKYNBWt84Sh9pFsWtngwAAAIALcj+nJziobZsSDQV5dqG5CjLpDZbufNeuFOoBsjoMWyFPkLJoNYfTjJfqU8a+dlBdi4V8lae5RsF+eHoVrGu/ehwty6LD+QKFUNAtTR0zqtuydqlosXodejarmTpLppnPnS4eAQ3oh8o2FZnLBX4eOlw4qPEPbDrFNbDQ6q7eUw==' >> /home/core/.ssh/authorized_keys

chmod 600 /home/core/.ssh/authorized_keys
chmod 600 /home/core/.ssh/authorized_keys.d/jenkins
chmod 700 /home/core/.ssh/authorized_keys.d

sudo echo '10.10.25.19 ci' >/etc/hosts
# setup insecure registry
sudo systemctl daemon-stop
sudo systemctl stop docker
sudo mkdir -p /etc/systemd/system/
sudo touch /etc/systemd/system/docker.service
sudo ls -l /etc/systemd/system/docker.service
echo '
[Unit]
Description=Docker Application Container Engine
Documentation=http://docs.docker.com
After=docker.socket early-docker.target network.target
Requires=docker.socket early-docker.target

[Service]
Environment=TMPDIR=/var/tmp
EnvironmentFile=-/run/flannel_docker_opts.env
MountFlags=slave
LimitNOFILE=1048576
LimitNPROC=1048576
#ExecStart=/usr/lib/coreos/dockerd --daemon --host=fd:// --insecure-registry 184.94.252.118:5000 $DOCKER_OPTS $DOCKER_OPT_BIP $DOCKER_OPT_MTU $DOCKER_OPT_IPMASQ
#ExecStart=/usr/lib/coreos/dockerd --daemon --host=fd:// --insecure-registry 184.94.252.118:5000 --insecure-registry 10.100.0.38:5000 --insecure-registry ci:5000 
ExecStart=/usr/lib/coreos/dockerd daemon --host=fd:// $DOCKER_OPTS $DOCKER_CGROUPS $DOCKER_OPT_BIP $DOCKER_OPT_MTU $DOCKER_OPT_IPMASQ --insecure-registry 184.94.252.118:5000

[Install]
WantedBy=multi-user.target
' >/home/core/docker.sh

cat /home/core/docker.sh
sudo mv /home/core/docker.sh /etc/systemd/system/docker.service
sudo chown root:root /etc/systemd/system/docker.service
#sudo systemctl restart docker
