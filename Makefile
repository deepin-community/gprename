# Makefile for GPRename
# Author: Marvin Stark <marv@der-marv.de>
# Copyright (C) 2007 gprename-users@lists.sourceforge.net

# Globals:
PREFIX=/usr/local
DESTDIR=/usr/local

build:
	# Create temporary build directory and modify file locations.
	install -d "$(CURDIR)/build"
	install -d "$(CURDIR)/build/locale"
	install -d "$(CURDIR)/build/locale/ca"
	install -d "$(CURDIR)/build/locale/de"
	install -d "$(CURDIR)/build/locale/es"
	install -d "$(CURDIR)/build/locale/et"
	install -d "$(CURDIR)/build/locale/fr"
	install -d "$(CURDIR)/build/locale/id"
	install -d "$(CURDIR)/build/locale/it"
	install -d "$(CURDIR)/build/locale/nl"
	install -d "$(CURDIR)/build/locale/pl"
	install -d "$(CURDIR)/build/locale/pt_BR"
	install -d "$(CURDIR)/build/locale/ro"
	install -d "$(CURDIR)/build/locale/ru"
	install -d "$(CURDIR)/build/locale/sv"
	install -d "$(CURDIR)/build/locale/zh_CN"
	perl -ne 's!\@INSTALLDIR\@!$(PREFIX)!g ; print' < bin/gprename > build/gprename
	perl -ne 's!\@INSTALLDIR\@!$(PREFIX)!g ; print' < bin/gprename.desktop > build/gprename.desktop

install: uninstall build
	# Compile all .po files to .mo
	msgfmt -o build/locale/ca.mo	locale/ca.po
	msgfmt -o build/locale/de.mo	locale/de.po
	msgfmt -o build/locale/es.mo	locale/es.po
	msgfmt -o build/locale/et.mo	locale/et.po
	msgfmt -o build/locale/fr.mo	locale/fr.po
	msgfmt -o build/locale/id.mo 	locale/id.po
	msgfmt -o build/locale/it.mo 	locale/it.po
	msgfmt -o build/locale/nl.mo 	locale/nl.po
	msgfmt -o build/locale/pl.mo 	locale/pl.po
	msgfmt -o build/locale/pt_BR.mo	locale/pt_BR.po
	msgfmt -o build/locale/ro.mo	locale/ro.po
	msgfmt -o build/locale/ru.mo	locale/ru.po
	msgfmt -o build/locale/sv.mo	locale/sv.po
	msgfmt -o build/locale/zh_CN.mo	locale/zh_CN.po

	# Create directories
	install -d "$(DESTDIR)"
	install -d "$(DESTDIR)/bin"
	install -d "/usr/share"
	install -d "/usr/share/icons"
	install -d "$(DESTDIR)/share/applications"
	install -d "$(DESTDIR)/share/man"
	install -d "$(DESTDIR)/share/man/man1"
	install -d "$(DESTDIR)/share/locale/ca/LC_MESSAGES"
	install -d "$(DESTDIR)/share/locale/de/LC_MESSAGES"
	install -d "$(DESTDIR)/share/locale/es/LC_MESSAGES"
	install -d "$(DESTDIR)/share/locale/et/LC_MESSAGES"
	install -d "$(DESTDIR)/share/locale/fr/LC_MESSAGES"
	install -d "$(DESTDIR)/share/locale/id/LC_MESSAGES"
	install -d "$(DESTDIR)/share/locale/it/LC_MESSAGES"
	install -d "$(DESTDIR)/share/locale/nl/LC_MESSAGES"
	install -d "$(DESTDIR)/share/locale/pl/LC_MESSAGES"
	install -d "$(DESTDIR)/share/locale/pt_BR/LC_MESSAGES"
	install -d "$(DESTDIR)/share/locale/ro/LC_MESSAGES"
	install -d "$(DESTDIR)/share/locale/ru/LC_MESSAGES"
	install -d "$(DESTDIR)/share/locale/sv/LC_MESSAGES"
	install -d "$(DESTDIR)/share/locale/zh_CN/LC_MESSAGES"

	# Copy all files in the filesystem
	install -m 755 build/gprename                "$(DESTDIR)/bin/"
	install -m 644 gprename-nautilus-actions.xml "$(DESTDIR)/share/applications/"
	install -m 644 icon/gprename.png             "/usr/share/icons/"
	install -m 644 man/gprename.1                "$(DESTDIR)/share/man/man1/"
	install -m 644 build/locale/ca.mo            "$(DESTDIR)/share/locale/ca/LC_MESSAGES/gprename.mo"
	install -m 644 build/locale/de.mo            "$(DESTDIR)/share/locale/de/LC_MESSAGES/gprename.mo"
	install -m 644 build/locale/es.mo            "$(DESTDIR)/share/locale/es/LC_MESSAGES/gprename.mo"
	install -m 644 build/locale/et.mo            "$(DESTDIR)/share/locale/et/LC_MESSAGES/gprename.mo"
	install -m 644 build/locale/fr.mo            "$(DESTDIR)/share/locale/fr/LC_MESSAGES/gprename.mo"
	install -m 644 build/locale/id.mo            "$(DESTDIR)/share/locale/id/LC_MESSAGES/gprename.mo"
	install -m 644 build/locale/it.mo            "$(DESTDIR)/share/locale/it/LC_MESSAGES/gprename.mo"
	install -m 644 build/locale/nl.mo            "$(DESTDIR)/share/locale/nl/LC_MESSAGES/gprename.mo"
	install -m 644 build/locale/pl.mo            "$(DESTDIR)/share/locale/pl/LC_MESSAGES/gprename.mo"
	install -m 644 build/locale/pt_BR.mo         "$(DESTDIR)/share/locale/pt_BR/LC_MESSAGES/gprename.mo"
	install -m 644 build/locale/ro.mo            "$(DESTDIR)/share/locale/ro/LC_MESSAGES/gprename.mo"
	install -m 644 build/locale/ru.mo            "$(DESTDIR)/share/locale/ru/LC_MESSAGES/gprename.mo"
	install -m 644 build/locale/sv.mo            "$(DESTDIR)/share/locale/sv/LC_MESSAGES/gprename.mo"
	install -m 644 build/locale/zh_CN.mo         "$(DESTDIR)/share/locale/zh_CN/LC_MESSAGES/gprename.mo"
	desktop-file-install bin/gprename.desktop
	update-desktop-database
	@echo "Installation completed."

uninstall: clean
	rm -f  "$(DESTDIR)/bin/gprename"
	rm -f  "/usr/share/applications/gprename.desktop"
	rm -f  "$(DESTDIR)/share/applications/gprename-nautilus-actions.xml"
	rm -f  "$(DESTDIR)/share/man/man1/gprename.1"
	rm -f  "$(DESTDIR)/share/locale/ca/LC_MESSAGES/gprename.mo"
	rm -f  "$(DESTDIR)/share/locale/de/LC_MESSAGES/gprename.mo"
	rm -f  "$(DESTDIR)/share/locale/es/LC_MESSAGES/gprename.mo"
	rm -f  "$(DESTDIR)/share/locale/et/LC_MESSAGES/gprename.mo"
	rm -f  "$(DESTDIR)/share/locale/fr/LC_MESSAGES/gprename.mo"
	rm -f  "$(DESTDIR)/share/locale/id/LC_MESSAGES/gprename.mo"
	rm -f  "$(DESTDIR)/share/locale/it/LC_MESSAGES/gprename.mo"
	rm -f  "$(DESTDIR)/share/locale/nl/LC_MESSAGES/gprename.mo"
	rm -f  "$(DESTDIR)/share/locale/pl/LC_MESSAGES/gprename.mo"
	rm -f  "$(DESTDIR)/share/locale/pt_BR/LC_MESSAGES/gprename.mo"
	rm -f  "$(DESTDIR)/share/locale/ro/LC_MESSAGES/gprename.mo"
	rm -f  "$(DESTDIR)/share/locale/ru/LC_MESSAGES/gprename.mo"
	rm -f  "$(DESTDIR)/share/locale/sv/LC_MESSAGES/gprename.mo"
	rm -f  "$(DESTDIR)/share/locale/zh_CN/LC_MESSAGES/gprename.mo"
	rm -fr "/usr/share/icons/gprename"
	update-desktop-database

clean:
	rm -rf build

help:
	@echo "Type \"make install\" to install GPRename."
	@echo "Type \"make uninstall\" to remove GPRename."
	@echo "Type \"make clean\" to clean the current directory."
