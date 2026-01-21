#!/usr/bin/env bash

echo "Do you install everything without choosing? (y/n, default:y)"
read firstQuestion
firstQuestion=${mirror_choice:-y}

installPackages() {
	for pkg; do
	  if [[ $(pacman -Q "${pkg}" 2>/dev/null) ]]; then
		  
