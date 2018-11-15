#!/bin/bash

old="$1"
new="$1-`date -Iseconds`.png"

slice="150"

mrc2tif -p -z "$slice,$slice" "$old" "$new"
