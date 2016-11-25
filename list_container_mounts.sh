#!/bin/bash

IFS='
'
for container_name in $(docker ps | grep -v "IMAGE" | awk 'NF>1{print $NF}')
do
  echo "${container_name}:"
  mounts=$(docker inspect --format='{{range .Mounts}}{{ .Destination }} {{ .Source }}:{{end}}' ${container_name})
  read -r -a mounts_arr <<< "${mounts}"
  for ind in "${!mounts_arr[@]}"
  do
    echo $ind ${mounts_arr[ind]}
  done
done
