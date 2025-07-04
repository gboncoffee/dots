#!/usr/bin/env bash

swaylock -i $(swww query | cut -d',' -f3 | head -1 | cut -d' ' -f5)
