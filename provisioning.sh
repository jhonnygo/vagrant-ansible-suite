#!/bin/bash

## SSH CONFIG
echo "Host *" > /home/vagrant/.ssh/config
echo "  StrictHostKeyChecking no" >> /home/vagrant/.ssh/config
chown vagrant:vagrant /home/vagrant/.ssh/config
chmod 600 /home/vagrant/.ssh/config

## ANSIBLE
UBUNTU_CODENAME=jammy
apt-get -y install software-properties-common
wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu $UBUNTU_CODENAME main" | tee /etc/apt/sources.list.d/ansible.list
apt-get -y update && apt-get -y install ansible
cp -rp /var/config-files/ansible/hosts /home/vagrant/
cp -rp /var/config-files/ansible/ansible.cfg /etc/ansible/

## CHANGE VAGRANT PASSWORD
echo "vagrant:123456" | chpasswd

## KEYS FOR USER vagrant
mkdir -p /home/vagrant/.ssh
chown -R vagrant:vagrant /home/vagrant
ssh-keygen -t rsa -b 2048 -C "vagrant" -f /home/vagrant/.ssh/id_rsa -V +365d -N ""
chmod 700 /home/vagrant/.ssh && chmod 600 /home/vagrant/.ssh/id_rsa
chown -R vagrant:vagrant /home/vagrant

## COPY ansible_srv KEYS TO MACHINES with vagrant user
sshpass -p '123456' ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub -o StrictHostKeyChecking=no vagrant@192.168.10.2
sshpass -p '123456' ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub -o StrictHostKeyChecking=no vagrant@192.168.10.3
sshpass -p '123456' ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub -o StrictHostKeyChecking=no vagrant@192.168.10.4
sshpass -p '123456' ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub -o StrictHostKeyChecking=no vagrant@192.168.10.5
sshpass -p '123456' ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub -o StrictHostKeyChecking=no vagrant@192.168.10.6