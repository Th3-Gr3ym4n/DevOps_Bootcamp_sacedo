#!/bin/bash
var1=$1
if [[ "$var1! fileweb1.txt ]]; then

  curl -o fileweb.txt https://www.shodan.io/
  grep -in "$var1" fileweb.txt
else
  echo "Introduce texto a buscar"
fi
