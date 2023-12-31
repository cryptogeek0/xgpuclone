#!/bin/bash

# Update package list and install necessary packages

sudo apt update
pause
echo "---------------------------"

sudo apt -y install ocl-icd-opencl-dev

echo "---------------------------"

sudo apt -y install nano

echo "---------------------------"

sudo apt -y install htop

echo "---------------------------"

# sudo apt -y install nvtop
sudo apt -y install cmake

echo "---------------------------"

sudo apt -y install python3-pip

echo "---------------------------"

# Clone the repository and build the project
git clone https://github.com/shanhaicoder/XENGPUMiner.git

echo "---------------------------"

cd XENGPUMiner

echo "---------------------------"

chmod +x build.sh
# sudo apt-get update && sudo apt-get install build-essential

echo "---------------------------"

./build.sh

echo "---------------------------"

# Update the configuration file
sed -i 's/account = 0x24691e54afafe2416a8252097c9ca67557271475/account = 0x73128CfA687501a43aE310320d03967070396514/g' config.conf

echo "---------------------------"

# Install Python requirements
sudo pip install -U -r requirements.txt

echo "---------------------------"

sudo nohup python3 miner.py --gpu=true > miner.log 2>&1 &

echo "---------------------------"

sudo nohup ./xengpuminer > xengpuminer.log -0 2>&1
# sudo nohup xengpuminer > xengpuminer.log 2>&1
echo "---------------------------"
