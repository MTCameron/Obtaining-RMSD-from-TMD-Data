# Obtaining-RMSD-from-TMD-Data
Short Description: 
Obtain the RMSD values for a TMD trajectory of a molecule in reference to the target file

Longer Description:
I have been working with NAMD a lot recently, and when doing TMD simulations it is always important to calculate the RMSD values for a particular resulting trajectory. Thus, I have decided to write a few scripts that will work towards automating this process.

Obtaining RMSD (Root Mean Square Distance) values from a TMD trajectory is accomplished in a few steps.

1. After obtaining the results from the TMD run, we must load the resulting trajectory into a VMD session

2. Load the target file into the VMD session

3. Align the target file to every step of the resulting trajectory independently

4. Calculate the RMSD value that represents the difference between the target file and the actual set of coordinates at a given traectory frame

5. Import the RMSD values into R (analytics and graphics language)

6. Make plots or other graphical representations
