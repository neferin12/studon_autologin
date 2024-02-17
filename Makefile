.PHONE: all lint screenshot clean dist
icon_sizes := 512 256 128 48
logos := $(foreach size,$(icon_sizes),icons/logo_$(size).png)
project_root := $(shell git rev-parse --show-toplevel)

define template
icons/%_$(1).png: icons/%.svg
	inkscape -w $(1) -h $(1) -o $$@ $$<
endef

$(foreach size,$(icon_sizes),$(eval $(call template,$(size))))

all: dist screenshot

dist: dist_zips dist_folders

screenshot: icons/screenshot.png

icons/screenshot.png: icons/screenshot.svg
	inkscape -w 1280 -h 800 -o $@ $<

lint:
	yarn web-ext lint

dist_zips: dist-chrome.zip dist-firefox.zip

dist-%.zip: dist/%
	rm -f $@
	cd $< && zip -r $(project_root)/$@ ./*

dist_folders: dist/chrome dist/firefox

dist/%: manifest-%.json $(logos) login.js
	rm -rf $@
	mkdir -p $@
	cp $< $@/manifest.json
	cp login.js $@/login.js
	cp -r icons $@/icons


clean:
	rm -rf dist-*.zip $(logos) icons/screenshot.png dist
