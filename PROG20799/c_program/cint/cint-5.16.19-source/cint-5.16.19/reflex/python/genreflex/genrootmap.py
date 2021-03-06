# Copyright CERN, CH-1211 Geneva 23, 2004-2006, All rights reserved.
#
# Permission to use, copy, modify, and distribute this software for any
# purpose is hereby granted without fee, provided that this copyright and
# permissions notice appear in all copies and derivatives.
#
# This software is provided "as is" without express or implied warranty.

import os, sys, string

model = """
# This file has been generated by genreflex with the --rootmap option
#--Final End
"""

#----------------------------------------------------------------------------------
def genRootMap(mapfile, dicfile, libfile, classes) :
  startmark = '#--Begin ' + dicfile + '\n'
  endmark   = '#--End   ' + dicfile + '\n'
  finalmark = '#--Final End\n'
  transtable = string.maketrans(': ', '@-')

  new_lines = []
  if libfile.rfind('/') != -1 : libfile =  libfile[libfile.rfind('/')+1:]
  for c in classes :
    nc = string.translate(str(c), transtable)
    nc = nc.replace(' ','')
    new_lines += '%-45s %s\n' % ('Library.' + nc + ':', libfile )
  if not os.path.exists(mapfile) :
    lines = [ line+'\n' for line in model.split('\n')]
  else :
    f = open(mapfile,'r') 
    lines = [ line for line in f.readlines()]
    f.close()
  if startmark in lines and endmark in lines :
    lines[lines.index(startmark)+1 : lines.index(endmark)] = new_lines
  else :
    lines[lines.index(finalmark):lines.index(finalmark)] = [startmark]+new_lines+[endmark]
  f = open(mapfile,'w')
  f.writelines(lines)
  f.close()


