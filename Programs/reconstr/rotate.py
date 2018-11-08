#1/bin/python

import sys
import numpy as np

top = int(sys.argv[1])
bottom = int(sys.argv[2])
maxy = int(sys.argv[3])

dx = top - bottom
ang = np.arcsin(dx / maxy)
degree = (360 / (2 * np.pi)) * ang

middle = (top + bottom) / 2

print("dx:", middle)
print("rotate:", degree)
