#!/bin/bash

# 1. Delete files in the pareent directory: /pythainlp/tutorials/*.*

for f in `curl --list-only --ipv4 ftp://$1:$2@thainlp.org/public_html/pythainlp/tutorials/`; do
  # Delete each file individually
  if [[ -f $f ]]; then
    echo "deleting: $f"
    curl --ipv4 ftp://$1:$2@thainlp.org -Q "DELE public_html/pythainlp/tutorials/$f"
  fi
done

# 2. Delete files in the sub directories: notebooks, _images, _sources, _static

SUB_DIRECTORIES=(notebooks _images _sources _static)

for directory in ${SUB_DIRECTORIES[*]}; do
  echo "delete files in: $directory"
  for f in `curl --list-only --ipv4 ftp://$1:$2@thainlp.org/public_html/pythainlp/tutorials/$directory/`; do
    if [[ -f $f ]]; then
      echo "-- deleting: $f"
      curl --ipv4 ftp://$1:$2@thainlp.org -Q "DELE public_html/pythainlp/tutorials/$directory/$f"
    fi
  done
done