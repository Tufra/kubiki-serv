#!/bin/bash

world_dir="kubiki"
serv_dir="kubiki-serv"
message="`date +%d_%M_%Y_%T` autocommit"

cd /usr/mcserv

cp "$serv_dir/NN" "$world_dir/NN"

cd "$world_dir"

git add -A
git commit -m "$message"
git push origin main
