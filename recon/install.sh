#!/bin/bash

echo ""
echo "Installing recon dependencies"
echo "============================="

echo ""
echo "Installing Sublist3r"
echo "--------------------"
sudo apt install sublist3r -y

echo ""
echo "Installing Amass"
echo "----------------"
sudo snap install amass 

echo ""
echo "Installing AssetInder"
echo "---------------------"
go install github.com/tomnomnom/assetfinder@latest

echo ""
echo "Installing HTTPProbe"
echo "--------------------"
go install github.com/tomnomnom/httprobe@latest

echo ""
echo "Installing GoWitness"
echo "--------------------"
go install gorm.io/gorm@latest
go install github.com/sensepost/gowitness@latest
