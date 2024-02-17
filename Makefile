
.PHONE: all lint
icon_sizes := 512 256 128 48
logos := $(foreach size,$(icon_sizes),icons/logo_$(size).png)

define template
icons/%_$(1).png: icons/%.svg
	inkscape -w $(1) -h $(1) -o $$@ $$<
endef

$(foreach size,$(icon_sizes),$(eval $(call template,$(size))))

all: dist.zip

lint:
	yarn web-ext lint

dist.zip: login.js manifest.json $(logos)
	zip -r dist.zip login.js manifest.json icons
