#!/bin/bash

target="/usr/mcserv"
serv_dir="kubiki-serv"
world_dir="kubiki"
service_target="/lib/systemd/system"
unit_name="minecraft_server.service"
startup_script="startup.sh"
shutdown_script="shutdown.sh"

cd ..

if [[ ! -d "$target" ]]; then
  mkdir "$target"
  echo "created dir $target"
fi

rm -r "$target/$serv_dir"
rm -r "$target/$world_dir"
echo "removed existing dirs $serv_dir and $world_dir"

cp -r "$world_dir" "$target/$world_dir"
cp -r "$serv_dir" "$target/$serv_dir"
echo "copied source dirs $serv_dir and $world_dir"

cp "$serv_dir/$unit_name" "$service_target/$unit_name"
echo "copied service file $unit_name into $service_target"

cd "$target/$serv_dir"
chmod a+x "$startup_script"
chmod a+x "$shutdown_script"
echo "added execute permission to $startup_script and $shutdown_script"

cd ..
echo "server log" > "./log"

systemctl daemon-reload
echo "reloaded systemd"
