Gm12878.Union.Of.Common.Peaks = "/nfs/th_group/hk3/SYD_TFS/Gm12878/Gm12878_Common_With_K562_and_Helas3/Chr22/Chr22_Sorted/GM12878_union_of_peaks.bed"
K562.Union.Of.Common.Peaks    = "/nfs/th_group/hk3/SYD_TFS/K562/K562_Common_With_Gm12878_and_Helas3/Chr22/Chr22_Sorted/K562_union_of_peaks.bed"
HelaS3.Union.Of.Common.Peaks  = "/nfs/th_group/hk3/SYD_TFS/HelaS3/HelaS3_common_With_K562_and_GM12878/Chr22/Chr22_Sorted/HelaS3_union_of_peaks.bed"


get.summary.statistics <- function(fileOfPeaks){
  data    = read.table(fileOfPeaks)
  starts  = data[ ,2]
  ends    = data[ ,3]
  lengths = ends - starts
  print(paste("Number of peaks = ", length(lengths)))
  print(summary(lengths))
  hist(lengths, xlab='lengths', breaks=50, main='distribution of lengths' )
  lengths
}#get.summary.statistics#


get.nct.freqs <- function(nctsFile){
  data = read.table(nctsFile, header = TRUE)
  data
}#get.nct.freqs#


K562.Freq.of.Ncts.File    = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/K562_Freq_of_ncts_in_ENCODE_DHS.txt"
GM12878.Freq.of.Ncts.File = "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/Gm12878_Freq_of_ncts_in_ENCODE_DHS.txt"
H1hESC.Freq.of.Ncts.File  = "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc_For_Paper_Analysis/H1hesc_Freq_of_ncts_in_ENCODE_DHS.txt"
HelaS3.Freq.of.Ncts.File  = "/nfs/th_group/hk3/UW_DNaseI_HS/Helas3_For_Paper_Analysis/Helas3_Freq_of_ncts_in_ENCODE_DHS.txt"
HSMM.Freq.of.Ncts.File    = "/nfs/th_group/hk3/UW_DNaseI_HS/Hsmm_For_Paper_Analysis/Hsmm_Freq_of_ncts_in_ENCODE_DHS.txt"
  


UW.Thresholds = seq(-2, 5, by=0.5)

UW.K562.NUMBER.OF.TAGS.REMOVED  = c(411596, 395537, 372573, 341267, 304983,  262954, 214910, 161857, 108653, 61845, 26905,  7147, 630, 1, 0)
UW.K562.NUMBER.OF.TAGS.REMOVED  = (UW.K562.NUMBER.OF.TAGS.REMOVED/434278)*100




UW.GM12878.NUMBER.OF.TAGS.REMOVED = c(405658, 389037, 363457, 328897, 286100, 238182, 185601, 130696, 79964, 40484, 15249, 3542, 346, 5, 0)
UW.GM12878.NUMBER.OF.TAGS.REMOVED = (UW.GM12878.NUMBER.OF.TAGS.REMOVED/426765)*100


UK.HelaS3.NUMBER.OF.TAGS.REMOVED  = c(241250, 232687, 220958, 205004, 185713, 162930, 136753, 107597, 78034, 49949, 27340, 12161, 3873,  598, 16)
UK.HelaS3.NUMBER.OF.TAGS.REMOVED  = (UK.HelaS3.NUMBER.OF.TAGS.REMOVED/255486)*100




library(plotrix)
plot.precision.vs.recall.and.percentage.of.removed.tags(K562.UW.vs.TFs.File, Title = "UW-K562", beta = 0.5, Start.Thr=5, UW.K562.NUMBER.OF.TAGS.REMOVED)
plot.precision.vs.recall.and.percentage.of.removed.tags(GM12878.UW.vs.TFs.File, Title = "UW-GM12878", beta = 0.5, Start.Thr=2, UW.GM12878.NUMBER.OF.TAGS.REMOVED)
plot.precision.vs.recall.and.percentage.of.removed.tags(HelaS3.UW.vs.TFs.File, Title = "UW-HelaS3", beta = 0.5, Start.Thr=5, UK.HelaS3.NUMBER.OF.TAGS.REMOVED)








plot.precision.vs.recall.and.percentage.of.removed.tags <- function(fileContainingOverlapsInformation, Title = " ", beta = 0.5, Start.Thr=1, percentage.of.Removed.tags){
  Data = read.table(fileContainingOverlapsInformation)
  Precision = Data[ ,5 ]
  Recall    = Data[ ,6]
  Thresholds = Data[ ,1]
 


  

  Ylab = paste("F_",beta,"_Score", sep="")
  cofficent   = (1+(beta)^2)

  

  Overlap     = cofficent *  (Precision * Recall) /(((beta)^2 *  Precision) +  Recall)

  Thresholds  = Thresholds[Start.Thr:length(Thresholds)]
  Last.Thr   = Thresholds[length(Thresholds)]
  #print( Last.Thr)
  Overlap    = Overlap[Start.Thr:length(Overlap)]


  
  Number.of.Thrs = length(Thresholds)
  RightEnd = length(percentage.of.Removed.tags)- Number.of.Thrs +1
  
  Removed.Tags  = percentage.of.Removed.tags[RightEnd:length(percentage.of.Removed.tags)]
  
  
  twoord.plot(Thresholds, Overlap, seq(0, Last.Thr, by=0.5),  Removed.Tags, xlab= 'Thresholds', ylab="F_0.5 scores", rylab='Percentage of tags removed', main = Title, lwd=3, lcol='blue', rcol='red')
  
}#plot.precision.vs.recall.and.percentage.of.removed.tags#


#twoord.plot(2:10,TEST,   1:15,rev(60:74)+rnorm(15),xlab="Sequence",ylab="Ascending values",rylab="Descending values",main="Plot with two ordinates - points and lines")
