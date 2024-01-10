# SPDX-License-Identifier: 0BSD
# Copyright (C) 2024 Emily "TTG" Banerjee <prs.ttg+aga@pm.me>

ifdef WINDOWS_SHELL
	RM = del
define PATHREM
	$(RM) $(subst /,\\,$(1))
endef
else
define PATHREM
	$(RM) $(1)
endef
endif

PYTHON = python

MODELS = $(wildcard model/*.obj)
MODELBINS = $(MODELS:.obj=.obj.raw)

SOUNDS = $(wildcard snd/*.mp3)
SOUNDBINS = $(SOUNDS:.mp3=.mp3.raw)

IMGS = $(wildcard img/*.tiff)
IMGBINS = $(IMGS:.tiff=.tiff.raw)

ifdef AGA_DEV
	VERTGEN = $(AGA_DEV)/script/vertgen.py
	SNDGEN = $(AGA_DEV)/script/sndgen.py
	IMGGEN = $(AGA_DEV)/script/imggen.py
else
	VERTGEN = aga-vertgen
	SNDGEN = aga-sndgen
	IMGGEN = aga-imggen
endif

%.obj.raw: %.obj
	$(PYTHON) $(VERTGEN) $< $@

%.mp3.raw: %.mp3
	$(PYTHON) $(SNDGEN) $< $@

%.tiff.raw: %.tiff
	$(PYTHON) $(IMGGEN) $< $@

.PHONY: all
all: $(MODELBINS) $(SOUNDBINS) $(IMGBINS)

.PHONY: clean
clean:
	$(call PATHREM,$(MODELBINS))
	$(call PATHREM,$(SOUNDBINS))
	$(call PATHREM,$(IMGBINS))
