#Note: for this code you need to use R-2.14.1 from /software/bin

library(plyr)
library(ggplot2)
library(reshape2)



getFreqMatrix <- function(dataFile){
  #reed a CSV file and return it as 4 by positions matrix where rows are a, c, g, and t

  freqTable     <- read.table(dataFile, sep = ",")
  tranFreqTable <- t(freqTable)
  sumsOverCols  <-  colSums(tranFreqTable)
  probMatrix    <-  tranFreqTable / sumsOverCols
  probMatrix
}#getFreqMatrix#


getLogoFromPWM <- function(pwm){
  #melt matrix to dataframe
  df <- melt(pwm, varnames = c("nt", "pos"))
  p <- ggplot(df, aes(x = pos, y = value, label = nt) ) +
    geom_abline(aes(slope=0), colour = "grey",size=2)+
    geom_text(aes(colour=factor(nt)),size=8)+
    opts(legend.position="none")+
    scale_x_continuous(name="Position",breaks=1:ncol(pwm))+
    scale_y_continuous(name="Log relative frequency")
  p
}#getLogoFromPWM#


pssm <- getFreqMatrix("/nfs/th_group/hk3/UW_DNaseI_HS/K562/wgEncodeUwDnaseK562AlnRep1_chr22_biasness_scores_less_than_minus_1_offset_36.pssm")
p <- getLogoFromPWM(pssm)
print(p)
