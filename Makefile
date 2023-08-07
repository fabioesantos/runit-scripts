PREFIX = /usr

all:
	$(CC) $(CFLAGS) pause.c -o pause $(LDFLAGS)
	$(CC) $(CFLAGS) vlogger.c -o vlogger $(LDFLAGS)

install:
	install -d ${DESTDIR}/${PREFIX}/sbin
	install -Dm755 halt ${DESTDIR}${PREFIX}/sbin/halt
	ln -sf halt ${DESTDIR}${PREFIX}/sbin/poweroff
	install -Dm755 reboot ${DESTDIR}${PREFIX}/sbin/reboot
	install -m755 pause ${DESTDIR}/${PREFIX}/sbin
	install -m755 vlogger ${DESTDIR}/${PREFIX}/sbin
	install -m755 shutdown ${DESTDIR}/${PREFIX}/sbin/shutdown
	install -m755 zzz ${DESTDIR}/${PREFIX}/sbin
	install -d ${DESTDIR}/${PREFIX}/share/man/man1
	install -m644 pause.1 ${DESTDIR}/${PREFIX}/share/man/man1
	install -d ${DESTDIR}/${PREFIX}/share/man/man8
	install -m644 zzz.8 ${DESTDIR}/${PREFIX}/share/man/man8
	install -m644 shutdown.8 ${DESTDIR}/${PREFIX}/share/man/man8
	install -m644 vlogger.8 ${DESTDIR}/${PREFIX}/share/man/man8
	install -d ${DESTDIR}/etc
	install -m644 rc.conf ${DESTDIR}/etc/rc.conf
	install -d ${DESTDIR}/etc/runit
	install -d ${DESTDIR}/etc/runit/sysinit.d
	install -Dm644 -t ${DESTDIR}/etc/runit/sysinit.d sysinit.d/*.sh
	install -Dm644 -t ${DESTDIR}/etc/runit/shutdown.d shutdown.d/*.sh
	install -Dm755 -t ${DESTDIR}/etc/runit 1 2 3 ctrlaltdel
	install -Dm644 functions ${DESTDIR}/etc/runit/functions
	install -Dm755 -t ${DESTDIR}/etc rc.local rc.shutdown
	ln -sf /run/runit/reboot ${DESTDIR}/etc/runit/reboot
	ln -sf /run/runit/stopit ${DESTDIR}/etc/runit/stopit
	install -Dm755 services/agetty ${DESTDIR}/etc/sv/agetty/run
	install -Dm755 services/sulogin ${DESTDIR}/etc/sv/sulogin/run
	install -Dm755 services/mdevd ${DESTDIR}/etc/sv/mdevd/run
	install -d ${DESTDIR}/etc/runit/runsvdir/default ${DESTDIR}/etc/runit/runsvdir/single
	ln -sfn default ${DESTDIR}/etc/runit/runsvdir/current
	for n in 1 2 3 4 5 6; do \
		install -d ${DESTDIR}/etc/sv/agetty-tty$$n; \
		ln -sfn ../agetty/run ${DESTDIR}/etc/sv/agetty-tty$$n/run; \
		ln -sfn /etc/sv/agetty-tty$$n ${DESTDIR}/etc/runit/runsvdir/default/agetty-tty$$n; \
	done
	ln -sfn /etc/sv/sulogin ${DESTDIR}/etc/runit/runsvdir/single/sulogin
