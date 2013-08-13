
##########################################   algorithms-wise  #############################
##########################################   algorithms-wise  #############################
##########################################   algorithms-wise  #############################
pdf(file='F_Scores_all_in_one.pdf', height=6, width=6)
par(mfrow=c(2,3))
#fSEQ
plot.f.bets.scores.for.all.cell.line.from.one.algorithm("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_Full_Sets_of_TFs_vs_F_Seq.txt",
                                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_F_SES.txt",
                                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_F_SES.txt",
                                                        0.5,
                                                        FSEQ,
                                                        "F-Seq")
#hotspot
plot.f.bets.scores.for.all.cell.line.from.one.algorithm("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_TFs_vs_HOTSPOT.txt",
                                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_HOTSPOT.txt",
                                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_HOTSPOT.txt",
                                                        0.5,
                                                        HOTSPOT,
                                                        "Hotspot"
                                                        )
#macs
plot.f.bets.scores.for.all.cell.line.from.one.algorithm("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_Full_Set_of_TFs_vs_MACS.txt",
                                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_MACS.txt",
                                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_MACS.txt",
                                                        0.5,
                                                        MACS,
                                                        "MACS"
                                                        )
#zinba_broad
plot.f.bets.scores.for.all.cell.line.from.one.algorithm("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_TFs_vs_ZINBA_BROAD_2.txt",
                                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ZINBA_BROAD.txt",
                                                         "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_ZINBA_BROAD.txt",
                                                        0.5,
                                                        ZINBA,
                                                        "ZINBA_Broad"
                                                        )
#zinba_narrow
plot.f.bets.scores.for.all.cell.line.from.one.algorithm("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_TFs_vs_ZINBA_NARROW_2.txt",
                                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ZINBA_NARROW.txt",
                                                         "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_ZINBA_NARROW.txt",
                                                        0.5,
                                                        ZINBA,
                                                        "ZINBA_Narrow"
                                                        )
dev.off()

########################################################################### cell-wise #############################################
########################################################################### cell-wise #############################################
########################################################################### cell-wise #############################################
########################################################################### cell-wise #############################################



#K562
plot.precision.vs.recall("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_Full_Sets_of_TFs_vs_F_Seq.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_Full_Set_of_TFs_vs_MACS.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_TFs_vs_ZINBA_BROAD_2.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_TFs_vs_ZINBA_NARROW_2.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_Full_Sets_of_TFs_vs_ENCODE.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_TFs_vs_HOTSPOT.txt",
                        "K562",
                        FSEQ,
                        MACS,
                        ZINBA,
                        HOTSPOT
                        )

plot.precision.vs.recall("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_13_K562_TFs_vs_F_SEQ.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_13_K562_TFs_vs_MACS.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/ZINBA_Broad_Vs_Union_of_13_K562_TFs.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/ZINBA_Narrow_Vs_Union_of_13_K562_TFs.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_13_K562_TFs_vs_ENCODE_DHS.txt",
                         "k562 Common TFs",
                         FSEQ,
                         MACS,
                         ZINBA
                         )



plot.f.beta.scores.v2("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_Full_Sets_of_TFs_vs_F_Seq.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_Full_Set_of_TFs_vs_MACS.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_TFs_vs_ZINBA_BROAD_2.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_TFs_vs_ZINBA_NARROW_2.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_Full_Sets_of_TFs_vs_ENCODE.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_TFs_vs_HOTSPOT.txt",
                      0.5,
                      FSEQ,
                      MACS,
                      ZINBA,
                      HOTSPOT
                      )




plot.f.beta.scores.v2("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_13_K562_TFs_vs_F_SEQ.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_13_K562_TFs_vs_MACS.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/ZINBA_Broad_Vs_Union_of_13_K562_TFs.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/ZINBA_Narrow_Vs_Union_of_13_K562_TFs.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_13_K562_TFs_vs_ENCODE_DHS.txt",
                      0.5,
                      FSEQ,
                      MACS,
                      ZINBA
                      )

plot.average.of.precision.and.recall.v2("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_Full_Sets_of_TFs_vs_F_Seq.txt",
                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_Full_Set_of_TFs_vs_MACS.txt",
                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_TFs_vs_ZINBA_BROAD_2.txt",
                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_TFs_vs_ZINBA_NARROW_2.txt",
                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_Full_Sets_of_TFs_vs_ENCODE.txt"
                                        )



K562.zinba.narrow.file <- "/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/K562/NPF_Files/ZINBA_OUT_FDR_0.05_narrow_peaks.npf"
K562.zinba.broad.file  <- "/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/K562/NPF_Files/ZINBA_OUT_FDR_0.05_broad_peaks.npf"
K562.macs.file         <- "/nfs/th_group/hk3/MACS_ANALYSIS/UW/K562/K562_0.05_peaks.encodePeak"
K562.fseq.file         <- "/nfs/th_group/hk3/Hotspot_vs_F_Seq/UW/K562/F_Seq_Outputs_for_different_t_Parameters/chr22_t_4.npf"
K562.encode.file       <- "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/K562_Encode_hotspots.npf"
K562.hotspot.file      <- "/nfs/th_group/hk3/Hotspot_V3_Analysis/UW/K562/NPFs/wgEncodeUwDnaseK562AlnRep1.hotspot.twopass.fdr0.05.npf"

K562.summary.statistics <- peak.summary.of.statistics(K562.zinba.narrow.file,
                                                      K562.zinba.broad.file,
                                                      K562.macs.file,
                                                      K562.fseq.file,
                                                      K562.encode.file,
                                                      K562.hotspot.file,
                                                      cell.line='K562')






######################################   #GM12878  ####################################3
plot.precision.vs.recall("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_F_SES.txt",
                         "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_MACS.txt",
                         "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ZINBA_BROAD.txt",
                         "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ZINBA_NARROW.txt",
                         "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ENCODE_HOTSPOTS.txt",
                         "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_HOTSPOT.txt",
                         "GM12878",
                         FSEQ,
                         MACS,
                         ZINBA,
                         HOTSPOT
                         )

plot.precision.vs.recall("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_13_Common_TFs_vs_F_Seq.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_13_Common_TFs_vs_MACS.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_13_Common_TFs_vs_ZINBA_BROAD.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_13_Common_TFs_vs_ZINBA_NARROW.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_13_Common_TFs_vs_ENCODE.txt",
                        "GM12878-Common TFs",
                         FSEQ,
                         MACS,
                         ZINBA
                         )



plot.f.beta.scores.v2("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_F_SES.txt",
                   "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_MACS.txt",
                   "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ZINBA_BROAD.txt",
                   "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ZINBA_NARROW.txt",
                   "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ENCODE_HOTSPOTS.txt",
                   "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_HOTSPOT.txt",
                   0.5,
                   FSEQ,
                   MACS,
                   ZINBA,
                   HOTSPOT
                   )


plot.f.beta.scores.v2("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_13_Common_TFs_vs_F_Seq.txt",
                      "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_13_Common_TFs_vs_MACS.txt",
                      "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_13_Common_TFs_vs_ZINBA_BROAD.txt",
                      "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_13_Common_TFs_vs_ZINBA_NARROW.txt",
                      "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_13_Common_TFs_vs_ENCODE.txt",
                      0.5,
                      FSEQ,
                      MACS,
                      ZINBA
                      )
plot.average.of.precision.and.recall.v2("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_F_SES.txt",
                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_MACS.txt",
                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ZINBA_BROAD.txt",
                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ZINBA_NARROW.txt",
                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ENCODE_HOTSPOTS.txt"
                                        )


Gm12878.zinba.narrow.file <- "/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/Gm12878/NPF_Files/ZINBA_OUT_FDR_0.05_narrow_peaks.npf"
Gm12878.zinba.broad.file  <- "/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/Gm12878/NPF_Files/ZINBA_OUT_FDR_0.05_broad_peaks.npf"
Gm12878.macs.file         <- "/nfs/th_group/hk3/MACS_ANALYSIS/UW/Gm12878/Gm12878_0.05_peaks.encodePeak"
Gm12878.fseq.file         <- "/nfs/th_group/hk3/Hotspot_vs_F_Seq/UW/Gm12878/F_Seq_Outputs_for_different_t_Parameters/chr22_t_4.npf"
Gm12878.encode.file       <- "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/Gm12878_Encode_hotspots.npf"
Gm12878.hotspot.file      <- "/nfs/th_group/hk3/Hotspot_V3_Analysis/UW/Gm12878/NPFs/wgEncodeUwDnaseGm12878AlnRep1.hotspot.twopass.fdr0.05.npf"

Gm12878.summary.statistics <- peak.summary.of.statistics(Gm12878.zinba.narrow.file,
                                                      Gm12878.zinba.broad.file,
                                                      Gm12878.macs.file,
                                                      Gm12878.fseq.file,
                                                      Gm12878.encode.file,
                                                      Gm12878.hotspot.file,
                                                      cell.line='GM12878')





############################    HelaS3  ##########################################

plot.precision.vs.recall("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_F_SES.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_MACS.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_ZINBA_BROAD.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_ZINBA_NARROW.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_ENCODE_HOTSPOTS.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_HOTSPOT.txt",
                        "Helas3",
                         FSEQ,
                         MACS,
                         ZINBA,
                         HOTSPOT
                         )

plot.precision.vs.recall("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_13_Common_TFs_vs_F_Seq.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_13_Common_TFs_vs_MACS.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_13_Common_TFs_vs_ZINBA_BROAD.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_13_Common_TFs_vs_ZINBA_NARROW.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_13_Common_TFs_vs_ENCODE.txt",
                        "Helas3 Common TFs",
                        FSEQ,
                        MACS,
                        ZINBA
                        )


plot.f.beta.scores.v2("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_F_SES.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_MACS.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_ZINBA_BROAD.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_ZINBA_NARROW.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_ENCODE_HOTSPOTS.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_HOTSPOT.txt",
                      0.5,
                      FSEQ,
                      MACS,
                      ZINBA,
                      HOTSPOT
                      )

plot.f.beta.scores.v2("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_13_Common_TFs_vs_F_Seq.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_13_Common_TFs_vs_MACS.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_13_Common_TFs_vs_ZINBA_BROAD.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_13_Common_TFs_vs_ZINBA_NARROW.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_13_Common_TFs_vs_ENCODE.txt",
                      0.5,
                      FSEQ,
                      MACS,
                      ZINBA
                      )

plot.average.of.precision.and.recall.v2("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_F_SES.txt",
                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_MACS.txt",
                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_ZINBA_BROAD.txt",
                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_ZINBA_NARROW.txt",
                                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_ENCODE_HOTSPOTS.txt"
                                        )

Helas3.zinba.narrow.file <- "/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/Helas3/NPF_Files/ZINBA_OUT_FDR_0.05_narrow_peaks.npf"
Helas3.zinba.broad.file  <- "/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/Helas3/NPF_Files/ZINBA_OUT_FDR_0.05_broad_peaks.npf"
Helas3.macs.file         <- "/nfs/th_group/hk3/MACS_ANALYSIS/UW/Helas3/Helas3_0.05_peaks.encodePeak"
Helas3.fseq.file         <- "/nfs/th_group/hk3/Hotspot_vs_F_Seq/UW/Helas3/F_Seq_Outputs_for_different_t_Parameters/chr22_t_4.npf"
Helase.encode.file       <- "/nfs/th_group/hk3/UW_DNaseI_HS/Helas3_For_Paper_Analysis/Helas3_Encode_hotspots.npf"
Helas3.hotspot.file      <- "/nfs/th_group/hk3/Hotspot_V3_Analysis/UW/Helas3/NPFs/wgEncodeUwDnaseHelas3AlnRep1.hotspot.twopass.fdr0.05.npf"

Helas3.summary.statistics <- peak.summary.of.statistics(Helas3.zinba.narrow.file,
                                                      Helas3.zinba.broad.file,
                                                      Helas3.macs.file,
                                                      Helas3.fseq.file,
                                                      Helase.encode.file,
                                                      Helas3.hotspot.file,
                                                      cell.line='HelaS3')








