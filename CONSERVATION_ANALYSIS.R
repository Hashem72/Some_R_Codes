par(mfrow = c(3,1))



PLOT.CONSERVATION.SCORES("/nfs/th_group/hk3/UW_DNaseI_HS/K562/K562_encode_Five_Prime_Conservation_Scores.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/K562/K562_encode_Three_Prime_Conservation_Scores.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/K562/K562_encode_Core_Conservation_Scores.txt", 25,100, "Conservation Scores for Encode K562 Hotspots")
abline(h= 2.5, col = 'grey', lty = 2)
abline(h= 2.75, col = 'grey', lty = 2)


PLOT.CONSERVATION.SCORES("/nfs/th_group/hk3/UW_DNaseI_HS/K562/group_A_hotspots_Five_Prime_Conservation_Scores.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/K562/group_A_hotspots_Three_Prime_Conservation_Scores.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/K562/group_A_hotspots_Core_Conservation_Scores.txt", 25,100, "Conservation Scores for Group A K562 Hotspots")

abline(h= 2.5, col = 'grey', lty = 2)
abline(h= 2.75, col = 'grey', lty = 2)


PLOT.CONSERVATION.SCORES("/nfs/th_group/hk3/UW_DNaseI_HS/K562/group_B_hotspots_Five_Prime_Conservation_Scores.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/K562/group_B_hotspots_Three_Prime_Conservation_Scores.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/K562/group_B_hotspots_Core_Conservation_Scores.txt", 25,100, "Conservation Scores for Group B K562 Hotspots")

abline(h= 2.5, col = 'grey', lty = 2)
abline(h= 2.75, col = 'grey', lty = 2)


#Gm12878
PLOT.CONSERVATION.SCORES("/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878/wgEncodeUwDnaseGm12878HotspotsRep1_Five_Prime_Conservation_Scores.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878/wgEncodeUwDnaseGm12878HotspotsRep1_Three_Prime_Conservation_Scores.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878/wgEncodeUwDnaseGm12878HotspotsRep1_Core_Conservation_Scores.txt",25,100, "Conservation Scores for encode G12878 Hotspots")
abline(h= 2.5, col = 'grey', lty = 2)
abline(h= 2.75, col = 'grey', lty = 2)


PLOT.CONSERVATION.SCORES("/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878/group_A_hotspots_Five_Prime_Conservation_Scores.txt" , "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878/group_A_hotspots_Three_Prime_Conservation_Scores.txt" , "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878/group_A_hotspots_Core_Conservation_Scores.txt", 25,100, "Conservation Scores for group A G12878 Hotspots")
abline(h= 2.5, col = 'grey', lty = 2)
abline(h= 2.75, col = 'grey', lty = 2)


PLOT.CONSERVATION.SCORES("/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878/group_B_hotspots_Five_Prime_Conservation_Scores.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878/group_B_hotspots_Three_Prime_Conservation_Scores.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878/group_B_hotspots_Core_Conservation_Scores.txt", 25, 100 , "Conservation Scores for group B G12878 Hotspots")

abline(h= 2.5, col = 'grey', lty = 2)
abline(h= 2.75, col = 'grey', lty = 2)

#H1hesc
PLOT.CONSERVATION.SCORES("/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc/wgEncodeUwDnaseH1hescHotspotsRep1_Five_Prime_Conservation_Scores.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc/wgEncodeUwDnaseH1hescHotspotsRep1_Three_Prime_Conservation_Scores.txt" , "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc/wgEncodeUwDnaseH1hescHotspotsRep1_Core_Conservation_Scores.txt", 25,100, "Conservation Scores for encode H1hesc Hotspots")
abline(h= 2.5, col = 'grey', lty = 2)
abline(h= 2.75, col = 'grey', lty = 2)


PLOT.CONSERVATION.SCORES("/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc/group_A_hotspots_Five_Prime_Conservation_Scores.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc/group_A_hotspots_Three_Prime_Conservation_Scores.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc/group_A_hotspots_Core_Conservation_Scores.txt", 25, 100, "Conservation Scores for group A H1hesc Hotspots ")

abline(h= 2.5, col = 'grey', lty = 2)
abline(h= 2.75, col = 'grey', lty = 2)

PLOT.CONSERVATION.SCORES("/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc/group_B_hotspots_Five_Prime_Conservation_Scores.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc/group_B_hotspots_Three_Prime_Conservation_Scores.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc/group_B_hotspots_Core_Conservation_Scores.txt", 25, 100, "Conservation Scores for group B H1hesc Hotspots")

abline(h= 2.5, col = 'grey', lty = 2)
abline(h= 2.75, col = 'grey', lty = 2)



#################################### FUNCTIONS ###################


PLOT.CONSERVATION.SCORES <- function(fivePrimeFile,threePrimeFile,coreFile,flankLength,coreLength,title){
  five.prime.matrix          <- GET.MATRIX.OF.CONSERVATION.SCORES(fivePrimeFile)
  na.free.five.prime.matrix  <- REMOVE.ROWS.WITH.CONTAINING.NA(five.prime.matrix )
  three.prime.matrix         <- GET.MATRIX.OF.CONSERVATION.SCORES(threePrimeFile)
  na.free.three.prime.matrix <-  REMOVE.ROWS.WITH.CONTAINING.NA(three.prime.matrix)
  core.matrix                <- GET.MATRIX.OF.CONSERVATION.SCORES(coreFile)
  na.free.core.matrix        <- REMOVE.ROWS.WITH.CONTAINING.NA( core.matrix)

  five.prime.col.mean <- colMeans(na.free.five.prime.matrix)
  thee.prime.col.mean <- colMeans(na.free.three.prime.matrix)
  core.col.mean       <- colMeans(na.free.core.matrix)

 
  five.core.three.scores = c(five.prime.col.mean, core.col.mean, thee.prime.col.mean)
  total.number.of.scores = length(five.core.three.scores)

  total.seq.length = 4*flankLength + coreLength;
  x = seq(1,total.seq.length+3, by=1)
  if(total.number.of.scores != length(x)){
    stop(paste("number of scores = " , total.number.of.scores , " doesnt match with number of positions = " , length(x), sep =" "))
  }

  plot(five.prime.col.mean, xlim = c(0,length(x) ) ,type = 'l', lwd =3,ylim = c(2.2,3.2), ylab = "Conservation Scores", xlab = "Sequence Position", main = title)
  core.start <-  2*flankLength+2
  core.end   <- core.start +coreLength 
  core.x     <-  seq(core.start, core.end,by=1 )
  lines(core.x, core.col.mean, lwd =3, col = 'red')
  three.prime.start = core.end+1
  thee.prime.end  = three.prime.start + 2*flankLength
  thee.prime.x <- seq(three.prime.start,thee.prime.end, by =1)
  lines(thee.prime.x, thee.prime.col.mean, lwd =3)
  abline(v= flankLength, col = 'grey',lty=2)
  abline(v= total.seq.length-flankLength, col = 'grey', lty=2 )
  
}#PLOT.CONSERVATION.SCORES#


GET.MATRIX.OF.CONSERVATION.SCORES<- function (dataFileName){
	table_of_data <- read.table(file = dataFileName, sep = ",",fill = TRUE, row.names = NULL)
	Ncol          <- length(table_of_data[])
	Matrix_of_data <- data.matrix(table_of_data[1: Ncol-1])
	C <- ncol(Matrix_of_data)
	R <- nrow(Matrix_of_data)
	Matrix_of_data
	}#GET.MATRIX.OF.CONSERVATION.SCORES#
	
REMOVE.ROWS.WITH.CONTAINING.NA <- function(aMatrix){
	Nrows = nrow(aMatrix)
	
	NewMatrix = c()
	for(i in 1:Nrows){
		if ( !is.element(NA, aMatrix[i,])  ){
			#aMatrix= aMatrix[-i,]
			NewMatrix = rbind(NewMatrix,aMatrix[i,], deparse.level = 0 )
			
			}
		}
		NewMatrix
	}#REMOVE_ROWS_WITH_CONTAINING_NA#
	
