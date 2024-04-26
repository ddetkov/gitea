#!/usr/bin/env bash

# © Dmitry Detkov 2024
# Изделие №4
# File: scripts/backup.sh

# create target directory
mkdir -p /backup

# fix permissions
chown -R git:users /backup

# create backup
cd /backup
su git -c "gitea dump"

# keep only 3 backups
ls -1t /backup/* | tail -n +4 | xargs /bin/rm -f

# display existing backups
ls -1t /backup/*
