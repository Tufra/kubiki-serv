#!/bin/bash

server_exec="minecraft_server.1.12.2.jar"
world_dir="kubiki"
serv_dir="kubiki_serv"
world_repo="https://github.com/Tufra/$world_dir.git"
serv_repo="https://github.com/Tufra/$serv_dir.git"

# clone server and mods + worlds if they do not exist
cd /usr/mcserv
if [[ ! -d "$world_dir" ]]; then
  git clone "$world_repo"
fi

if [[ ! -d "$serv_dir" ]]; then
  git clone "$serv_repo"
fi 

# pull mods and worlds
cd "$world_dir"
git fetch origin main
git pull origin main

# pull server
cd "../$serv_dir"
git fetch origin main
git pull origin main

# copy world and mods to server
cp "../$world_dir/mods" .
cp "../$world_dir/NN" .

java -Xmx8G -jar "$server_exec" --nogui
