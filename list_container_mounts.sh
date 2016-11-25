#!/bin/bash

for container_name in $(docker ps | grep -v "IMAGE" | awk 'NF>1{print $NF}')
do
  echo "${container_name}:"
  mounts=$(docker inspect --format='{{range .Mounts}}{{ .Source }} {{ .Destination }}:{{end}}' ${container_name})
  IFS=':' read -r -a mounts_arr <<< "${mounts}"
  for ind in "${!mounts_arr[@]}"
  do
    mount_line=(${mounts_arr[ind]})
    echo "$ind Source: ${mount_line[0]}"
    echo "$ind Destination: ${mount_line[1]}"
  done
done
