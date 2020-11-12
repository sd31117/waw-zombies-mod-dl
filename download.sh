#!/bin/bash

#collects user input
echo "Welcome to the Linux COD Zombies WAW Custom Map Downloader!\n"

echo "Please enter the path to your waw mods folder dir [press enter for default]: \n"

#stores cod mod folder path
read modPath

echo "Enter the url to the archive containg the mod folders you wish to install: "

#stores url to mod archive variable
read modURL

cd modPath

wget modURL

tar -xzvf *.tar.gz