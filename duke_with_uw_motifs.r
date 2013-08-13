Gm12878.with.its.motif.file = "/nfs/th_group/hk3/Duke_DNaseI_HS/Gm12878_For_Paper_Analysis/wgEncodeOpenChromDnaseGm12878Alnrep1_chr22_with_bias_scores_offset_5_length_15.bed"
Gm12878.with.uw.motif.file = "/nfs/th_group/hk3/Duke_DNaseI_HS/Gm12878_For_Paper_Analysis/wgEncodeOpenChromDnaseGm12878Alnrep1_chr22_with_bias_scores_offset_5_length_15_with_UW_PWMs.bed"



K562.with.its.motif.file = "/nfs/th_group/hk3/Duke_DNaseI_HS/K562_For_Paper_Analysis/wgEncodeOpenChromDnaseK562Alnrep1_chr22_with_bias_scores_offset_5_length_15.bed"
K562.with.uw.motif.file = "/nfs/th_group/hk3/Duke_DNaseI_HS/K562_For_Paper_Analysis/wgEncodeOpenChromDnaseK562Alnrep1_chr22_with_bias_scores_offset_5_length_15_with_UW_PWMs.bed"


Helas3.with.its.motif.file = "/nfs/th_group/hk3/Duke_DNaseI_HS/Helas3_For_Paper_Analysis/wgEncodeOpenChromDnaseHelas3Alnrep1_chr22_with_bias_scores_offset_5_length_15.bed"
Helas3.with.uw.motif.file = "/nfs/th_group/hk3/Duke_DNaseI_HS/Helas3_For_Paper_Analysis/wgEncodeOpenChromDnaseHelas3Alnrep1_chr22_with_bias_scores_offset_5_length_15_with_UW_PWMs.bed"





get.distribution.of.scors <- function(file.with.its.motif, file.with.uw.motif, title = " "){
  df.from.first.file   = bed.as.data.frame(file.with.its.motif)
  df.from.second.file  = bed.as.data.frame(file.with.uw.motif)
  scores.from.first    = df.from.first.file$score
  scores.from.second   = df.from.second.file$score
  hist(scores.from.first, breaks=100, col='blue', xlim=c(-6,6), xlab='scores', main = title)
  hist(scores.from.second, breaks=100, col='red', add=TRUE, density=40)
  legend('topleft',legend=c("Duke tags with Duke Motif", "Duke tags wiht UW motif"), text.col=c('blue','red'))
}
