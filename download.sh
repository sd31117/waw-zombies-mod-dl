#!/bin/bash
clear
#Authors: sd31117 and mshriver2

#prints splash ascii
echo "ICAgICAgICAgICAgICgoKSkpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAvfHggeHwgICAgWU9VIEtOT1cgV0hBVCBUSEUgQ0FMTCBPRiBEVVRZIFNFUklFUyBSRUFMTFkgTkVFRFMgPz8/CiAgICAgICAgICAgL1woIC0gKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgX19fLi0uXy9cLyAgICAgICAgIE1PQlNURVJTICpBTkQqIFpPTUJJRVMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogIC89YF8nLSctJy8gICEhICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgfC17LV8tXy19ICAgICAhICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAoLXstXy1fLX0gICAgISAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICBce18tXy1ffSAgICEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICB9LV8tXy19ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgIHstX3wtX30gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgey1ffF8tfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICB7Xy18LV99ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgIHtfLXwtX30gIFpPVCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApfX19fJSVAIEAlJV9fX19fX18gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCg==" | base64 -d

#printf is needed to print newlines 
printf "\n"

# greets user and collects input
printf "### Welcome to the Linux COD Zombies WAW Custom Map Downloader! \e[32mv1.0.0\e[0m ###\n\n"

printf "\e[36mPlease enter the path to your waw mods folder dir [press enter for default]: \e[0m\n"

#stores cod mod folder path
read modPath

# sets default modpath if not given input by the user
if [ -z "$modPath" ]
    then
        modPath="~/.steam/steam/steamapps/compatdata/10090/pfx/drive_c/users/steamuser/Local Settings/Application Data/Activision/CoDWaW/mods/"
        printf "No Directory Set. Using Default\n$modPath\n"
    else
        modPath=$modPath
        printf "Directory Set!\n$modPath\n"
fi


printf "\n\e[36mPlease enter a number to select your mod archive type | [1: zip] or [2: tar.gz]: \e[0m\n"

#stores file extension type
read fileType

printf "\e[36mEnter the url to the archive containg the mod folders you wish to install: \e[0m\n"

#stores url to mod archive variable
read modURL

cd "$modPath"

printf "\e[36mDownloading files please wait...\e[0m\n"

#always quote var dereferences otherwise the shell confused the spaces in the vars value as spaces seperating multiple values
wget $modURL

printf "\e[36mDownload complete. Extracting and copying files...\e[0m\n"

#checks to see which filetype the user used and then extracts the archive 
case $fileType in

    1)
        #extracts zip
        unzip -a *.zip 

        #removes zip archive when finished
        rm *.zip   
        ;;

    2)
        #extracts tar.gz
        tar -xzvf *.tar.gz

        #removes tar.gz archive when finished
        rm *.tar.gz
        ;;
esac



printf "\e[32mYour mods were installed successfully! Thank you for using waw-zombies-mod-dl!\e[0m"