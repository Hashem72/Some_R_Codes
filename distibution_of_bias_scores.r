source("some_handy_functions.r")



get.dist.of.scores <- function(fed.file.with.scores){
  df = bed.as.data.frame(fed.file.with.scores)
  m <- ggplot(df, aes(score)) + geom_histogram(binwidth=0.1)
  m
}#get.dist.of.scores#




get.dist.of.socres.2 <- function(a.bed.file.with.scores, a.title){
   df          = bed.as.data.frame(a.bed.file.with.scores)
   data   = df$score
   hist( data, col = "grey", breaks = 100, main = a.title, xlim = c(-5,5), ylim= c(0,15000), xlab = "scores" )
   
}#get.dist.of.socres.2#


pdf("/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/dist_of_scores_5_15.pdf ",height = 6, width=6)
par(cex=2, lwd =1, col.axis='black', col.lab='black', col.main='black', col.sub='black', fg='black', cex.axis=1.1, mfrow=c(2,2))
ge.dist.of.socres.2("/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/wgEncodeUwDnaseGm12878AlnRep1_chr22_with_bias_scores_offset_5_length_15.bed", "Gm12878")
ge.dist.of.socres.2("/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/wgEncodeUwDnaseK562AlnRep1_chr22_with_bias_scores_offset_5_length_15.bed", "K562")
ge.dist.of.socres.2("/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc_For_Paper_Analysis/wgEncodeUwDnaseH1hescAlnRep1_chr22_with_bias_scores_offset_5_length_15.bed", "H1hesc")

title("Distribution of Bias Scores", outer= TRUE, line = -1.3)
dev.off()


# Histone Modification Data


get.dist.of.scores.3 <- function(first.bed.file,  second.bed.file, title){
  df1        = bed.as.data.frame(first.bed.file)
  data1      = df1$score
  p1         =  hist( data1, breaks = 100)
  df2        = bed.as.data.frame(second.bed.file)
  data2      = df2$score
  p2         = hist(data2, breaks = 100, main = title)
  plot(p1, col="grey",   xlim = c(-6,6), ylim= c(0,15000), xlab = "scores" , main = title)
  plot(p2, col=rgb(1,0,0,1/4),  xlim = c(-6,6), ylim= c(0,15000), add = TRUE, main = title)
}

pdf("/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/comparisions_of_dist_of_scores_K562.pdf ", height=4, width=4)
par(cex=2, lwd =1, col.axis='black', col.lab='black', col.main='black', col.sub='black', fg='black', cex.axis=1.1)
get.dist.of.scores.3("/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/wgEncodeUwDnaseGm12878AlnRep1_chr22_with_bias_scores_offset_5_length_15.bed",  "/nfs/th_group/hk3/wgEncodeUwHistone/Gm12878_Histone/wgEncodeUwDnaseGm12878H3k4me3StdAlnRep1_chr22_with_bias_scores_offset_5_length_15.bed", "Gm12878(grey) vs Gm-H3k4me3(red)")

#get.dist.of.scores.3("/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/wgEncodeUwDnaseK562AlnRep1_chr22_with_bias_scores_offset_5_length_15.bed", "/nfs/th_group/hk3/wgEncodeUwHistone/K562_Histone/wgEncodeUwDnaseK562H3k4me3StdAlnRep1_chr22_with_bias_scores_offset_5_length_15.bed", "K562(grey) vs K562H3k4me3(red)")
title("Distribution of  Scores", outer= TRUE, line = -1.3)
dev.off()

