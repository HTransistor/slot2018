#!/bin/bash

# $1 inputfile.mrc
# $2 "top" or "bottom"

BashFileFolder="$HOME/Documents/projects/slot2018/Programs"

Name="$1" 

Nx="500"
Ny="440"

Deltax="9"
Aroundx="-14"
Step="1"

Folder="offset_test_${Aroundx}_$2"

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

#------------------------------------------

if [ -z "$1" ]
then
	echo "no argument"
	exit 1
fi

#------------------------------------------

mkdir "$Folder"
echo "inputfile = $Name" > "$Folder/info.txt"

# maybe remove '-SLICE...'
function recons {
	tilt -THICKNESS "$Nx" -OFFSET "0 $1" -TILTFILE "$WinkelFile" -INPUT "$Name" -OUTPUT "$Folder/dx$1.mrc" -SLICE "$Slicey1 $Slicey2"
	mrc2tif -p "$Folder/dx$1.mrc" "$Folder/dx$1.png"
	rm "$Folder/dx$1.mrc"
}

Counter="$(($Aroundx - $Deltax))"
while [ $Counter -lt $(($(($Aroundx + $Deltax)) + $Step)) ]
do
	recons "$Counter"
	Counter="$(($Counter + $Step))"
done
