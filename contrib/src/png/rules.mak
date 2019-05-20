# PNG
PNG_VERSION := 1.6.2
PNG_URL := https://sourceforge.net/projects/libpng/files/libpng16/older-releases/$(PNG_VERSION)/libpng-$(PNG_VERSION).tar.xz


$(TARBALLS)/libpng-$(PNG_VERSION).tar.xz:
	$(call download,$(PNG_URL))

.sum-png: libpng-$(PNG_VERSION).tar.xz


png: libpng-$(PNG_VERSION).tar.xz .sum-png
	$(UNPACK)
	$(MOVE)

DEPS_png = zlib $(DEPS_zlib)

.png: png
	$(RECONF)
	cd $< && $(HOSTVARS) ./configure $(HOSTCONF)
	cd $< && $(MAKE) install
	touch $@
