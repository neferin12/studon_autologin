
.PHONE: all lint

all: dist.zip

lint:
	yarn web-ext lint

dist.zip: login.js manifest.json
	zip dist.zip login.js manifest.json
