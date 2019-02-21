#!/bin/bash

MaxY="440"

Folder="offset_test_"
InfoFile="/info.txt"

TopFi="${Folder}top${InfoFile}"
BottomFi="${Folder}bottom${InfoFile}"

TopDx="`tail -n 1 "$TopFi"`"
BottomDx="`tail -n 1 "$BottomFi"`"

BashFileFolder="`dirname "$0"`"
PythonFile="$BashFileFolder/rotate.py"

DiffDx="$(python $PythonFile $TopDx $BottomDx $MaxY)"

echo "$DiffDx"
