MESON ?= meson
NINJA ?= ninja
BUILDDIR ?= obj
PREFIX ?= /usr/local
MESON_ARGS ?=

ifeq ($(origin PREFIX),command line)
RECONFIGURE_PREFIX = --prefix="$(PREFIX)"
else
RECONFIGURE_PREFIX =
endif

.PHONY: all setup install clean

all: setup
	$(NINJA) -C $(BUILDDIR)

setup:
	@if [ ! -f "$(BUILDDIR)/build.ninja" ]; then \
		$(MESON) setup "$(BUILDDIR)" --prefix="$(PREFIX)" $(MESON_ARGS); \
	elif [ -n "$(RECONFIGURE_PREFIX)" ]; then \
		$(MESON) configure "$(BUILDDIR)" $(RECONFIGURE_PREFIX); \
	fi

install: all
	$(MESON) install -C $(BUILDDIR)

clean:
	@if [ -f "$(BUILDDIR)/build.ninja" ]; then \
		$(NINJA) -C $(BUILDDIR) clean; \
	fi
