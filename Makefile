install: reinstall
	install -v -b -Dm644 src/secureboot.conf "$(DESTDIR)/etc/secureboot.conf"

reinstall:
	install -Dm755 src/secureboot "$(DESTDIR)/usr/bin/secureboot"

all: install
