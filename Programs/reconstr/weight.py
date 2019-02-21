#!/bin/python

import os
import numpy as np

#start_ang = 0
#end_ang = 360

projections = 800

#--------------------------------------------------------------------

weight_list = np.ones(projections)

#print(winkel_list)

final_weight_list = np.array([ 0 ])
final_weight_list = np.append(final_weight_list, weight_list)
final_weight_list = np.append(final_weight_list, np.array([ 0 ]))

#print(final_winkel_list)

#--------------------------------------------------------------------

this_file_path = os.path.realpath(__file__)
this_file_dir = os.path.dirname(this_file_path)
weight_file = this_file_dir + "/weight.txt"

np.savetxt(weight_file, final_weight_list, fmt='%8f')
