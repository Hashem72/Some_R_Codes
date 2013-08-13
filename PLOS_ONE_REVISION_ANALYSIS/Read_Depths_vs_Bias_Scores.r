
motif.scores.vs.read.depth <- function(scoresFile, readDepthsFile, title = " "){
	scores = scan(file = scoresFile)
	depths = scan(file = readDepthsFile)
	scores.at.nonN.positions = scores[scores>-1000]
	min.score =  floor(min(scores.at.nonN.positions))
	max.score = floor(max(scores.at.nonN.positions))+1
	score.bins = seq(min.score , max.score, by=0.5)
	average.of.depths = c()
         L =length(score.bins)
	for(s in 1:(L-1)){
		print(score.bins[s])
		scores.in.this.bin = scores[ score.bins[s] <scores & scores<= score.bins[s+1]    ]
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




variance.motif.scores.vs.read.depth <- function(scoresFile, readDepthsFile, title = " "){
	scores = scan(file = scoresFile)
	depths = scan(file = readDepthsFile)
	scores.at.nonN.positions = scores[scores>-1000]
	min.score =  floor(min(scores.at.nonN.positions))
	max.score = floor(max(scores.at.nonN.positions))+1
	score.bins = seq(min.score , max.score, by=0.5)
	variance.of.depths = c()
         L =length(score.bins)
	#for(s in score.bins){
        for(s in 1:(L-1)){
		print(score.bins[s])
		scores.in.this.bin = scores[ score.bins[s] <scores & scores<= score.bins[s+1]    ]
		indices.of.scores.in.this.bin = which(  scores %in% scores.in.this.bin)
		depths.in.this.bin = depths[indices.of.scores.in.this.bin +5]# this 5 is because my PWM is -5 from starting a tag 
		variance.of.depths.in.this.bin = sd(depths.in.this.bin)
		variance.of.depths = c(variance.of.depths, variance.of.depths.in.this.bin )		  
		
	}
	
	
	X = score.bins[  score.bins > -3 & score.bins < 3]
	I  = which(score.bins %in% X)
	variances = variance.of.depths[I]
	plot(score.bins[I], variances  , ylab="variance of depth at each bin", xlab= "score", main  = title, type='l', col= 'red')
	#plot(score.bins, average.of.depths, ylab="probability of cut", xlab= "score", main  = title, type='l', col= 'red', ylim= c(0, 0.05))
	result = list()
	result$bins = score.bins
	result$depths = variances
	result
}#variance.motif.scores.vs.read.depth#



plot.All.CellLines.In.One.Plot <- function(list.Of.Data, vector.of.CellLines.Name){
  Col = c('red', 'blue', 'grey', 'green', 'orange', 'black')
  score.bins = list.Of.Data[[1]]$bins
  X = score.bins[  score.bins > -3 & score.bins < 3]
  I =  which(score.bins %in% X)
  averages =  list.Of.Data[[1]]$depths
  plot(score.bins[I], log(averages), ylab="log(avarage of read depths at each bin)", xlab= "score", main  = "Motif scores vs read depths", pch=1, col= Col[1], lwd = 2, lty = 2, ylim = c(-5.2,-3.3), type='b')
  for(v in 2:length(list.Of.Data) ){
   
    score.binse = list.Of.Data[[v]]$bins
     X = score.bins[  score.bins > -3 & score.bins < 3]
     averages =  list.Of.Data[[v]]$depths
    I =  which(score.bins %in% X)
    lines(score.bins[I], log(averages), col= Col[v], lty= 2, lwd =2 , pch=v, type='b')
  }
  legend('topleft', legend = cell.Lines.Name,, col = Col, lty = 2, lwd = 2, pch= seq(1:6), text.col = Col)
}#plot.All.CellLines.In.One.Plot#



Sd.plot.All.CellLines.In.One.Plot <- function(list.Of.Sd.Data, vector.of.CellLines.Name){
  Col = c('red', 'blue', 'brown', 'green', 'orange', 'black')
  score.bins = list.Of.Sd.Data[[1]]$bins
  X = score.bins[  score.bins > -3 & score.bins < 3]
  I =  which(score.bins %in% X)
  variances =  list.Of.Sd.Data[[1]]$depths
  plot(score.bins[I], log(variances), ylab="standard deviation  of read depths at each bin", xlab= "score", main  = "  ", pch=1, col= Col[1], lwd = 2, lty = 2, type='b', ylim=c(-6, 0))
  for(v in 2:length(list.Of.Sd.Data) ){
   
    score.binse = list.Of.Sd.Data[[v]]$bins
     X = score.bins[  score.bins > -3 & score.bins < 3]
     variances  =  list.Of.Sd.Data[[v]]$depths
    I =  which(score.bins %in% X)
    lines(score.bins[I], log(variances), col= Col[v], lty= 2, lwd =2 , pch=v, type='b')
  }
  legend('topleft', legend = cell.Lines.Name,, col = Col, lty = 2, lwd = 2, pch= seq(1:6), text.col = Col)
}#Sd. plot.All.CellLines.In.One.Plot#



plot.Mean.And.Sd <- function(list.Mean.Data, list.Sd.Data, vector.of.CellLines.Name){
    Col = c('red', 'blue', 'blueviolet', 'green', 'orange', 'black')
  score.bins = list.Mean.Data[[1]]$bins
  X = score.bins[  score.bins > -2 & score.bins < 4]
  I =  which(score.bins %in% X)
  Mean =  list.Mean.Data[[1]]$depths
  LMean  = log(Mean)
  SD     = list.Sd.Data[[1]]$depths
  LSD    = log(SD)
  SCORES = score.bins[I]
  plot(SCORES, LMean, ylab="log(mean and sd of read depths at each bin)", xlab= "score", main  = "Motif scores vs read depths  ", pch=1, col= Col[1], lwd = 2, lty ='dashed', type='b', ylim=c(-7.2, -2.2))
    
  epsilon = 0.02  
for(i in 1:length(SCORES)){
  up =  LMean[i]+LSD[i]
  low = LMean[i]-LSD[i]
  #print(paste("i = ", i, SCORES[i], " up = ", up, " low= ", low, sep = " " ))
  segments(SCORES[i], low, SCORES[i], up, col= Col[1])
  segments(SCORES[i]-epsilon, up, SCORES[i]+epsilon, up, col=Col[1] )
  segments(SCORES[i]-epsilon, low, SCORES[i]+epsilon, low, col=Col[1] )
}

    for(v in 2:length(list.Mean.Data) ){
      score.binse = list.Mean.Data[[v]]$bins
      X = score.bins[  score.bins > -2 & score.bins < 4]
      Mean =  list.Mean.Data[[v]]$depths
      LMean = log(Mean)
      SD     = list.Sd.Data[[v]]$depths
      LSD    = log(SD)
      I =  which(score.bins %in% X)
      SCORES = score.bins[I]
      lines(SCORES, LMean, col= Col[v], lty= 'dashed', lwd =2 , pch=v, type='b')
      for(i in 1:length(SCORES)){
        up =  LMean[i]+LSD[i]
        low = LMean[i]-LSD[i]
                                        #print(paste("i = ", i, SCORES[i], " up = ", up, " low= ", low, sep = " " ))
        segments(SCORES[i], low, SCORES[i], up, col= Col[v])
        segments(SCORES[i]-epsilon, up, SCORES[i]+epsilon, up, col=Col[v] )
        segments(SCORES[i]-epsilon, low, SCORES[i]+epsilon, low, col=Col[v] )
      }
      
      
    }
    
    legend('bottomright', legend = cell.Lines.Name,, col = Col, lty = 2, lwd = 2, pch= seq(1:6), text.col = Col)
}#plot.Mean.And.Sd#


plot.Mean.Sd.For.Each.Cell.Line <- function(mean.Data, Sd.Data){
  score.bins  = mean.Data$bins
  X           = score.bins[  score.bins > -2 & score.bins < 4]
  I           =  which(score.bins %in% X)
  Mean        =  mean.Data$depths
  LMean       = log(Mean)
  SD          = Sd.Data$depths
  LSD         = log(SD)
  SCORES      = score.bins[I]
  plot(SCORES, Mean, ylab="read depths", xlab= "score", main  = "Motif scores vs read depths  ", pch=1, col= 'red', lwd = 2, lty ='dashed', type='b', ylim= c(0.005, 0.035))
   #stop("jobe done! ") 
  epsilon = 0.02  
for(i in 1:length(SCORES)){
  up =  Mean[i]+SD[i]
  low = Mean[i]-SD[i]
  #print(paste("i = ", i, SCORES[i], " up = ", up, " low= ", low, sep = " " ))
  segments(SCORES[i], low, SCORES[i], up, col= 'red')
  segments(SCORES[i]-epsilon, up, SCORES[i]+epsilon, up, col='red' )
  segments(SCORES[i]-epsilon, low, SCORES[i]+epsilon, low, col='red' )
}

}#plot.Mean.Sd.For.Each.Cell.Line#



st.Error <- function(x){
  std = sd(x)/sqrt(length(x))
  std
}#st.Error#


#
# #Sd.plot.All.CellLines.In.One.Plot <- function(list.Of.Sd.Data, vector.of.CellLines.Name){
#  Col = c('red', 'blue', 'grey', 'green', 'orange', 'black')
#  score.bins = list.Of.Sd.Data[[1]]$bins
#  X = score.bins[  score.bins > -3 & score.bins < 3]
#  I =  which(score.bins %in% X)
#  variances =  list.Of.Sd.Data[[1]]$depths
#  plot(score.bins[I], variances, ylab="standard deviation  of read depths at each bin", xlab= "score", main  = "  ", pch=1, col= Col[1], lwd = 2, lty = 2, ylim = c(.1,0.5), type='b')
#  for(v in 2:length(list.Of.Sd.Data) ){
   
#    score.binse = list.Of.Sd.Data[[v]]$bins
#     X = score.bins[  score.bins > -3 & score.bins < 3]
#     variances  =  list.Of.Sd.Data[[v]]$depths
#    I =  which(score.bins %in% X)
#    lines(score.bins[I], variances, col= Col[v], lty= 2, lwd =2 , pch=v, type='b')
#  }
#  legend('topleft', legend = cell.Lines.Name,, col = Col, lty = 2, lwd = 2, pch= seq(1:6), text.col = Col)
#}#Sd. plot.All.CellLines.In.One.Plot#





################################################################################################################


######## average of read depths at various score bins for each cell line

Gm12878.Real <-  motif.scores.vs.read.depth( "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseGm12878AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/read_depths_wgEncodeUwDnaseGm12878AlnRep1_chr22.txt", " ")
K562.Real <-  motif.scores.vs.read.depth( "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseK562AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/read_depths_wgEncodeUwDnaseK562AlnRep1_chr22.txt", " ")
H1hesc.Real <-  motif.scores.vs.read.depth( "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseH1hescAlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc_For_Paper_Analysis/read_depths_wgEncodeUwDnaseH1hescAlnRep1_chr22.txt", " ")

Hsmm.Real <- motif.scores.vs.read.depth( "/nfs/th_group/hk3/UW_DNaseI_HS/Hsmm_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseHsmmAlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Hsmm_For_Paper_Analysis/read_depths_wgEncodeUwDnaseHsmmAlnRep1_chr22.txt", " ")

Helas3.Real <- motif.scores.vs.read.depth( "/nfs/th_group/hk3/UW_DNaseI_HS/Helas3_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseHelas3AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Helas3_For_Paper_Analysis/read_depths_wgEncodeUwDnaseHelas3AlnRep1_chr22.txt", " ")

Gm12878.Random <-  motif.scores.vs.read.depth( "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseGm12878AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/read_depths_Gm12878_Random_chr22.txt", " ")

cell.Lines.Name = c("GM12878", "K562", "H1-hESC", "HSMM", "HelaS3", "Randomly Generated Tags")
cell.Lines.Data = list(Gm12878.Real, K562.Real, H1hesc.Real, Hsmm.Real, Helas3.Real, Gm12878.Random)


pdf(file="/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/PLOS_ONE_REVISION/Motif_Scores_vs_Read_Depths.pdf", height= 6, width=6)
plot.All.CellLines.In.One.Plot(cell.Lines.Data , cell.Lines.Name )
dev.off()



########## sd of read depths at various bins for each cell line:


Sd.Gm12878.Real = variance.motif.scores.vs.read.depth( "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseGm12878AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/read_depths_wgEncodeUwDnaseGm12878AlnRep1_chr22.txt", " ")


Sd.K562.Real <-  variance.motif.scores.vs.read.depth( "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseK562AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/read_depths_wgEncodeUwDnaseK562AlnRep1_chr22.txt", " ")
Sd.H1hesc.Real <-  variance.motif.scores.vs.read.depth( "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseH1hescAlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc_For_Paper_Analysis/read_depths_wgEncodeUwDnaseH1hescAlnRep1_chr22.txt", " ")

Sd.Hsmm.Real <- variance.motif.scores.vs.read.depth( "/nfs/th_group/hk3/UW_DNaseI_HS/Hsmm_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseHsmmAlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Hsmm_For_Paper_Analysis/read_depths_wgEncodeUwDnaseHsmmAlnRep1_chr22.txt", " ")

Sd.Helas3.Real <- variance.motif.scores.vs.read.depth( "/nfs/th_group/hk3/UW_DNaseI_HS/Helas3_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseHelas3AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Helas3_For_Paper_Analysis/read_depths_wgEncodeUwDnaseHelas3AlnRep1_chr22.txt", " ")

Sd.Gm12878.Random <-  variance.motif.scores.vs.read.depth( "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseGm12878AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/read_depths_Gm12878_Random_chr22.txt", " ")

Sd.cell.Lines.Data = list(Sd.Gm12878.Real, Sd.K562.Real, Sd.H1hesc.Real, Sd.Hsmm.Real, Sd.Helas3.Real, Sd.Gm12878.Random)
pdf(file = "/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/PLOS_ONE_REVISION/SD_Motif_Scores_vs_Read_Depths.pdf", height= 6, width=6)
Sd.plot.All.CellLines.In.One.Plot(Sd.cell.Lines.Data, cell.Lines.Name)
dev.off()


pdf(file = "/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/PLOS_ONE_REVISION/Mean_and_Sd_Motif_Scores_vs_Read_Depths.pdf", height=8,width=14 )
plot.Mean.And.Sd(cell.Lines.Data, Sd.cell.Lines.Data, cell.Lines.Name)
dev.off()






#######################################        standard error vs read depths
standard.error.of.motif.scores.vs.read.depth <- function(scoresFile, readDepthsFile, title = " "){
	scores = scan(file = scoresFile)
	depths = scan(file = readDepthsFile)
	scores.at.nonN.positions = scores[scores>-1000]
	min.score =  floor(min(scores.at.nonN.positions))
	max.score = floor(max(scores.at.nonN.positions))+1
	score.bins = seq(min.score , max.score, by=0.5)
	sandard.error.of.depths = c()
         L =length(score.bins)
	#for(s in score.bins){
        for(s in 1:(L-1)){
		print(score.bins[s])
		scores.in.this.bin = scores[ score.bins[s] <scores & scores<= score.bins[s+1]    ]
		indices.of.scores.in.this.bin = which(  scores %in% scores.in.this.bin)
		depths.in.this.bin = depths[indices.of.scores.in.this.bin +5]# this 5 is because my PWM is -5 from starting a tag
                sandard.error.of.depths.in.this.bin = st.Error(depths.in.this.bin)
		sandard.error.of.depths = c(sandard.error.of.depths, sandard.error.of.depths.in.this.bin)		  
		
	}
	
	
	X = score.bins[  score.bins > -3 & score.bins < 3]
	I  = which(score.bins %in% X)
	std = sandard.error.of.depths[I]
	plot(score.bins[I], std  , ylab="standard error of depth at each bin", xlab= "score", main  = title, type='l', col= 'red')
	#plot(score.bins, average.of.depths, ylab="probability of cut", xlab= "score", main  = title, type='l', col= 'red', ylim= c(0, 0.05))
	result = list()
	result$bins = score.bins
	result$depths = std
	result
}#standard.error.of.motif.scores.vs.read.depth#



Std.Gm12878.Real= standard.error.of.motif.scores.vs.read.depth("/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseGm12878AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/read_depths_wgEncodeUwDnaseGm12878AlnRep1_chr22.txt", " ")

Std.K562.Real       = standard.error.of.motif.scores.vs.read.depth("/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseK562AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/read_depths_wgEncodeUwDnaseK562AlnRep1_chr22.txt", " ")
Std.H1hesc.Real     = standard.error.of.motif.scores.vs.read.depth( "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseH1hescAlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc_For_Paper_Analysis/read_depths_wgEncodeUwDnaseH1hescAlnRep1_chr22.txt", " ")
Std.Hsmm.Real       = standard.error.of.motif.scores.vs.read.depth("/nfs/th_group/hk3/UW_DNaseI_HS/Hsmm_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseHsmmAlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Hsmm_For_Paper_Analysis/read_depths_wgEncodeUwDnaseHsmmAlnRep1_chr22.txt", " ")
Std.Helas3.Real     = standard.error.of.motif.scores.vs.read.depth("/nfs/th_group/hk3/UW_DNaseI_HS/Helas3_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseHelas3AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Helas3_For_Paper_Analysis/read_depths_wgEncodeUwDnaseHelas3AlnRep1_chr22.txt", " ")
Std.Gm12878.Random  = standard.error.of.motif.scores.vs.read.depth("/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseGm12878AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/read_depths_Gm12878_Random_chr22.txt", " ")

Std.Cell.Lines.Data = list(Std.Gm12878.Real, Std.K562.Real, Std.H1hesc.Real, Std.Hsmm.Real, Std.Helas3.Real, Std.Gm12878.Random)
Sd.plot.All.CellLines.In.One.Plot(Std.Cell.Lines.Data, cell.Lines.Name)
plot.Mean.And.Sd(cell.Lines.Data, Std.Cell.Lines.Data, cell.Lines.Name)
plot.Mean.And.Sd.V2(cell.Lines.Data, Std.Cell.Lines.Data, cell.Lines.Name)


plot.Mean.And.Sd.V2 <- function(list.Mean.Data, list.Sd.Data, vector.of.CellLines.Name){
  Col = c('red', 'blue', 'blueviolet', 'green', 'orange', 'black')
  score.bins = list.Mean.Data[[1]]$bins
  X = score.bins[  score.bins > -2 & score.bins < 4]
  I =  which(score.bins %in% X)
  Mean =  list.Mean.Data[[1]]$depths
  #LMean  = log(Mean)
  SD     = list.Sd.Data[[1]]$depths
  #LSD    = log(SD)
  SCORES = score.bins[I]
                                        #plot(SCORES, LMean, ylab="log(mean and sd of read depths at each bin)", xlab= "score", main  = "Motif scores vs read depths  ", pch=1, col= Col[1], lwd = 2, lty ='dashed', type='b', ylim=c(-7.2, -2.2))
  plot(SCORES, LMean, ylab="mean of read depths in each bin", xlab= "score", main  = "Motif scores vs read depths  ", pch=1, col= Col[1], lwd = 2, lty ='dashed', type='b', ylim= c(0.005, 0.035))
  epsilon = 0.02  
  for(i in 1:length(SCORES)){
    up =  Mean[i]+SD[i]
    low = Mean[i]-SD[i]
                                        #print(paste("i = ", i, SCORES[i], " up = ", up, " low= ", low, sep = " " ))
    segments(SCORES[i], low, SCORES[i], up, col= Col[1], lwd=3)
    segments(SCORES[i]-epsilon, up, SCORES[i]+epsilon, up, col=Col[1], lwd=3 )
    segments(SCORES[i]-epsilon, low, SCORES[i]+epsilon, low, col=Col[1], lwd =3 )
  }

  for(v in 2:length(list.Mean.Data) ){   
    score.binse = list.Mean.Data[[v]]$bins
    X = score.bins[  score.bins > -2 & score.bins < 4]
    Mean =  list.Mean.Data[[v]]$depths
    SD     = list.Sd.Data[[v]]$depths
    I =  which(score.bins %in% X)
    SCORES = score.bins[I]
   # lines(SCORES, Mean, col= Col[v], lty= 'dashed', lwd =2 , pch=v, type='b')
    for(i in 1:length(SCORES)){
      up =  Mean[i]+SD[i]
      low = Mean[i]-SD[i]
                                        #print(paste("i = ", i, SCORES[i], " up = ", up, " low= ", low, sep = " " ))
      segments(SCORES[i], low, SCORES[i], up, col= Col[v], lwd =3)
      segments(SCORES[i]-epsilon, up, SCORES[i]+epsilon, up, col=Col[v], lwd=3 )
      segments(SCORES[i]-epsilon, low, SCORES[i]+epsilon, low, col=Col[v], lwd =3 )
    }
    
      
  }
  
  legend('topleft', legend = cell.Lines.Name,, col = Col,  lwd = 2,  text.col = Col)                                      # legend('bottomright', legend = cell.Lines.Name,, col = Col, lty = 2, lwd = 2, pch= seq(1:6), text.col = Col)
}#plot.Mean.And.Sd.V2#


pdf(file = "/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/PLOS_ONE_REVISION/Mean_and_Std_Motif_Scores_vs_Read_Depths.pdf", height=10,width=10 )

plot.Mean.And.Sd.V2(cell.Lines.Data, Std.Cell.Lines.Data, cell.Lines.Name)
dev.off()
