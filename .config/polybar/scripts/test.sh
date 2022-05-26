#!/bin/zsh

zscroll -l 30 \
	--delay 0.1 \
        --update-check true '/home/albert/.config/polybar/scripts/affirmations.sh' &
wait
