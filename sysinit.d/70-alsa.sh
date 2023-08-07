msg "Restoring Mixer Levels"
alsactl -f /var/lib/alsa/asound.state restore && touch /run/init.alsa
