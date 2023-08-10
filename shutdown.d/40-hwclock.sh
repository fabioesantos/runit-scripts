if [ -n "$HARDWARECLOCK" ]; then
    msg "Saving hardware clock..."
    hwclock --systohc ${HARDWARECLOCK:+--$(echo $HARDWARECLOCK |tr A-Z a-z)}
fi
