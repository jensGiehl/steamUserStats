#!/bin/bash

if [[ -z "${STEAM_ID}" ]]; then
   echo -e "Please set \033[0;31mSTEAM_ID\033[0m as enviorment variable"
   exit 1
fi

if [[ -z "${STEAM_KEY}" ]]; then
   echo -e "Please set \033[0;31mSTEAM_KEY\033[0m as enviorment variable"
   exit 1
fi


currentDate=`date '+%Y-%m-%d_%H%M'` 
fileName=${1:-"$STEAM_ID-GAMES-$currentDate"}
#wget -q "http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=$STEAM_KEY&steamid=$STEAM_ID&format=json&include_appinfo=1&include_played_free_games=1" -O $fileName.json
./wgetRetry.sh "http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=$STEAM_KEY&steamid=$STEAM_ID&format=json&include_appinfo=1&include_played_free_games=1" $fileName.json
