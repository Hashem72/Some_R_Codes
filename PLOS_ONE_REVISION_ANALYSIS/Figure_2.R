
get.histograms <- function(Histon.Scores.File, K562.Scores.File){
 K562.H3K4me3.Bias.Scores = scan(file = Histon.Scores.File )
  K562.Bias.Scores        = scan(file= K562.Scores.File)
 Hist1 = hist(K562.Bias.Scores, breaks = 100)
 Hist2 = hist(K562.H3K4me3.Bias.Scores, breaks = 100)
 plot(Hist1, col= 'blue', main = 'Distribution of bias scores', ylab= 'frequency', xlab='scores', ylim= c(0,13000))
 plot(Hist2,  col=rgb(1, 0, 0, 0.5), add= TRUE)
 legend('topleft', legend= c('K562-H3K4me3', 'K562'), text.col= c('red', 'blue'), fill = c('red', 'blue'))
 
}#get.histograms#



H3K4me3.Scores.File  = "/nfs/th_group/hk3/wgEncodeUwHistone/K562_Histone/bias_scores.txt"
K562.Scores.File     =  "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Shift_Effects/bias_scores_fromoffset_5_length_15_shift_80.txt"

GM12878.Score.File   = "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/GM12878_bias_scores_fromoffset_5_length_15.txt"
H1hesc.Score.File    = "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc_For_Paper_Analysis/H1hesc_bias_scores_fromoffset_5_length_15.txt"
Hsmm.Score.File      = "/nfs/th_group/hk3/UW_DNaseI_HS/Hsmm_For_Paper_Analysis/Hsmm_bias_scores_fromoffset_5_length_15.txt"
Helas3.Score.File    = "/nfs/th_group/hk3/UW_DNaseI_HS/Helas3_For_Paper_Analysis/Helas3_bias_scores_fromoffset_5_length_15.txt"


get.histograms(H3K4me3.Scores.File, K562.Scores.File)

get.box.plot <- function(Histon.scores.file, K562.scores.file, Gm12878.score.file, H1hesc.score.file, Hsmm.score.file, Helas3.score.file){
   K562.H3K4me3.Bias.Scores = scan(file = Histon.scores.file )
   K562.Bias.Scores         = scan(file= K562.scores.file)
   Gm12878.Scores           = scan(file =Gm12878.score.file )
   H1hesc.Scores            = scan(file =  H1hesc.score.file)
   Hsmm.Scores              = scan(file = Hsmm.score.file)
   Helas3.Scores            = scan(file = Helas3.score.file)
   Scores  = list()
   Scores[[1]] = K562.H3K4me3.Bias.Scores
   Scores[[2]] = K562.Bias.Scores
   Scores[[3]] = Gm12878.Scores
   Scores[[4]] = H1hesc.Scores
   Scores[[5]] = Hsmm.Scores
   Scores[[6]] = Helas3.Scores
   boxplot(Scores, col = c('red', 'blue', 'blue', 'blue', 'blue', 'blue'), names = c('K562-H3K4me3', 'K562', 'GM12878', 'H1-hESC', 'HSMM', 'HelaS3'), ylab='bais scores')
 }#get.box.plot#



pdf(file= "/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/PLOS_ONE_REVISION/Figure_2_Histogram.pdf", height=6, width=6)
get.histograms(H3K4me3.Scores.File, K562.Scores.File)
dev.off()

pdf(file= "/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/PLOS_ONE_REVISION/Figure_2_boxplot.pdf", height=6, width=12)
get.box.plot(H3K4me3.Scores.File, K562.Scores.File, GM12878.Score.File, H1hesc.Score.File , Hsmm.Score.File, Helas3.Score.File )
dev.off()


pdf(file= "/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/PLOS_ONE_REVISION/Figure_2_Histogram_and_boxplot.pdf", height=6, width=14)
par(mfrow=c(1,2))
get.histograms(H3K4me3.Scores.File, K562.Scores.File)
get.box.plot(H3K4me3.Scores.File, K562.Scores.File)
dev.off()
