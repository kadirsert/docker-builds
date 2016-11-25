#!/bin/bash

for container_name in $(docker ps | grep -v "IMAGE" | awk 'NF>1{print $NF}')
do
  echo "${container_name}:"
  mounts=$(docker inspect --format='{{range .Mounts}}{{ .Destination }} {{ .Source }}||{{end}}' ${container_name})
  IFS='||' read -r -a mounts_arr <<< "${mounts}"
  for mount in "${mounts_arr[@]}"
  do
    echo ${mount}
  done
done
