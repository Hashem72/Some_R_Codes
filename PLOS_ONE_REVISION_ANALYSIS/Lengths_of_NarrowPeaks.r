HelaS3narrowPeakFileName  = "/nfs/th_group/hk3/SYD_TFS/HelaS3/All/Chr22/Chr22_Sorted/HelaS3_Union_of_Peaks.bed"
HelaS3.DHS.File           = "/nfs/th_group/hk3/UW_DNaseI_HS/Helas3_For_Paper_Analysis/Threshold_Optimization/wgEncodeUwDnaseHelas3Alnrep1_chr22_with_scores_less_than_5.npf"


GM12878NarrowPeakFileName = "/nfs/th_group/hk3/SYD_TFS/Gm12878/All/Chr22/Chr22_Sorted/GM12878_union_of_peaks.bed"
GM12878NarrowPeakFileNameLongPeakRemoved = "/nfs/th_group/hk3/SYD_TFS/Gm12878/All/Chr22/Chr22_Sorted/GM12878_union_of_peaks_Long_Peak_Removed.npf"
GM12878.DHS.File       = "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/Threshold_Optimization/wgEncodeUwDnaseGm12878AlnRep1_chr22_with_scores_less_than_4.5.npf"


K562NarrowPeakFileName  = "/nfs/th_group/hk3/SYD_TFS/K562/Peak_Unions_All_Tfs/union_of_peaks_from_29_tfs.npf"
K562.DHS.File           = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/Threshold_Optimization/wgEncodeUwDnaseK562AlnRep1_chr22_with_biasness_scores_less_than_4.npf"


H1hesc.NarrowPeaksFileName = "/nfs/th_group/hk3/SYD_TFS/H1hesc/All/Chr22/Chr22_Sorted/H1hesc_Union_of_Peaks.bed"


get.lengths.of.peaks <- function(fileOfPeaks){
  peaks = read.table(fileOfPeaks)
  Lengths =  peaks[,3] - peaks[,2]
  Lengths
  
}#get.lengths.of.peaks#

