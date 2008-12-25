all:
	(cd src;$(MAKE))
	(cd lib/nitrogen-trunk;$(MAKE))

test:
	(cd src;$(MAKE) test)
	(cd lib/nitrogen-trunk;$(MAKE) test)
	
clean:
	(cd src;$(MAKE) clean)
	(cd lib/nitrogen-trunk;$(MAKE) clean)
