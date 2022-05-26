#!/bin/bash

if [ "$(playerctl --player=playerctld status)" = "Stopped" ]; then
    echo "No music is playing"
else 
    playerctl --player=playerctld metadata --format "{{ title }} - {{ artist }}"
fi
