# pinephone-guides
This collection contains tutorials and software related to the pinephone

## Installation
### UBPorts/Ubuntu Touch
See [UBPorts guide](https://github.com/Oleffa/pinephone-guides/blob/master/UBPorts.md).
Also more tips on how to maintain the UBPorts installation
### Manjaro
See the [Manjaro guide](https://github.com/Oleffa/pinephone-guides/blob/master/Manjaro.md).

### Installing new images without opening or removing the SD card
I am now using Manjaro installed on the eMMC and a formated SD card. To test for example UBPorts, boot to eMMC, download the image and use dd to clone it to the SD card and reboot the phone. (Or vice versa).
If you feel like going back to the operating system on the eMMC just overwrite the SD card with 0s (while using it) using `dd if=/dev/zero of=/dev/sda bs=512 count=1` and restart the phone. Voila you will boot back into the OS on the eMMC. (Careful this will erase all data on the SD card).

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
4. Create a new secondary partition on the pinephone (the one created to boot from by dd is only 4 GB in size.). You can't resize the partitions while it is mounted, so shut down the phone and put in the SD card again to boot from it.
6. Once booted, use fdisk again to create a new partition on mmcblk2
7. Power off the device and remove the SD card. Voila, the pinephone now boots from eMMC

## Hardware
1. To open the back of the phone use your fingernails and the groove at the bottom left corner of the phone.
2. When first taking the phone into use remove the plastic isolator that separates the battery from the pins.
