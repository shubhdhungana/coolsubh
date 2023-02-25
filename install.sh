#!/bin/bash

# Update package list and install necessary tools
sudo apt-get update
sudo apt-get -y install nmap curl git python3-pip jq dnsutils

# Install Golang
if ! command -v go &> /dev/null
then
    echo "Installing Golang..."
    wget https://golang.org/dl/go1.17.5.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go1.17.5.linux-amd64.tar.gz
    echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
    source ~/.bashrc
    rm go1.17.5.linux-amd64.tar.gz
fi

# Install xsrfprobe
if ! command -v xsrfprobe &> /dev/null
then
    echo "Installing xsrfprobe..."
    sudo git clone https://github.com/0xInfection/xsrfprobe.git /opt/xsrfprobe
    sudo ln -s /opt/xsrfprobe/xsrfprobe.py /usr/bin/xsrfprobe
fi

# Install crlfuzz
if ! command -v crlfuzz &> /dev/null
then
    echo "Installing crlfuzz..."
    sudo git clone https://github.com/dwisiswant0/crlfuzz.git /opt/crlfuzz
    sudo ln -s /opt/crlfuzz/crlfuzz.py /usr/bin/crlfuzz
fi

# Install crlfsuite
if ! command -v crlfsuite &> /dev/null
then
    echo "Installing crlfsuite..."
    sudo git clone https://github.com/RUB-NDS/CRLF-Suite.git /opt/CRLF-Suite
    sudo pip3 install -r /opt/CRLF-Suite/requirements.txt
    sudo ln -s /opt/CRLF-Suite/crlf.py /usr/bin/crlfsuite
fi

# Install Corsy
if ! command -v corsy &> /dev/null
then
    echo "Installing Corsy..."
    sudo git clone https://github.com/s0md3v/Corsy.git /opt/Corsy
    sudo pip3 install -r /opt/Corsy/requirements.txt
    sudo ln -s /opt/Corsy/corsy.py /usr/bin/corsy
fi

# Install CORStest
if ! command -v corstest &> /dev/null
then
    echo "Installing CORStest..."
    sudo git clone https://github.com/s0md3v/CORStest.git /opt/CORStest
    sudo ln -s /opt/CORStest/corstest.py /usr/bin/corstest
fi

# Install Dirsearch
if ! command -v dirsearch &> /dev/null
then
    echo "Installing Dirsearch..."
    sudo git clone https://github.com/maurosoria/dirsearch.git /opt/dirsearch
    sudo ln -s /opt/dirsearch/dirsearch.py /usr/bin/dirsearch
fi

# Install CORStest
if ! command -v corstest &> /dev/null
then
    echo "Installing CORStest..."
    sudo git clone https://github.com/s0md3v/CORStest.git /opt/CORStest
    sudo ln -s /opt/CORStest/corstest.py /usr/bin/corstest
fi

# Install GoDirSearch
if ! command -v GoDirSearch &> /dev/null
then
    echo "Installing GoDirSearch..."
    sudo git clone https://github.com/saeeddhqan/GoDirSearch.git /opt/GoDirSearch
    cd /opt/GoDirSearch && go build
    sudo ln -s /opt/GoDirSearch/GoDirSearch /usr/bin/GoDirSearch

# Install httpx
if ! command -v httpx &> /dev/null
then
    echo "Installing httpx..."
    sudo GO111MODULE=on go get -u -v github.com/projectdiscovery/httpx/cmd/httpx
fi

# Install nuclei
if ! command -v nuclei &> /dev/null
then
    echo "Installing nuclei..."
    sudo GO111MODULE=on go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
fi

# Install naabu
if ! command -v naabu &> /dev/null
then
    echo "Installing naabu..."
    sudo GO111MODULE=on go get -u -v github.com/projectdiscovery/naabu/v2/cmd/naabu
fi

# Install assetfinder
if ! command -v assetfinder &> /dev/null
then
    echo "Installing assetfinder..."
    sudo GO111MODULE=on go get -u -v github.com/tomnomnom/assetfinder
fi

# Install amass
if ! command -v amass &> /dev/null
then
    echo "Installing amass..."
    sudo apt-get install -y snapd
    sudo snap install amass
fi

# Install subfinder
if ! command -v subfinder &> /dev/null
then
    echo "Installing subfinder..."
    sudo GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
fi

# Install massdns
if ! command -v massdns &> /dev/null
then
    echo "Installing massdns..."
    sudo git clone https://github.com/blechschmidt/massdns.git /opt/massdns
    cd /opt/massdns && sudo make
    sudo ln -s /opt/massdns/bin/massdns /usr/bin/massdns
fi

# Install shuffledns
if ! command -v shuffledns &> /dev/null
then
    echo "Installing shuffledns..."
    sudo GO111MODULE=on go get -u -v github.com/projectdiscovery/shuffledns/cmd/shuffledns
fi

# Install dnsx
if ! command -v dnsx &> /dev/null
then
    echo "Installing dnsx..."
    sudo GO111MODULE=on go get -u -v github.com/projectdiscovery/dnsx/cmd/dnsx
fi

echo "Installation complete!"