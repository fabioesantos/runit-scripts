msg "Storing ALSA mixer levels"
test -f /run/init.alsa && alsactl -f /var/lib/alsa/asound.state store