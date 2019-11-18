#!/usr/bin/env bash

# make sure apt database is up-to date
sudo apt-get update

# install golang-1.10 and unzip
sudo apt-get install -y golang-1.10 unzip git wget

grep 'GOPATH|GOROOT' ~/.bash_profile &>/dev/null || {
  sudo mkdir -p ~/go
  cp ~/.bash_profile ~/.bash_profile.ori
  grep -v 'GOPATH|GOROOT' ~/.bash_profile.ori | sudo tee -a ~/.bash_profile
  echo 'export GOROOT=/usr/lib/go-1.10' | sudo tee -a ~/.bash_profile
  echo 'export PATH=$PATH:$GOROOT/bin' | sudo tee -a ~/.bash_profile
  echo 'export GOPATH=~/go' | sudo tee -a ~/.bash_profile
}

grep 'GOPATH|GOROOT' /home/vagrant/.bash_profile &>/dev/null || {
  sudo mkdir -p /home/vagrant/go
  cp /home/vagrant/.bash_profile /home/vagrant/.bash_profile.ori
  grep -v 'GOPATH|GOROOT' /home/vagrant/.bash_profile.ori | sudo tee -a /home/vagrant/.bash_profile
  echo 'export GOROOT=/usr/lib/go-1.10' | sudo tee -a /home/vagrant/.bash_profile
  echo 'export PATH=$PATH:$GOROOT/bin' | sudo tee -a /home/vagrant/.bash_profile
  echo 'export GOPATH=/home/vagrant/go' | sudo tee -a /home/vagrant/.bash_profile
  sudo chown -R vagrant:  /home/vagrant
}

# load the variables
source ~/.bashrc
