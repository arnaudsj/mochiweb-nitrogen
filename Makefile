compile:
	erl -make
	(cd lib/nitrogen-trunk;$(MAKE))
	
clean:
	rm -rf ./ebin/*.*
	(cd lib/nitrogen-trunk;$(MAKE) clean)

test: compile
	erl -noshell -pa ./ebin -s mochiweb test -s init stop
#	No test for Nitrogren yet!
#	(cd lib/nitrogen-trunk;$(MAKE) test)
	
doc: