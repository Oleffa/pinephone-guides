# UBPorts installation

1. Download the image from https://ci.ubports.com/job/rootfs/job/rootfs-pinephone/
2. Extract image
3. Flash to sd card using `sudo dd bs=4M if=ubuntu-touch-pinephone.img of=/dev/mmcblk0 status=prgress conv=fsync` (Beware your sd card might have a different name than mmcblk0, you can find that out using `lsblk`.
4. Insert SD card and turn on the phone, default password is phablet
[1]

## SSH
1. SSH should work out of the box with user phable and password phablet.
```
ssh phablet@<<pinephone ip>>
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
Start the modem:
```
sudo /usr/share/ofono/scripts/enable-modem
sudo /usr/share/ofono/scripts/online-modem
```

## Mainteneance
1. Run `sudo apt update && sudo apt upgrade` often to receive the latest updates [2].
2. Enable sound
```
modprobe snd_soc_simple_amplifier
modprobe snd_soc_simple_card_utils
amixer -c 0 set 'AIF1 Slot 0 Digital DAC' unmute
```
Set audio volume:
```
amixer sset 'Line Out' 100%
```
Or use the `alsamixer` to set the volume of "Line Out" (speakers) or "Headphones" (headphones jack)

## Sources:
[1] https://gitlab.com/ubports/community-ports/pinephone

[2] https://forum.pine64.org/showthread.php?tid=8923
