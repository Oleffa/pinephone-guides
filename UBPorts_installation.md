# UBPorts installation

1. Download the image from https://ci.ubports.com/job/rootfs/job/rootfs-pinephone/
2. Extract image
3. Flash to sd card using `sudo dd bs=4M if=ubuntu-touch-pinephone.img of=/dev/mmcblk0 status=prgress conv=fsync` (Beware your sd card might have a different name than mmcblk0, you can find that out using `lsblk`.
4. Insert SD card and turn on the phone, default password is phablet
[1]

## Mainteneance
1. Run `sudo apt update && sudo apt upgrade` often to receive the latest updates [2].
2. Enable sound
```
sudo modprobe snd_soc_simple_amplifier
sudo modprobe snd_soc_simple_card_utils
amixer -c 0 set 'AIF1 Slot 0 Digital DAC' unmute
```


## Sources:
[1] https://gitlab.com/ubports/community-ports/pinephone
[2] https://forum.pine64.org/showthread.php?tid=8923
