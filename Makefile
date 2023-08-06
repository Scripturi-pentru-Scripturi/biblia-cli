PREFIX = /usr/local
#completion variable that hold the path to the completion file in this folder completion.bash
COMPLETION = $(shell pwd)/completion.bash

biblia-cli: biblia-cli.sh data/biblia.awk data/biblia.tsv
	cat biblia-cli.sh > $@
	echo 'exit 0' >> $@
	echo '#EOF' >> $@
	tar czf - data/biblia.awk data/biblia.tsv >> $@
	chmod +x $@

test: biblia-cli.sh
	shellcheck -s sh biblia-cli.sh

clean:
	rm -f biblia-cli

install: biblia-cli
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f biblia-cli $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/biblia-cli
	@echo
	@echo "Am instalat biblia-cli in $(DESTDIR)$(PREFIX)/bin";
	@echo "Pentru auto-completare la tab, adaugă 'source $(COMPLETION)' la fișierul tău .bashrc .. .zshrc ..etc";
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/biblia-cli

.PHONY: test clean install uninstall
