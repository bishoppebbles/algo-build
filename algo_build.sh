#!/bin/bash

# update Ubuntu
sudo apt update && sudo apt dist-upgrade -y

# pull the latest algo repository
git clone https://github.com/trailofbits/algo.git

# ensure python3 is installed and updated
sudo apt install -y --no-install-recommends python3-virtualenv file lookup

# install algo's remaining dependencies
cd algo
python3 -m virtualenv --python="$(command -v python3)" .env &&
   source .env/bin/activate &&
   python3 -m pip install -U pip virtualenv &&
   python3 -m pip install -r requirements.txt

# modify a computer algo config parameters
# change the default 'desktop' user to 'hash'
sed -i '/users/!b;n;n;n;s/desktop/hash/' config.cfg

# change the default wireguard port to 443
#sed -i '/wireguard_port/s/51820/443/' config.cfg

# disable dns encryption
sed -i '/dns_encryption/s/true/false/' config.cfg

# enable unattended reboot to ensure any software patches are installed
sed -i '/unattended_reboot/!b;n;s/false/true/' config.cfg

# change the reboot time to 0600 China Standard Time
#sed -i '/unattended_reboot/!b;n;n;s/06:00/22:00/' config.cfg

# launch the algo deployment script (must run elevated)
sudo ./algo
