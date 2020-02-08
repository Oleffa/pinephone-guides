#!/bin/bash
echo "Restarting wifi..."
nmcli radio wifi off
nmcli radio wifi on
