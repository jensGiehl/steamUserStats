#!/bin/bash

# Load Gamelist
./loadGames.sh myGames

# Extract AppIds
cat myGames.json | grep "appid" | cut -d':' -f2 | sed -e 's/ //g' | sed -e 's/,//g' > myAppIds.txt

# Remove Gamelist
rm myGames.json

# Load UserStats for every App
while read appId; do
  logger "Load UserStats for AppId $appId"
  ./wgetRetry.sh "http://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/v0002/?appid=$appId&key=$STEAM_KEY&steamid=$STEAM_ID" "$appId.json"
  
# Check if file is empty (typical when the app has no stats)
  fileSize=`wc -c < "$appId.json"`
  if [ $fileSize -eq 0 ]; then
     logger "Remove $appId.json because it's empty"
     rm "$appId.json"
  else
     mkdir --parents "$STEAM_ID"
     fileName=`cat $appId.json| grep "gameName" | sed -e 's/"gameName": "//g;s/",//g;s/^[ \t]*//'`
     logger "Steam App ID $appId = $fileName"
     mv $appId.json "$STEAM_ID/$fileName.json"
  fi
done < myAppIds.txt

# Remove AppIds
rm myAppIds.txt
