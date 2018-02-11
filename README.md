# Load all User Stats from steam
The first step is an call to the [Steam Web API](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetOwnedGames_.28v0001.29) to
load all games the user owns.

After that the script request the user stats for every single game from [Steam Web API](https://developer.valvesoftware.com/wiki/Steam_Web_API#GetUserStatsForGame_.28v0002.29). This may take a while.


## How to use
### Get Steam Web API Key
Go to [Steam](https://steamcommunity.com/dev/apikey) and enter anything in the 'Domain' field to receive the key.
Store the key in a enviorment variable named ```STEAM_KEY``` 

### Get Steam ID
Just ask a search engine of your choice. :)
It must be a number!

Store this number in a enviorment variable named ```STEAM_ID```


### Execute the script
```
./loadUserStats.sh
```
