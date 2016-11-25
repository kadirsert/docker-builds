#!/bin/bash

for container_name in $(docker ps | grep -v "IMAGE" | awk 'NF>1{print $NF}')
do
  echo "${container_name}:"
  mounts=$(docker inspect --format='{{range .Mounts}}{{ .Source }} {{ .Destination }}:{{end}}' ${container_name})
  IFS=':' read -r -a mounts_arr <<< "${mounts}"
  for line in "${mounts_arr[@]}"
  do
    line_arr=(${line})
    echo "${line_arr[0]} --> ${line_arr[1]}"
  done
  echo
done
