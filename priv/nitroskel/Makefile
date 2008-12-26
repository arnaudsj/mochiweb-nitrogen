all: start-dev

compile:
	(cd src;$(MAKE))

start-dev: 
	(bin/start-dev.sh)

start:
	(bin/start.sh)

clean:
	rm -rf ./ebin/*.beam
