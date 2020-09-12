#!/bin/sh

# Notes 
# VNC server status : netstat -ntpl | grep 5901 
# wallpapers : https://unsplash.com/t/wallpapers

cd /root
mkdir -p $HOME/.vnc
cp /xstartup $HOME/.vnc/
printf "${JUPYTER_TOKEN}\n${JUPYTER_TOKEN}\n" | vncpasswd -f > $HOME/.vnc/passwd
chmod 600 $HOME/.vnc/passwd
jupyter lab --no-browser --ip=0.0.0.0 --allow-root --port=8080 > jupyter.log 2>&1 &
echo "+++++++++++++++++++++++++++++++++"
echo "Starting jupyter lab at port 8080"
echo "Run your vnc server by using this command: vncserver -localhost no"
echo "+++++++++++++++++++++++++++++++++"

exec "$@"
