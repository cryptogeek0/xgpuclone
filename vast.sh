#!/bin/bash

# Update package list and install necessary packages

sudo apt update
sleep 5s
echo "---------------------------"

sudo apt -y install ocl-icd-opencl-dev
sleep 5s
echo "---------------------------"

sudo apt -y install nano
sleep 5s
echo "---------------------------"

sudo apt -y install htop
sleep 5s
echo "---------------------------"

# sudo apt -y install nvtop
sudo apt -y install cmake
sleep 5s
echo "---------------------------"

sudo apt -y install python3-pip
sleep 5s
echo "---------------------------"

# Clone the repository and build the project
git clone https://github.com/shanhaicoder/XENGPUMiner.git
sleep 5s
echo "---------------------------"

cd XENGPUMiner
sleep 5s
echo "---------------------------"

chmod +x build.sh
sleep 5s
echo "---------------------------"

./build.sh
sleep 5s
echo "---------------------------"

# Update the configuration file
sed -i 's/account = 0x24691e54afafe2416a8252097c9ca67557271475/account = 0x73128CfA687501a43aE310320d03967070396514/g' config.conf
sleep 5s
echo "---------------------------"

# Install Python requirements
sudo pip install -U -r requirements.txt
sleep 5s
echo "---------------------------"

sudo nohup python3 miner.py --gpu=true > miner.log 2>&1 &
sleep 5s
echo "---------------------------"

sudo nohup ./xengpuminer > xengpuminer.log 2>&1 &
sleep 5s
echo "---------------------------"
