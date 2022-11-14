#!/bin/bash

echo "updating pacman" > ~/.updateTimer
sudo pacman -Syu --noconfirm
echo "updating yay" > ~/.updateTimer
sudo yay -Syu --noconfirm
echo "killing orphans" > ~/.updateTimer
pacman -Qtdq | sudo pacman -Rns --noconfirm -
echo "" > ~/.updateTimer
