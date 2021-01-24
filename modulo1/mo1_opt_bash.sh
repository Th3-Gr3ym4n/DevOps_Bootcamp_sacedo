#!/bin/bash
curl -o fileweb.txt https://www.shodan.io/
grep -in "$1" fileweb.txt