#!/bin/bash

rm -rf ./client

for file in $(find ./ -name '*.yaml'); do
  if [[ $file == *"configs"* ]]; then
    continue
  fi

  echo Generating for $file
  java -jar ./generator.jar generate -i $file -g typescript-angular -o ./client -c ./configs/ts.yaml
done

cp -r ./client "${1}"