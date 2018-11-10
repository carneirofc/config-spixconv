#!/bin/bash

sudo systemctl stop bbb-function
sudo systemctl disable bbb-function

ioc_top_directory="/opt/stream-device"

echo SPIXCONV detected.
echo Synchronizing pru-serial485 and spixconv files

echo Initializing PRUserial485 overlay.
if [ ! -d /root/pru-serial485 ]; then
    echo "ERROR! The folder /root/pru-serial485 doesn\'t exist."
    exit 1
fi

if [ ! -f /root/pru-serial485/src/overlay.sh ]; then
    echo "ERROR! The file /root/pru-serial485/src/overlay.sh doesn\'t exist."
    exit 1
fi

pushd /root/pru-serial485/src
    ./overlay.sh
popd

echo "Initializing SPIxCONV overlay."

if [ ! -d /root/SPIxCONV ]; then
    echo "ERROR! The folder /root/SPIxCONV doesn\'t exist."
    exit 1
fi

if [ ! -f /root/SPIxCONV/init/SPIxCONV_config-pin.sh ]; then
    echo "ERROR! The file /root/SPIxCONV/init/SPIxCONV_config-pin.sh doesn\'t exist."
    exit 1
fi

pushd /root/SPIxCONV/init
    ./SPIxCONV_config-pin.sh
popd

#procServ --chdir ${ioc_top_directory}/iocBoot 20200 ./BO-ejection_kicker.cmd
#procServ --chdir ${ioc_top_directory}/iocBoot 20200 ./BO-injection_kicker.cmd

#procServ --chdir ${ioc_top_directory}/iocBoot 20200 ./SI-injection_dipolar_kicker.cmd
#procServ --chdir ${ioc_top_directory}/iocBoot 20200 ./SI-injection_non_linear_kicker.cmd
#procServ --chdir ${ioc_top_directory}/iocBoot 20200 ./SI-vertical_pinger.cmd

#procServ --chdir ${ioc_top_directory}/iocBoot 20200 ./TB-injection_septum.cmd

#procServ --chdir ${ioc_top_directory}/iocBoot 20200 ./TS-ejection_thick_septum
#procServ --chdir ${ioc_top_directory}/iocBoot 20200 ./TS-ejection_thin_septum.cmd

#procServ --chdir ${ioc_top_directory}/iocBoot 20200 ./TS-injection_thick_septum_1.cmd
#procServ --chdir ${ioc_top_directory}/iocBoot 20200 ./TS-injection_thick_septum_2.cmd
#procServ --chdir ${ioc_top_directory}/iocBoot 20200 ./TS-injection_thin_septum.cmd 
