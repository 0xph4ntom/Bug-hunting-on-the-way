FROM ubuntu:22.04

# Environment Variables
ENV HOME=/root
ENV DEBIAN_FRONTEND=noninteractive

# Working Directory
WORKDIR /root
RUN mkdir /root/tools && \ 
    mkdir /root/wordlists

# Install basic utilities
RUN apt update && apt upgrade -y
RUN apt install -y \ 
    nano \
    nmap \
    wget \
    iputils-ping \
    curl \
    net-tools \
    neovim  \
    build-essential \
    awscli \
    gcc \
    make \
    whois \
    python3 \
    python3-pip \
    perl \
    nikto \ 
    dnsutils \
    golang-go \
    ruby-full \
    netcat \ 
    gem  


# Assetfinder
RUN go install github.com/tomnomnom/assetfinder@latest
# Anew
RUN go install -v github.com/tomnomnom/anew@latest
# Waybackurls
RUN go install github.com/tomnomnom/waybackurls@latest 
# Nuclei
RUN go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
# Httprobe
RUN go install github.com/tomnomnom/httprobe@latest
# Meg
RUN go install github.com/tomnomnom/meg@latest
# Gau
RUN go install github.com/lc/gau/v2/cmd/gau@latest
# Subfinder
RUN go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
# Amass
RUN go install -v github.com/OWASP/Amass/v3/...@master
# Gospider
RUN GO111MODULE=on go install github.com/jaeles-project/gospider@latest

ENV PATH=${PATH}:/root/go/bin

# Install tools
RUN apt install -y \ 
    gobuster \
    sqlmap \
    ffuf \
    masscan \
    hydra \ 
    hashcat \
    dnsenum \
    dnsrecon \
    nvidia-opencl-dev \
    yasm \
    pkg-config \
    libgmp-dev \
    libpcap-dev \
    libbz2-dev \
    libssl-dev \
    zlib1g-dev \
    john

# Paramspider
RUN cd /root/tools && git clone https://github.com/devanshbatham/ParamSpider && cd ParamSpider && pip3 install -r requirements.txt
# Sublist3r
RUN cd /root/tools && git clone https://github.com/aboul3la/Sublist3r.git && cd Sublist3r && pip3 install -r requirements.txt
# Commix
RUN cd /root/tools && git clone https://github.com/commixproject/commix.git
# Wpscan
RUN gem install wpscan
# Subdomainizer
RUN cd /root/tools && git clone https://github.com/nsonaniya2010/SubDomainizer.git && cd SubDomainizer && pip3 install -r requirements.txt
# Subscraper
RUN cd /root/tools && git clone https://github.com/Cillian-Collins/subscraper.git && cd subscraper && pip3 install -r requirements.txt
# Altdns
RUN pip3 install py-altdns==1.0.2
# Brutespray
RUN cd /root/tools && git clone https://github.com/x90skysn3k/brutespray.git && cd brutespray && pip3 install -r requirements.txt
# Seclists
RUN cd /root/wordlists && wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip \
    && unzip SecList.zip \
    && rm -f SecList.zip
# John
RUN cd /root/tools && git clone https://github.com/openwall/john 
# Arjun
RUN pip3 install arjun