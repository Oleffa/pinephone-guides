#!/bin/bash
echo "Enabling Sound..."
modprobe snd_soc_simple_amplifier
modprobe snd_soc_simple_card_utils
amixer -c 0 set 'AIF1 Slot 0 Digital DAC' unmute
echo "Done!"
