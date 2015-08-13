#!/bin/bash
A:
cd Desktop
mkdir rmsd-output
mkdir rmsd-output/temp
vmd -dispdev text -e rmsd-calc.tcl -eofexit
exit
R CMD BATCH A:/Projects/NAMD-VMD/rmsd-calc-from-tmd/R-scripts_Visualization/rmsd-graph.R
exit
cd rmsd-output
rm temp