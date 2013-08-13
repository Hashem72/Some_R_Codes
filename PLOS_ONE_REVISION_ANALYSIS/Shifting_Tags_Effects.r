scoresFileShift40     = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Shift_Effects/bias_scores_fromoffset_5_length_15_shift_40.txt"

scoresFileShift60     = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Shift_Effects/bias_scores_fromoffset_5_length_15_shift_60.txt"

scoresFileShift80     = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Shift_Effects/bias_scores_fromoffset_5_length_15_shift_80.txt"

scoresFileShift100     = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Shift_Effects/bias_scores_fromoffset_5_length_15_shift_100.txt"

scoresFileShift200     = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Shift_Effects/bias_scores_fromoffset_5_length_15_shift_200.txt"

scoresFileWithRandomBG     = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Shift_Effects/bias_scores_fromoffset_5_length_15_random_tags_as_bg.txt"


plot.bias.scores <- function(fileOfScores, Main= ""){
  bias.Scores       = scan(fileOfScores)
  Mean              = round( mean(bias.Scores), 4)
  SD                = round( sd(bias.Scores), 4)
  hist(bias.Scores, breaks=100, col='red', ylim= c(0, 15000), xlab='bais score', ylab='frequency', main = Main)
  TEXT = paste("mean= ", Mean, "\n sd= ", SD, sep="")
  text(-5.5, 13000, TEXT)
  
}#plot.bias.scores#

pdf(file = "/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/PLOS_ONE_REVISION/Shifting_Effects.pdf", height=6, width=12)
par(mfrow= c(2,3))
plot.bias.scores(scoresFileShift40, "K562: S=40")
plot.bias.scores(scoresFileShift60, "K562: S=60")
plot.bias.scores(scoresFileShift80, "K562: S=80")
plot.bias.scores(scoresFileShift100, "K562: S=100")
plot.bias.scores(scoresFileShift200, "K562: S=200")
plot.bias.scores(scoresFileWithRandomBG, "K562: Random BG")
dev.off()
