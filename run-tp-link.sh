#/bin/bash
#
# Run the Docker file for TP-Link Easy Smart Configuration
#
# Bruce Cosden
#
# January 1, 2018
#
# NOTE: the following iptables rule is required to ensure the app can discover switches:
# iptables -t nat -A PREROUTING -p udp -d 255.255.255.255 --dport 29809 -j DNAT --to my_ip:29809
#

# Step 1 - Run X virtual frame buffer - xvfb
/usr/bin/Xvfb :1 -screen 0 1024x768x16 &

# Step 2 - Set the DISPLAY env variable
export DISPLAY=":1"

# Step 3 - Run a simple display manager to host the app - openbox
/usr/bin/openbox &

# Step 4 - Run VNC server to access app remotely
x11vnc -display :1 -xkb -forever -shared -usepw &

# Step 5 - Load the docker container
docker run -d --network host -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY brcosden/tp-link

