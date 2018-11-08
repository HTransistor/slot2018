#!/bin/bash

# $1 inputfile.mrc
# $2 "top" or "bottom"

BashFileFolder="`dirname "$0"`"

Name="$1" 

Nx="500"
Ny="440"

Deltax="50"
Aroundx="0"
Step="1"

Folder="offset_test_$2"

Slicey1="200"
if [ "$2" = "top" ]
then
	Slicey1="439"
fi
if [ "$2" = "bottom" ]
then
	Slicey1="0"
fi
Slicey2="$Slicey1"

#python "$BashFileFolder/winkel.py"                # nur einmal noetig
WinkelFile="$BashFileFolder/winkel.txt"

#python "$BashFileFolder/weight.py"                # nur einmal noetig
GewichtFile="$BashFileFolder/weight.txt"

#------------------------------------------

if [ -z "$1" ]
then
	echo "no argument"
	exit 1
fi

#------------------------------------------

if [ -d "$DIRECTORY" ]; then
	mv "$Folder" "${Folder}_`date -Iseconds`"
fi
mkdir "$Folder"

echo "inputfile = $Name" > "$Folder/info.txt"
echo "folder = `pwd`" > "$Folder/info.txt"

function recons {
	tilt -THICKNESS "$Nx" -OFFSET "0 $1" -TILTFILE "$WinkelFile" -WeightFile "$GewichtFile" -INPUT "$Name" -OUTPUT "$Folder/dx$1.mrc" -SLICE "$Slicey1 $Slicey2" -UseGPU 0
	mrc2tif -p "$Folder/dx$1.mrc" "$Folder/dx$1.png"
	rm "$Folder/dx$1.mrc"
}

Counter="$(($Aroundx - $Deltax))"
while [ $Counter -lt $(($(($Aroundx + $Deltax)) + $Step)) ]
do
	recons "$Counter"
	Counter="$(($Counter + $Step))"
done
