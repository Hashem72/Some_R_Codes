Mean = cell.Lines.Data[[1]]$depths
LMean = log(Mean)
SD   = Sd.cell.Lines.Data[[1]]$depths
LSD = log(SD)
BINS  = cell.Lines.Data[[1]]$bins
X = BINS[  BINS > -3 & BINS < 3]
I =  which(BINS %in% X)
SCORES = BINS[I]


plot(SCORES, LMean, type= 'b', col='red',pch=3, ylim =c(-7, -2) )
epsilon = 0.02
for(i in 1:length(SCORES)){
  up =  LMean[i]+LSD[i]
  low = LMean[i]-LSD[i]
  print(paste("i = ", i, SCORES[i], " up = ", up, " low= ", low, sep = " " ))
  segments(SCORES[i], low, SCORES[i], up, col= 'red')
  segments(SCORES[i]-epsilon, up, SCORES[i]+epsilon, up, col='red' )
  segments(SCORES[i]-epsilon, low, SCORES[i]+epsilon, low, col='red' )
}


get.mean.read.depths.at.each.bin <- function(scoresFile, readDepthsFile, title = " "){
	scores = scan(file = scoresFile)
	depths = scan(file = readDepthsFile)
	scores.at.nonN.positions = scores[scores>-1000]
	min.score =  floor(min(scores.at.nonN.positions))
	max.score = floor(max(scores.at.nonN.positions))+1
	score.bins = seq(min.score , max.score, by=0.5)
        L =length(score.bins)
	average.of.depths = c()
	for(s in 1:(L-1) ){
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
}#get.mean.read.depths.at.each.bin#


get.read.depths.over.bins <- function(scoresFile, readDepthsFile, title = " "){
  	scores = scan(file = scoresFile)
	depths = scan(file = readDepthsFile)
	scores.at.nonN.positions = scores[scores>-1000]
	min.score =  floor(min(scores.at.nonN.positions))
	max.score = floor(max(scores.at.nonN.positions))+1
	score.bins = seq(min.score , max.score, by=0.5)
        L =length(score.bins)
        read.depths   = list()
	#average.of.depths = c()
	for(s in 1:(L-1) ){
		print(score.bins[s])
		scores.in.this.bin = scores[ score.bins[s] <scores & scores<= score.bins[s+1]    ]
		indices.of.scores.in.this.bin = which(  scores %in% scores.in.this.bin)
		depths.in.this.bin = depths[indices.of.scores.in.this.bin +5]# this 5 is because my PWM is -5 from starting a tag
                read.depths[[s]]    = depths.in.this.bin 
		#average.of.depths.in.this.bin = mean(depths.in.this.bin)
		#average.of.depths = c(average.of.depths, average.of.depths.in.this.bin )		  
		
	}
	
	
#	X = score.bins[  score.bins > -3 & score.bins < 3]
#	I  = which(score.bins %in% X)
#	averages = average.of.depths[I]
#	plot(score.bins[I], -log(averages), ylab="-log(prob of cut)", xlab= "score", main  = title, type='l', col= 'red')
	#plot(score.bins, average.of.depths, ylab="probability of cut", xlab= "score", main  = title, type='l', col= 'red', ylim= c(0, 0.05))
#	result = list()
#	result$bins = score.bins
#	result$depths = averages
#	result
 read.depths
}#get.read.depths.over.bins#



GM12878 = get.read.depths.over.bins("/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseGm12878AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/read_depths_wgEncodeUwDnaseGm12878AlnRep1_chr22.txt", " GM12878")
K562 = get.read.depths.over.bins("/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseK562AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/read_depths_wgEncodeUwDnaseK562AlnRep1_chr22.txt", " K562")
H1hESC = get.read.depths.over.bins("/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseH1hescAlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc_For_Paper_Analysis/read_depths_wgEncodeUwDnaseH1hescAlnRep1_chr22.txt", " ")

HSMM =  get.read.depths.over.bins( "/nfs/th_group/hk3/UW_DNaseI_HS/Hsmm_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseHsmmAlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Hsmm_For_Paper_Analysis/read_depths_wgEncodeUwDnaseHsmmAlnRep1_chr22.txt", " ")
HelaS3 = get.read.depths.over.bins("/nfs/th_group/hk3/UW_DNaseI_HS/Helas3_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseHelas3AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Helas3_For_Paper_Analysis/read_depths_wgEncodeUwDnaseHelas3AlnRep1_chr22.txt", " ")
Random = get.read.depths.over.bins("/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/motif_socres_wgEncodeUwDnaseGm12878AlnRep1_chr22_s5_l15.txt", "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/read_depths_Gm12878_Random_chr22.txt", " ")

for(i in 1:length(GM12878)){print( paste( "i= ", i, "min =", min(GM12878[[i]]), "max=", max(GM12878[[i]]), "mean =", mean(GM12878[[i]]), "sd = ", sd(GM12878[[i]]), "Number_of_bps = ", length(GM12878[[i]]), "std = ", st.Error(GM12878[[i]]), " Lstd = ", log(st.Error(GM12878[[i]]))  ,  "Lsd = ", log(sd(GM12878[[i]])), sep=" "   )  )}


for(i in 1:length(Random)){print( paste( "i= ", i, "min =", min(Random[[i]]), "max=", max(Random[[i]]), "mean =", mean(Random[[i]]), "sd = ", sd(Random[[i]]),  "Number_of_bps = ", length(Random[[i]]),  sep=" "   ) )}


st.Error <- function(x){
  std = sd(x)/sqrt(length(x))
  std
}#st.Error#


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


plot.testing <- function(mean.Data, Sd.Data){
  score.bins  = mean.Data$bins
  X           = score.bins[  score.bins > -2 & score.bins < 4]
  I           =  which(score.bins %in% X)
  Mean        =  mean.Data$depths
  LMean       = log(Mean)
  SD          = Sd.Data$depths
  LSD         = log(SD)
  SCORES      = score.bins[I]
  plot(SCORES, LMean, ylab="log(mean of read depths)", xlab= "score", main  = "Motif scores vs read depths  ", pch=1, col= 'red', lwd = 2, lty ='dashed', type='b', ylim=c(-16,6))
   
  epsilon = 0.02  
for(i in 1:length(SCORES)){
  up =  LMean[i]+LSD[i]
  low = LMean[i]-LSD[i]
  
  #print(paste("i = ", i, SCORES[i], " up = ", up, " low= ", low, sep = " " ))
  segments(SCORES[i], low, SCORES[i], up, col= 'red')
  segments(SCORES[i]-epsilon, up, SCORES[i]+epsilon, up, col='red' )
  segments(SCORES[i]-epsilon, low, SCORES[i]+epsilon, low, col='red' )
}

}#plot.Mean.Sd.For.Each.Cell.Line#

