#!/bin/bash

# tu in Ordner mit .mrc

Name="tomo_photo_diode_001_deinterlaced_evan.mrc" 

Nx="500"
Ny="440"

Deltax="5"
Aroundx="-14"
Step="1"

Slicey1="200"
Slicey2="200"

python "winkel.txt"
WinkelFile="winkel.txt"

#------------------------------------------

mkdir offset_test

# maybe remove '-SLICE...'
function recons {
	tilt -THICKNESS "$Nx" -OFFSET "0 $1" -TILTFILE "$WinkelFile" -INPUT "$Name" -OUTPUT "offset_test/dx$1.mrc" -SLICE "$Slicey1 $Slicey2"
	mrc2tif -p "offset_test/dx$1.mrc" "offset_test/dx$1.png"
	rm "offset_test/dx$1.mrc"
}

Counter="$(($Aroundx - $Deltax))"
while [ $Counter -lt $(($(($Aroundx + $Deltax)) + $Step)) ]
do
	recons "$Counter"
	Counter="$(($Counter + $Step))"
done

