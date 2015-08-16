raw_rmsd_data <- read.csv(file="rmsd.dat", sep = " ", )
attach(raw_rmsd_data)
frame <- raw_rmsd_data [1]
rmsd <- raw_rmsd_data[2]
plot(data.frame(frame,rmsd), main="RMSD As a Function of Frames", xlab="Frames", ylab="RMSD")
