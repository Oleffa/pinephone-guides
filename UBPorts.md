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
```
A reboot might be needed.
It seems that wifi often dies and can't be enabled when the charger is not plugged in.

2. Start the modem:
```
sudo /usr/share/ofono/scripts/enable-modem
sudo /usr/share/ofono/scripts/online-modem
```

## Mainteneance
1. Run `sudo apt update && sudo apt upgrade` often to receive the latest updates [2].
2. Enable sound. Unmute the DAC (digital analog converter)
```
amixer -c 0 set 'AIF1 Slot 0 Digital DAC' unmute
```
The script in `scripts/enable_sound.sh` does basically that.
Set audio volume from command line:
```
amixer sset 'Line Out' 100%
```
Or use the `alsamixer` to set the volume of "Line Out" (speakers) or "Headphones" (headphones jack). Use arrow keys left and right to switch items and up an down to adjust the volume. Pressing 'M' will unmute an item.

Some users in [2] still report no audio even after running these commands. However I was not having any problems with build #222 from [3].

## Software
Found in the OpenStore:
- TELEPorts (Telegram app)
- Dekko 2 (Mail app)
Missing:
- A navigation app that does not crash on start

## Sources:
[1] https://gitlab.com/ubports/community-ports/pinephone

[2] https://forum.pine64.org/showthread.php?tid=8923

[3] https://ci.ubports.com/job/rootfs/job/rootfs-pinephone/222/
