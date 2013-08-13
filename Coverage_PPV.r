

plot.overlap.results <- function(dataFile, title = "  "){
data  <- read.table(file = dataFile)
thresholds <- data[ ,1]
DNaseI.bp  <- data[,2]
TFs.pb     <- data[,3]
overlaps   <- data[,4]
coverage    <- data[,5]
ppv        <- data[,6]
Mean       <- data[,7]


plot(thresholds[5:length(thresholds)], ppv[5:length(ppv)], type = 'l', col='red', ylim =c(0.15, 0.8), xlab='threshold', ylab='frequency', main=title)
lines(thresholds[5:length(thresholds)], coverage[5:length(coverage)], type = 'l', col='blue')
legend('topleft',legend= c("coverage", "ppv"), col= c("red", "blue"), text.col = c("red", "blue"), lty=c(1,2) )


  
}#plot.overlap.results #



plot.sen.spec <- function(washUni.dataFile,dukeUni.dataFile ,title = "  "){
data  <- read.table(file = washUni.dataFile)
thresholds <- data[ ,1]
DNaseI.bp  <- data[,2]
TFs.pb     <- data[,3]
overlaps   <- data[,4]
coverage    <- data[,5]
ppv        <- data[,6]
Mean       <- data[,7]


#pdf("Figures/Union_of_29Tfs_with_diff_Thresholds.pdf", height = 6, width = 12)
par(mfrow = c(1,2))

plot(thresholds[5:length(thresholds)], ( ppv[5:length(ppv)] + coverage[5:length(coverage)])/2, type = 'p', col='red', xlab='threshold', ylab='(coverage+ppv)/2', lwd =3, main = "UW")


#duke uni
data.duke  <- read.table(file = dukeUni.dataFile)
thresholds.duke  <- data.duke[ ,1]
DNaseI.bp.duke   <- data.duke[,2]
TFs.pb.duke      <- data.duke[,3]
overlaps.duke    <- data.duke[,4]
coverage.duke    <- data.duke[,5]
ppv.duke         <- data.duke[,6]
Mean.duke        <- data.duke[,7]

plot(thresholds[5:length(thresholds)], ( ppv.duke[5:length(ppv.duke)] + coverage.duke[5:length(coverage.duke)])/2 , col = 'blue', lwd = 3, xlab='threshold', ylab='(coverage+ppv)/2', main = "Duke", type = 'p')


#plot(thresholds[5:length(thresholds)], 2 * ( ppv[5:length(ppv)] *  coverage[5:length(coverage)]  )/( ppv[5:length(ppv)]+  coverage[5:length(coverage)]  ), lwd =3)
#dev.off()

#legend('topleft',legend= c("coverage", "ppv"), col= c("red", "blue"), text.col = c("red", "blue"), lty=c(1,2) )


  
}#plot.sen.spec #






plot.overlap.results.both.in.one.frame <- function(dataFileForWashUni, dataFileForDuke, title){
data  <- read.table(file = dataFileForWashUni)
thresholds <- data[ ,1]
DNaseI.bp  <- data[,2]
TFs.pb     <- data[,3]
overlaps   <- data[,4]
coverage    <- data[,5]
ppv        <- data[,6]
Mean       <- data[,7]







duke.data <- read.table(file = dataFileForDuke)
Duke.DanaseI  <- duke.data[ ,2]
Duke.TFs.pb   <- duke.data[ ,3]
Duke.Overlaps <- duke.data[ ,4]
Duke.Coverage <- duke.data[ ,5]
Duke.PPV      <- duke.data[ ,6]
Duke.Mean     <- duke.data[ ,7]

plot(thresholds[5:length(thresholds)], ppv[5:length(ppv)], type = 'l', col='red', ylim =c(0.15, 0.8), xlab='threshold', ylab='frequency', main=title, pch = 2, lty=2)
lines(thresholds[5:length(thresholds)], coverage[5:length(coverage)], type = 'l', col='blue', pch =3, lty=3)

#duke
lines(thresholds[5:length(thresholds)], Duke.PPV[5:length(Duke.PPV)], col = "orange", pch = 4, lty=4)
lines(thresholds[5:length(thresholds)], Duke.Coverage[5:length(Duke.Coverage)], col='green', pch=5, lty=5)


legend('topright',legend= c("UW:coverage", "UW:ppv", "Duke:coverage", "Duke:ppv"), col= c("red", "blue", "orange", "green"), text.col = c("red", "blue",  "orange", "green"), pch = c(2, 3, 4, 5) )


  
}#plot.overlap.results #


plot.overlap.results.both.in.one.frame("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/sensspec_10TFs_vs_UW_K562.txt","/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/sensspec_10TFs_vs_Duke_K562.txt" , "UW and Duke, 10TFs vs DNaseI")




###########



motif.scores.vs.read.depth <- function(scoresFile, readDepthsFile, title = " "){
	scores = scan(file = scoresFile)
	depths = scan(file = readDepthsFile)
	scores.at.nonN.positions = scores[scores>-1000]
	min.score =  floor(min(scores.at.nonN.positions))
	max.score = floor(max(scores.at.nonN.positions))+1
	score.bins = seq(min.score , max.score, by=0.5)
	average.of.depths = c()
	for(s in score.bins){
		print(s)
		scores.in.this.bin = scores[ s<scores & scores<= s+1]
		indices.of.scores.in.this.bin = which(  scores %in% scores.in.this.bin)
		depths.in.this.bin = depths[indices.of.scores.in.this.bin +5]# this 5 is because my PWM is -5 from starting a tag 
		average.of.depths.in.this.bin = mean(depths.in.this.bin)
		average.of.depths = c(average.of.depths, average.of.depths.in.this.bin )		  
		
	}
	
	
	X = score.bins[  score.bins > -3 & score.bins < 3]
	I  = which(score.bins %in% X)
	averages = average.of.depths[I]
	plot(score.bins[I], -log(averages), ylab="-log(prob of cut)", xlab= "score", main  = title, type='l', col= 'red')
	#plot(score.bins, average.of.depths, ylab="probability of cut", xlab= "score", main  = title, type='l', col= 'red', ylim= c(0, 0.05))
	result = list()
	result$bins = score.bins
	result$depths = averages
	result
}#motif.scores.vs.read.depth#






Gm12878.Real <-  motif.scores.vs.read.depth( "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseGm12878AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/read_depths_wgEncodeUwDnaseGm12878AlnRep1_chr22.txt", " ")
K562.Real <-  motif.scores.vs.read.depth( "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseK562AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/read_depths_wgEncodeUwDnaseK562AlnRep1_chr22.txt", " ")
H1hesc.Real <-  motif.scores.vs.read.depth( "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseH1hescAlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc_For_Paper_Analysis/read_depths_wgEncodeUwDnaseH1hescAlnRep1_chr22.txt", " ")

Hsmm.Real <- motif.scores.vs.read.depth( "/nfs/th_group/hk3/UW_DNaseI_HS/Hsmm_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseHsmmAlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Hsmm_For_Paper_Analysis/read_depths_wgEncodeUwDnaseHsmmAlnRep1_chr22.txt", " ")

Helas3.Real <- motif.scores.vs.read.depth( "/nfs/th_group/hk3/UW_DNaseI_HS/Helas3_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseHelas3AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Helas3_For_Paper_Analysis/read_depths_wgEncodeUwDnaseHelas3AlnRep1_chr22.txt", " ")

Gm12878.Random <-  motif.scores.vs.read.depth( "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseGm12878AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/read_depths_Gm12878_Random_chr22.txt", " ")

cell.Lines.Name = c("Gm12878", "K562", "H1hesc", "Hsmm", "Helas3", "Randomly_Generated_Tags")
cell.Lines.Data = list(Gm12878.Real, K562.Real, H1hesc.Real, Hsmm.Real, Helas3.Real, Gm12878.Random)

plot.All.CellLines.In.One.Plot <- function(list.Of.Data, vector.of.CellLines.Name){
  Col = c('red', 'blue', 'grey', 'yellow', 'orange', 'black')
  score.binse = list.Of.Data[[1]]$bins
  X = score.bins[  score.bins > -3 & score.bins < 3]
  I =  which(score.bins %in% X)
  averages =  list.Of.Data[[1]]$depths
  plot(score.bins[I], log(averages), ylab="log(prob of cut)", xlab= "score", main  = "Prob of cut vs motif scores in 5 cell lines from UW", type='l', col= Col[1], lwd = 3, lty = 1, ylim = c(-5.2,-3.3))
  for(v in 2:length(list.Of.Data) ){
   
    score.binse = list.Of.Data[[v]]$bins
     X = score.bins[  score.bins > -3 & score.bins < 3]
     averages =  list.Of.Data[[v]]$depths
    I =  which(score.bins %in% X)
    lines(score.bins[I], log(averages), col= Col[v], lty= v, lwd =3 )
  }
  legend('topleft', legend = cell.Lines.Name,, col = Col, lty = seq(1:5), lwd = 3)
}



write.chromosomal.positons.into.a.bed.file <- function(positions, outputFile){
  positions = sort(positions)
  text = c()
  for (p in positions){
    strand = "+"
    s = sample(0:1, 1, TRUE)
    if(s == 0){
      strand = "-" 
    }
    one.line = paste("chr22", p, p+36, "u_random", "25", strand,sep="\t")
    text = c(text, one.line)
    #writeLines(one.line, fileConnection)
    
  }
  fileConnection <- file(outputFile)
  writeLines(text, fileConnection)
  close(fileConnection)
}
