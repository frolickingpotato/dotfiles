#/bin/bash

exec nohup sh -c 'cd ~/Documents/Notes/vimwiki ; git add ./*; git commit -m "write hook"; git push' &
exec nohup zsh -c 'config push' &
