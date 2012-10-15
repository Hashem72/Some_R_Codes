
MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES <- function(cellLine, threshold, biasedOrUnbiased){
  path = paste("/nfs/th_group/hk3/UW_DNaseI_HS/",cellLine,"_For_Paper_Analysis/Seq_Composition_Analysis/",sep="")
  if(biasedOrUnbiased == "biased"){
    coreFile = paste(path,"200_core_greater_than_", threshold,".txt",sep="")
    flankingFile = paste(path,"200_flanking_greater_than_", threshold,".txt",sep="")
    title        = paste(cellLine, "t>",threshold, sep = " ")
  }
  else if (biasedOrUnbiased == "unbiased"){
    coreFile = paste(path,"200_core_less_than_", threshold,".txt", sep="")
    flankingFile = paste(path,"200_flanking_less_than_", threshold,".txt", sep="")
    title        = paste(cellLine, "t<",threshold, sep = " ")
  }
  else{
    stop(paste("expecting biased or unbiased but got some thing unknown!"))
  }
  PLOT_COMPOSITION_GRAPHS_2(coreFile, flankingFile, title, 200, 100)
}#MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES#



PLOT_COMPOSITION_GRAPHS_2 <- function(coreDataFile, flankDataFile, Title, flank, core){
	coreDataAsTable  <- read.table(file = coreDataFile)
	flankDataAsTable <- read.table(file = flankDataFile)
	rightTail = flankDataAsTable$V2[1: flank]
	max_length = (2*flank)+core+100
	print(paste( "core is ",core, "max length is ", max_length), sep = "  ")
	Xlim = c(1,max_length)
	ymin = 0.0
	ymax  =1
	Ylim = c(ymin, ymax)
	Xlab = "sequence postion"
	Ylab = "average [g+c]"
	plot(rightTail,xlim = Xlim, ylim = Ylim, xlab = Xlab, ylab = Ylab, col = 'black', lwd = 2, type = 'l' , main = Title)
	core = coreDataAsTable$V2
	core_x = coreDataAsTable$V1
	lines(core_x, core, col = 'red', lwd =2)
	leftTail = flankDataAsTable$V2[(flank+1):length(flankDataAsTable$V2)]
	x_leftTail = flankDataAsTable$V1[(flank+1):length(flankDataAsTable$V1)]
	lines(x_leftTail, leftTail, col = 'black', lwd =2)
#	for(i in seq(0,1, by =0.1)){
#		
#		abline(h=i, lty = 2, col = colors()[6])
#		
#		}
	#points(core, col = 'red', lwd = 3)
	}#PLOT_COMPOSITION_GRAPHS_2#

###################################### UW #######################################

## K562
Core.UW.Less.Than.0 = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Seq_Composition_Analysis/200_core_less_than_0.txt"
Flanking.UW.Less.Than.0 = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Seq_Composition_Analysis/200_flanking_less_than_0.txt"
Title.UW.Less.Than.0   = "UW K562 t<0"

Core.UW.Greater.Than.0 = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Seq_Composition_Analysis/200_core_greater_than_0.txt"
Flanking.UW.Greater.Than.0 = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Seq_Composition_Analysis/200_flanking_greater_than_0.txt"
Title.UW.Greater.Than.0   = "UW K562 t>0"    

Core.UW.Less.Than.1 = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Seq_Composition_Analysis/200_core_less_than_1.txt"
Flanking.UW.Less.Than.1 = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Seq_Composition_Analysis/200_flanking_less_than_1.txt"
Title.UW.Less.Than.1   = "UW K562 t<1"

Core.UW.Greater.Than.1 = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Seq_Composition_Analysis/200_core_greater_than_1.txt"
Flanking.UW.Greater.Than.1 = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Seq_Composition_Analysis/200_flanking_greater_than_1.txt"
Title.UW.Greater.Than.1   = "UW K562 t>1"    


Core.UW.Less.Than.2 = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Seq_Composition_Analysis/200_core_less_than_2.txt"
Flanking.UW.Less.Than.2 = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Seq_Composition_Analysis/200_flanking_less_than_2.txt"
Title.UW.Less.Than.2   = "UW K562 t<2"

Core.UW.Greater.Than.2 = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Seq_Composition_Analysis/200_core_greater_than_2.txt"
Flanking.UW.Greater.Than.2 = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Seq_Composition_Analysis/200_flanking_greater_than_2.txt"
Title.UW.Greater.Than.2   = "UW K562 t>2"    

par(cex=2, lwd =1, col.axis='black', col.lab='black', col.main='black', col.sub='black', fg=200, cex.axis=1.1, mfrow=c(3,2))
PLOT_COMPOSITION_GRAPHS_2(Core.UW.Less.Than.0, Flanking.UW.Less.Than.0, Title.UW.Less.Than.0, 200, 100)
PLOT_COMPOSITION_GRAPHS_2(Core.UW.Greater.Than.0, Flanking.UW.Greater.Than.0, Title.UW.Greater.Than.0, 200, 100)
PLOT_COMPOSITION_GRAPHS_2(Core.UW.Less.Than.1, Flanking.UW.Less.Than.1, Title.UW.Less.Than.1, 200, 100)
PLOT_COMPOSITION_GRAPHS_2(Core.UW.Greater.Than.1, Flanking.UW.Greater.Than.1, Title.UW.Greater.Than.1, 200, 100)
PLOT_COMPOSITION_GRAPHS_2(Core.UW.Less.Than.2, Flanking.UW.Less.Than.2, Title.UW.Less.Than.2, 200, 100)
PLOT_COMPOSITION_GRAPHS_2(Core.UW.Greater.Than.2, Flanking.UW.Greater.Than.2, Title.UW.Greater.Than.2, 200, 100)

   ########################### gc shift
par(mfrow=c(2,1))
MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES("K562", -0.3, "unbiased")
abline(h=0.55, col='grey', lty=2, lwd = 2)
MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES("K562", 2, "biased")
abline(h=0.55, col='grey', lty=2, lwd = 2)



####################################### Gm12878
par(cex=2, lwd =1, col.axis='black', col.lab='black', col.main='black', col.sub='black', fg=200, cex.axis=1.1, mfrow=c(3,2),dev.new(width=8,height=8))
MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES("Gm12878", 0, "unbiased")
MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES("Gm12878", 0, "biased")
MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES("Gm12878", 1, "unbiased")
MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES("Gm12878", 1, "biased")
MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES("Gm12878", 2, "unbiased")
MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES("Gm12878", 2, "biased")

      ##### #gc shift:
par(mfrow=c(1,2))
MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES("Gm12878", -0.3, "unbiased")
abline(h=0.57, col='grey', lty=2, lwd = 2)
MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES("Gm12878", 1.6, "biased")
abline(h=0.57, col='grey', lty=2, lwd = 2)




############################################3# H1hesc 
par(cex=2, lwd =1, col.axis='black', col.lab='black', col.main='black', col.sub='black', fg=200, cex.axis=1.1, mfrow=c(3,2),dev.new(width=8,height=8))
MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES("H1hesc", 0, "unbiased")
MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES("H1hesc", 0, "biased")
MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES("H1hesc", 1, "unbiased")
MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES("H1hesc", 1, "biased")
MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES("H1hesc", 2, "unbiased")
MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES("H1hesc", 2, "biased")

      ##### #gc shift:
par(mfrow=c(2,1))
MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES("H1hesc", -0.5, "unbiased")
abline(h=0.6, col='grey', lty=2, lwd = 2)
MAKE.COMPOSITION.PLOTS.FOR.DIFF.CELL.LINES("H1hesc", 1.2, "biased")
abline(h=0.6, col='grey', lty=2, lwd = 2)



###################################### Duke ######################################

#Gm12878

Core.Duke.Gm12878<- "/nfs/th_group/hk3/Duke_DNaseI_HS/Gm12878_For_Paper_Analysis/Seq_Composition_Analysis/200bp_core_Gm12878_Duke.txt"
Flanking.Duke.Gm12878 <- "/nfs/th_group/hk3/Duke_DNaseI_HS/Gm12878_For_Paper_Analysis/Seq_Composition_Analysis/200_flanking_Gm12878_Duke.txt"
Title.Duke.Gm12878 <- "Duke Gm12878 DHS"
#PLOT_COMPOSITION_GRAPHS_2(Core.Duke.Gm12878, Flanking.Duke.Gm12878, Title.Duke.Gm12878, 200, 100)

#H1hesc
Core.Duke.H1hesc <- "/nfs/th_group/hk3/Duke_DNaseI_HS/H1hesc_For_Paper_Analysis/Seq_Composition_Analysis/200_core_Duke.txt"
Flanking.Duke.H1hesc <- "/nfs/th_group/hk3/Duke_DNaseI_HS/H1hesc_For_Paper_Analysis/Seq_Composition_Analysis/200_flanking_Duke.txt"
Title.Duke.H1hesc <- "Duke H1hesc DHS"
#PLOT_COMPOSITION_GRAPHS_2(Core.Duke.H1hesc, Flanking.Duke.H1hesc, Title.Duke.H1hesc, 200, 100)

# K562
Core.Duke.K562 <- "/nfs/th_group/hk3/Duke_DNaseI_HS/K562_For_Paper_Analysis/Seq_Composition_Analysis/200_core_Duke.txt"
Flanking.Duke.K562 <- "/nfs/th_group/hk3/Duke_DNaseI_HS/K562_For_Paper_Analysis/Seq_Composition_Analysis/200_flanking_Duke.txt"
Title.Duke.K562 <- "Duke K562 DHS"
#PLOT_COMPOSITION_GRAPHS_2(Core.Duke.K562, Flanking.Duke.K562, Title.Duke.K562, 200, 100)

par(cex=1, lwd =1, col.axis='black', col.lab='black', col.main='black', col.sub='black', fg=400, mfrow = c(1,3), cex.axis = 1.5, cex.lab=1.5)
PLOT_COMPOSITION_GRAPHS_2(Core.Duke.Gm12878, Flanking.Duke.Gm12878, Title.Duke.Gm12878, 200, 100)
PLOT_COMPOSITION_GRAPHS_2(Core.Duke.H1hesc, Flanking.Duke.H1hesc, Title.Duke.H1hesc, 200, 100)
PLOT_COMPOSITION_GRAPHS_2(Core.Duke.K562, Flanking.Duke.K562, Title.Duke.K562, 200, 100)

