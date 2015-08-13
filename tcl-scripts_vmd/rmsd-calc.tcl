# vmd script for computing rmsd from a tmd trajectory
puts -nonewline "Enter target PDB File Path"
set target [gets stdin]
cp target /temp/target.pdb 

puts -nonewline "Enter initial PSF File Path"
set psf [gets stdin]
cp psf /temp/init.psf

#puts -nonewline "Enter initial .restart.coor File Path"
#set coordinate [gets stdin]
#cp coordinate /temp/init.restart.coor

puts -nonewline "Enter .dcd File Path"
set dcd [gets stdin]
cp dcd /temp/tmd.dcd

mol new /temp/target.pdb
set ref [atomselect top "name CA"]

mol new init.psf
mol addfile tmd.dcd waitfor all step 1
# mol addfile proteus-tmd-output.dcd watifor all step 10
# mol addfile proteus-md-after-tmd-output.dcd waitfor all step 10
# mol addfile ../md-after-tmd2-part2/proteus-md-after-tmd-output-part2.dcd waitfor all step 10

set ca [atomselect top "name CA"]

puts "[molinfo top get numframes] frames.  Number CA [$ca num] [$ref num]."

set fp [open "rmsd.dat" "w"]

for {set i 0} {$i < [molinfo top get numframes]} {incr i} {
    $ca frame $i
    $ref move [measure fit $ref $ca]
    puts $fp "$i [measure rmsd $ca $ref]"    
    puts "$i..."
}

close $fp