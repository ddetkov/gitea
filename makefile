#!/usr/bin/env make

# © Dmitry Detkov 2024
# Изделие №4 Detkov Pro. - gitea
# File: makefile

.PHONY: *

all: build push

build:
	@docker compose -f compose.build.yml build

push:
	@docker compose -f compose.build.yml push

gitea.up: build
	@docker compose up -d --force-recreate
