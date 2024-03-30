#!/bin/bash

rm -rf ./client

for file in $(find ./ -name '*.yaml'); do
  if [[ $file == *"gen_configs"* ]]; then
    continue
  fi

  echo Generating for $file
  java -jar ./generator.jar generate -i $file -g typescript-angular -o ./client -c ./gen_configs/ts.yaml
done

cp -r "${1}" ../GUI