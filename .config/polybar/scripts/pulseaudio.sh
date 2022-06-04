#!/bin/bash

pulseaudio-control --icons-volume " , " --icon-muted " " listen | grep -Eo '[,,] [0-9]*%'
