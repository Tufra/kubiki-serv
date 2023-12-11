#!/bin/bash

server_exec="forge-1.16.5-36.2.39.jar"
world_dir="kubiki"
serv_dir="kubiki-serv"
world_repo="https://github.com/Tufra/$world_dir.git"
serv_repo="https://github.com/Tufra/$serv_dir.git"

token="f28a7193-7bfc-438f-a064-f4c121cd14d9"
domain="kubiki"

# clone server and mods + worlds if they do not exist
cd /usr/mcserv
# if [[ ! -d "$world_dir" ]]; then
#   git clone "$world_repo"
# fi

if [[ ! -d "$serv_dir" ]]; then
  git clone "$serv_repo"
fi 

# # pull mods and worlds
# cd "$world_dir"
# git pull origin main

# pull server
cd "$serv_dir"
git pull origin main

# copy world and mods to server
# cp -r "../$world_dir/mods" "./"
# cp -r "../$world_dir/NN" "./"

curl -k -o ./logs/duckdns.log "https://www.duckdns.org/update?domains=$domain&token=$token&ip="

java -Xmx8G -Dfml.queryResult=confirm -jar "$server_exec" --nogui
