#!/bin/python

import numpy as np

start_ang = 0
end_ang = 360

projections = 800

#--------------------------------------------------------------------

winkel_list = np.linspace(start_ang, end_ang, num=projections)

print(winkel_list)

final_winkel_list = np.array([ start_ang ])
final_winkel_list = np.append(final_winkel_list, winkel_list)
final_winkel_list = np.append(final_winkel_list, np.array([ end_ang ]))

print(final_winkel_list)

#--------------------------------------------------------------------

np.savetxt("winkel.txt", final_winkel_list, fmt='%8f')
