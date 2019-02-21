#!/bin/python

import os
import numpy as np

start_ang = 0
end_ang = 360

projections = 800

#--------------------------------------------------------------------

winkel_list = np.linspace(start_ang, end_ang, num=projections)

#print(winkel_list)

final_winkel_list = np.array([ start_ang ])
final_winkel_list = np.append(final_winkel_list, winkel_list)
final_winkel_list = np.append(final_winkel_list, np.array([ end_ang ]))

#print(final_winkel_list)

#--------------------------------------------------------------------

this_file_path = os.path.realpath(__file__)
this_file_dir = os.path.dirname(this_file_path)
winkel_file = this_file_dir + "/winkel.txt"

np.savetxt(winkel_file, final_winkel_list, fmt='%8f')
