#!/bin/bash

# update Ubuntu
sudo apt-get update && sudo apt-get dist-upgrade -y

# pull the latest algo repository
git clone https://github.com/trailofbits/algo.git

# ensure python3 is installed and updated
sudo apt install -y --no-install-recommends python3-virtualenv

# install algo's remaining dependencies
cd algo
python3 -m virtualenv --python="$(command -v python3)" .env &&
   source .env/bin/activate &&
   python3 -m pip install -U pip virtualenv &&
   python3 -m pip install -r requirements.txt

# modify a computer algo config parameters
sed -i '/users/!b;n;n;n;s/desktop/hash/' config.cfg
sed -i '/dns_encryption/s/true/false/' config.cfg
sed -i '/unattended_reboot/!b;n;s/false/true/' config.cfg

# launch the algo deployment script
./algo
