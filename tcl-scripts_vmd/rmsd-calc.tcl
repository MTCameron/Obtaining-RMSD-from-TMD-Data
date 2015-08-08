# vmd script for computing rmsd from a tmd trajectory

mol new 4nco_to_tgt-4i53.pdb
set ref [atomselect top "name CA"]

mol new 4nco-solvated-ionized.psf
mol addfile proteus-md-output3.dcd waitfor all step 10
mol addfile proteus-tmd-output.dcd watifor all step 10
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



exit

