[ -r /etc/hostname ] && read -r HOSTNAME </etc/hostname
if [ -n "$HOSTNAME" ]; then
    msg "Setting up hostname to '$HOSTNAME'..."
    printf '%s' "$HOSTNAME" >proc/sys/kernel/hostname
else
    msg_warn "Didn't setup a hostname!"
fi

if [ -n "$TIMEZONE" ]; then
    msg "Setting up timezone to '${TIMEZONE}'..."
    ln -sf "/usr/share/zoneinfo/$TIMEZONE" /etc/localtime
fi
