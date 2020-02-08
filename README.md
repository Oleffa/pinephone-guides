# pinephone-guides
This collection contains tutorials and software related to the pinephone

## Installation
### Installing UBPorts
See [UBPorts guide](https://github.com/Oleffa/pinephone-guides/blob/master/UBPorts.md).
Also more tips on how to maintain the UBPorts installation
### Other Operating Systems
TODO
### Installing on the eMMC
The boot order is 1. external SD card, 2. internal eMMC
On the host machine:
1. Flash an SD card with for example UBPorts `dd bs=4M if=ubuntu-touch-pinephone.img of=/dev/mmcblk0` (See the UBPorts installation guide for more details)
2. Create partition on the free space on the SD card (use lsblk and df -h to identify the device name and free space). Use fdisk to create a new partition and `sudo mkfs.ext /dev/mmcblk1`.
3. Copy the image of your choice to the SD card (I used the newly created partition because there was not enough space on the partition created by dd)
Put the SD card in the pinephone and start it up to boot from SD card.
As a suggestion you can then use SSH to use a proper keyboard.
On the pinephone:
1. Use `lsblk` to determine the device names. For me the internal eMMC was /dev/mmcblk2. 
2. Use `dd bs=4M if=/path/to/image/ubuntu-touch-pinephone.img of=/dev/mmcblk2` to copy the image to the eMMC.
3. Remove the SD card and reboot the phone.
4. Create a new secondary partition on the pinephone (the one created to boot from by dd is only 4 GB in size.). You can't resize the partitions while it is mounted, so shut down the phone and put in th SD card again to boot from it.
6. Once booted, use fdisk again to create a new partition on mmcblk2
7. Power off the device and remove the SD card. Voila, the pinephone now boots from eMMC


## SSH
1. SSH should work out of the box with user phable and password phablet.
```
ssh phable@<<pinephone ip>>
```
To get the ip of the pinephone run `ifconfig` in the terminal.
2. To easily copy data to the pinephone install and use rsync:
```
sudo apt install rsync
rsync -avz <<path to file on host computer>> phablet@<<pinephoneip>>:/home/phablet/Downloads/
```

## Networking
1. Wifi Problems
```
sudo nmcli radio wifi off
sudo nmcli radio wifi on
sudo reboot
```
It seems that wifi often dies and can't be enabled when the charger is not plugged in.

2. Modem (For UBPorts check the [UBPorts guide](https://github.com/Oleffa/pinephone-guides/blob/master/UBPorts.md).)

## Hardware
1. To open the back of the phone use your fingernails and the groove at the bottom left corner of the phone.
2. When first taking the phone into use remove the plastic isolator that separates the battery fom the pins.
