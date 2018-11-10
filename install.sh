#!/bin/bash
sudo systemctl stop bbb-function
sudo systemctl disable bbb-function
sudo cp config-spixconv.sh /root/config-spixconv.sh
sudo cp rc.local /etc/rc.local
