#!/bin/bash

cat $1 |
  sed '0,/\[\[gallery_item\]\]/{s//gallery_item:/}' |
  sed '/\[\[gallery_item\]\]/d' |
  sed '/^gallery_item:/i gallery_thumb_suffix: "@!small"' |
  sed 's/^+++$/---/' |
  sed 's/ = /: /' |
  sed 's/^album: /- album: /' |
  sed 's/^image: /  image_src: /' |
  sed 's/^caption: /  caption: /' |
  sed 's/@!original//' |
  sed 's/< gallery /< gallery_remote /' > ${1}1

