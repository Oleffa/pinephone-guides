# Manjaro
Using Manjaro ARM Alpha3, more info [here](https://forum.manjaro.org/t/manjaro-arm-alpha3-for-pinephone-and-pinetab/120761).

## Installation
1. Download the image from the [download page](https://osdn.net/projects/manjaro-arm/storage/pinephone/plasma-mobile/alpha3/). 
2. I used etcher to create he SD card. It can be installed using Pacman on Manjaro/Arch `sudo pacman -S etcher` or get the installer for Ubuntu from [the website](https://www.balena.io/etcher/).
3. Insert the SD card and boot.

## SSH
1. SSH worked straight away for me.
2. rsync needs to be installed `sudo pacman -Syu rsync`
For more info see the [UBPorts](https://github.com/Oleffa/pinephone-guides/blob/master/UBPorts.md) guid.

## Networking
No problems I know of. (Haven't tested the modem yet)

## Maintenance
1. A system update broke some things (key-ring for example, so the phone could not log in to the wifi anymore automatically) and the mirror list.
2. Connect to wifi automatically: `nmcli device wifi list` and `nmcli device wifi connect [SSID] password [password]`.
3. Mirror list problem: I updated the mirror list and suddenly no mirrors were found any more. The problem seems to be that there are no EU mirrors available.
Solution: `sudo pacman-mirrors --country United_States && sudo pacman -Syyu` to create the mirrorlist with the US mirrors.
4. Running the system upgrade a second time installed a few more packages and fixed the keyring problem. (More on that [here](https://forum.manjaro.org/t/how-to-solve-keyring-issues-in-manjaro/4020)

## Software
- telegram-desktop Telegram desktop application

## Sources
[1] https://forum.manjaro.org/t/manjaro-arm-alpha3-for-pinephone-and-pinetab/120761
