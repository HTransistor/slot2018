#!/bin/bash

# $1 inputfile.mrc
# $2 Deltax
# #3 Deltaang

BashFileFolder="`dirname "$0"`"

Name="$1" 

Nx="500"
Ny="440"

Deltax="$2"
Deltaang="$3"

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

if [ -z "$2" ]
then
	echo "read dx,dang from info.txt"

	dxtop="`tail -n 1 "offset_test_top/info.txt"`"
	dxbottom="`tail -n 1 "offset_test_bottom/info.txt"`"

	Deltax="$(expr "$( expr $dxtop + $dxbottom )" / 2 )"
	Deltaang="0"
fi

#------------------------------------------

tilt -THICKNESS "$Nx" -OFFSET "$Deltaang $Deltax" -TILTFILE "$WinkelFile" -WeightFile "$GewichtFile" -INPUT "$Name" -OUTPUT "reconstr_${Deltax}_${Deltaang}.mrc" -UseGPU 0
