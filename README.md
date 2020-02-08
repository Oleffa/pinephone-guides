# pinephone-guides
This collection contains tutorials and software related to the pinephone

## Installation
### Installing UBPorts
### Installing on the eMMC
1. Flash an SD card with for example UBPorts `dd bs=4M if=ubuntu-touch-pinephone.img of=/dev/mmcblk0`
2. Create partition on the free space on the SD card (use lsblk and df -h to identify the device name and free space). Use fdisk to create a new partition and `sudo mkfs.ext /dev/mmcblk1`.
3. Copy the image of your choice to the SD card (I used the newly created partition because there was not enough space on the partition created by dd)


## SSH
SSH should work out of the box with user phable and password phablet.

## Networking
1. Wifi Problems
```
sudo nmcli radio wifi off
sudo nmcli radio wifi on
sudo reboot
```
It seems that wifi often dies and can't be enabled when the charger is not plugged in.

2. Modem
```
sudo /usr/share/ofono/scripts
