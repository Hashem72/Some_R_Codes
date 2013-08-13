# overlap analysis

pdf(file = "/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/PLOS_ONE_REVISION/Duke_Overlaps_with_TFs.pdf", height = 4, width=10)
plot.precision.vs.recall.for.all.three.cell.lines( K562.Duke.vs.TFs.File, GM12878.Duke.vs.TFs.File, HelaS3.Duke.vs.TFs.File, Title = "Duke ", beta = 0.5, K562.Start.Thr=5, GM.Start.Thr=2, Hela.Start.Thr=5)
dev.off()

pdf(file = "/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/PLOS_ONE_REVISION/UW_Overlaps_with_TFs.pdf", height = 4, width=10)
plot.precision.vs.recall.for.all.three.cell.lines( K562.UW.vs.TFs.File, GM12878.UW.vs.TFs.File, HelaS3.UW.vs.TFs.File, Title = "UW", beta = 0.5, K562.Start.Thr=5, GM.Start.Thr=2, Hela.Start.Thr=5)
dev.off()





pdf(file = "/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/PLOS_ONE_REVISION/Effects_of_Tags_Removal_UW_Overlaps_with_TFs_2.pdf", height = 5, width=15)
par(mfrow=c(1,3))
plot.effects.of.randomly.removing.tags(K562.UW.vs.TFs.File, K562.UW.Randomly.Removed.vs.TFs.File, "UW: K562", Model='F_Score', beta = 0.5, start.Threshold=4)
plot.effects.of.randomly.removing.tags(GM12878.UW.vs.TFs.File, GM12878.UW.Randomly.Removed.vs.TFs, "UW: GM12878", Model='F_Score', beta = 0.5, start.Threshold=1)
plot.effects.of.randomly.removing.tags(HelaS3.UW.vs.TFs.File, HelaS3.UW.Randomly.Removed.vs.TFs.File, "UW: HelaS3", Model='F_Score', beta = 0.5, start.Threshold=4)
dev.off()


pdf(file="/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/PLOS_ONE_REVISION/Effects_of_Tags_Removal_Duke_Overlaps_with_TFs.pdf",height = 5, width=15)
par(mfrow=c(1,3))

plot.effects.of.randomly.removing.tags(K562.Duke.vs.TFs.File, K562.Duke.Randomly.Removed.vs.TFs.File, "Duke: K562", Model='F_Score', beta = 0.5, start.Threshold=1)
plot.effects.of.randomly.removing.tags(GM12878.Duke.vs.TFs.File, GM12878.Duke.Randomly.Removed.vs.TFs, "Duke: GM12878", Model='F_Score', beta = 0.5, start.Threshold=1)
plot.effects.of.randomly.removing.tags(HelaS3.Duke.vs.TFs.File, HelaS3.Duke.Randomly.Removed.vs.TFs.File, "Duke: HelaS3", Model='F_Score', beta = 0.5, start.Threshold=1)
dev.off()

K562.Duke.TFs.File.with.UW.motif    = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/K562_TFs_vs_DHS/Common_Set_SensSpec_Union_of_TFs_vs_Duke_K562_with_UW_Motif.txt"
Gm12878.Duke.TFs.File.with.UW.motif = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/GM12878_TFs_vs_DHS/Common_Set_SensSpec_Union_of_TFs_vs_Duke_Gm12878_UW_Motif.txt"
Helas3.Duke.TFs.File.with.UW.motif  = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/HelaS3_TFs_vs_DHS/Common_Set_SensSpec_Union_of_TFs_vs_Duke_HelaS3_UW_Motif.txt"

  
K562.Duke.Randomly.Removed.vs.TFs.File.with.UW.motif    = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/K562_TFs_vs_DHS/Common_Set_SensSpec_Union_of_TFs_vs_Duke_K562_Randomly_Removed_Tags_with_UW_Motif.txt"
Gm12878.Duke.Randomly.Removed.vs.TFs.File.with.UW.motif = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/GM12878_TFs_vs_DHS/Common_Set_SensSpec_Union_of_TFs_vs_Duke_Gm12878_Randomly_Removed_Tags_using_UW_Motif.txt"
Helas3.Duke.Randomly.Removed.vs.TFs.File.with.UW.motif  = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/HelaS3_TFs_vs_DHS/Common_Set_SensSpec_Union_of_TFs_vs_Duke_HelaS3_Randomly_Removed_Tags_UW_Motif.txt"



plot.effects.of.randomly.removing.tags(K562.Duke.TFs.File.with.UW.motif, K562.Duke.Randomly.Removed.vs.TFs.File.with.UW.motif, "Duke: K562", Model='F_Score', beta = 0.5, start.Threshold=1)
plot.effects.of.randomly.removing.tags(Gm12878.Duke.TFs.File.with.UW.motif, Gm12878.Duke.Randomly.Removed.vs.TFs.File.with.UW.motif, "Duke: GM12878", Model='F_Score', beta = 0.5, start.Threshold=1)
plot.effects.of.randomly.removing.tags(Helas3.Duke.TFs.File.with.UW.motif, Helas3.Duke.Randomly.Removed.vs.TFs.File.with.UW.motif, "UW: HelaS3", Model='F_Score', beta = 0.5, start.Threshold=2)

##############################################


pdf(file = "/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/PLOS_ONE_REVISION/K562_Overlaps_with_TFs.pdf", height = 6, width=12)
# precision.and.recall(TFs.vs.UW.File_t_4, TFs.vs.Duke.File_t_4, "K562", Model='F_Score', beta = 0.5, start.Threshold=3)
precision.and.recall(K562.UW.vs.TFs.File, K562.Duke.vs.TFs.File, "K562", Model='F_Score', beta = 0.5, start.Threshold=5)
dev.off()



pdf(file = "/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/PLOS_ONE_REVISION/GM12878_Overlaps_with_TFs.pdf", height = 6, width=12)
 #precision.and.recall(GM12878.UW.vs.TFs.File, GM12878.Duke.vs.TFs.File, "GM12878", Model='F_Score', beta = 0.5, start.Threshold=1)
precision.and.recall(GM12878.UW.vs.TFs.File, GM12878.Duke.vs.TFs.File, "GM12878", Model='F_Score', beta = 0.5, start.Threshold=2)
dev.off()


pdf(file = "/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/PLOS_ONE_REVISION/HelaS3_Overlaps_with_TFs.pdf",  height = 6, width=12)
#precision.and.recall(HelaS3.TFs.vs.UW.File, HelaS3.TFs.vs.Duke.File, "HelaS3", Model='F_Score', beta = 0.5, start.Threshold=3)
precision.and.recall(HelaS3.UW.vs.TFs.File, HelaS3.Duke.vs.TFs.File, "HelaS3", Model='F_Score', beta = 0.5, start.Threshold=5)
dev.off()




precision.and.recall(HelaS3.UW.vs.TFs.File, HelaS3.Duke.vs.TFs.File, "HelaS3", Model='F_Score', beta = 0.5, start.Threshold=5)




#TFs.vs.UW.Original.File = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/sensspec_29TFs_vs_UW_K562_testing.txt"
#TFs.vs.Duke.Original.File = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/sensspec_29TFs_vs_Duke_K562_testing.txt"




 K562.UW.vs.TFs.File = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/K562_TFs_vs_DHS/Common_Set_SensSpec_Union_of_TFs_vs_UW_K562.txt"
 K562.Duke.vs.TFs.File = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/K562_TFs_vs_DHS/Common_Set_SensSpec_Union_of_TFs_vs_Duke_K562.txt"
 K562.UW.Randomly.Removed.vs.TFs.File = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/K562_TFs_vs_DHS/Common_Set_SensSpec_Union_of_TFs_vs_UW_K562_Randomly_Removed_Tags.txt"
 K562.Duke.Randomly.Removed.vs.TFs.File = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/K562_TFs_vs_DHS/Common_Set_SensSpec_Union_of_TFs_vs_Duke_K562_Randomly_Removed_Tags.txt"


TFs.vs.UW.File = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/K562_TFs_vs_DHS/sensspec_29TFs_vs_UW_K562_Revision.txt"
TFs.vs.Duke.File = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/K562_TFs_vs_DHS/sensspec_29TFs_vs_Duke_K562_Revision.txt"







TFs.vs.UW.File_t_4 = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/K562_TFs_vs_DHS/sensspec_29TFs_vs_UW_K562_Revision_t_4.txt"
TFs.vs.Duke.File_t_4 = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/K562_TFs_vs_DHS/sensspec_29TFs_vs_Duke_K562_Revision_t_4.txt"



Randomly.Removed.Tags = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/K562_TFs_vs_DHS/sensspec_29TFs_vs_UW_K562_Randomly_Moved_Tags.txt"


############# GM12878

GM12878.TFs.vs.UW.File = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/GM12878_TFs_vs_DHS/sensspec_Union_of_TFs_vs_UW_GM12878.txt"
GM12878.TFs.vs.Duke.File = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/GM12878_TFs_vs_DHS/sensspec_Union_of_TFs_vs_Duke_GM12878.txt"

GM12878.Randomly.Removed.Tags = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/GM12878_TFs_vs_DHS/sensspec_Union_of_TFs_vs_Randomly_Removed_Tags.txt"

 GM12878.UW.vs.TFs.File = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/GM12878_TFs_vs_DHS/Common_Set_SensSpec_Union_of_TFs_vs_UW_Gm12878.txt"
 GM12878.Duke.vs.TFs.File = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/GM12878_TFs_vs_DHS/Common_Set_SensSpec_Union_of_TFs_vs_Duke_Gm12878.txt"
 GM12878.UW.Randomly.Removed.vs.TFs = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/GM12878_TFs_vs_DHS/Common_Set_SensSpec_Union_of_TFs_vs_UW_Gm12878_Randomly_Moved_Tags.txt"
 GM12878.Duke.Randomly.Removed.vs.TFs = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/GM12878_TFs_vs_DHS/Common_Set_SensSpec_Union_of_TFs_vs_Duke_Gm12878_Randomly_Removed_Tags.txt"




#####
 # Gm12878 after removong long peak

GM12878.TFs.vs.UW.Long.Peak.Removed = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/GM12878_TFs_vs_DHS/sensspec_Union_of_TFs_vs_UW_GM12878_Long_Peak_Removed.txt"
GM12878.TFs.vs.Duke.Long.Peak.Removed = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/GM12878_TFs_vs_DHS/sensspec_Union_of_TFs_vs_Duke_GM12878_Long_Peak_Removed.txt"
GM12878.TFs.vs.Randomly.Removed.Tags.Long.Peak.Removed = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/GM12878_TFs_vs_DHS/sensspec_Union_of_TFs_vs_UW_Gm12878_Randomly_Moved_Tags.txt"



############ HelaS3
HelaS3.TFs.vs.UW.File = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/HelaS3_TFs_vs_DHS/sensspec_Union_of_TFs_vs_UW_HelaS3.txt"
HelaS3.TFs.vs.Duke.File = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/HelaS3_TFs_vs_DHS/sensspec_Union_of_TFs_vs_Duke_HelaS3.txt"
HelaS3.Randomly.Removed.Tags = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/HelaS3_TFs_vs_DHS/sensspec_Union_of_TFs_vs_UW_Randomly_Moved_Tags.txt"


HelaS3.UW.vs.TFs.File                   = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/HelaS3_TFs_vs_DHS/Common_Set_SensSpec_Union_of_TFs_vs_UW_HelaS3.txt"
HelaS3.Duke.vs.TFs.File                 = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/HelaS3_TFs_vs_DHS/Common_Set_SensSpec_Union_of_TFs_vs_Duke_HelaS3.txt"
HelaS3.UW.Randomly.Removed.vs.TFs.File  = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/HelaS3_TFs_vs_DHS/Common_Set_SensSpec_Union_of_TFs_vs_UW_HelaS3_Randomly_Removed_Tags.txt"

HelaS3.Duke.Randomly.Removed.vs.TFs.File  = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/HelaS3_TFs_vs_DHS/Common_Set_SensSpec_Union_of_TFs_vs_Duke_HelaS3_Randomly_Removed_Tags.txt"

########### H1hesc
H1hesc.TFs.vs.UW.File        = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/H1hesc_TFs_vs_DHS/sensspec_Union_of_TFs_vs_UW_H1hesc.txt"
H1hesc.TFs.vs.Duke.File      = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/H1hesc_TFs_vs_DHS/sensspec_Union_of_TFs_vs_Duke_H1hesc.txt"
H1hesc.Randomly.Removed.Tags = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/H1hesc_TFs_vs_DHS/sensspec_Union_of_TFs_vs_UW_H1hesc_Randomly_Moved_Tags.txt"






plot.precision.vs.recall.for.all.three.cell.lines <- function(K562.File, GM12878.File, HelaS3.File, Title = " ", beta = 0.5, K562.Start.Thr=1, GM.Start.Thr=1, Hela.Start.Thr=1 ){
  K562.Data      = read.table(K562.File)
  GM12878.Data   = read.table(GM12878.File)
  HelaS3.Data    = read.table(HelaS3.File)

  K562.Precision      = K562.Data[ , 5]
  K562.Precision      =  K562.Precision[K562.Start.Thr:length( K562.Precision)]
  GM12878.Precision   = GM12878.Data[ , 5]
  GM12878.Precision   =  GM12878.Precision[GM.Start.Thr:length(GM12878.Precision)]
  HelaS3.Precision    =  HelaS3.Data[, 5]
  HelaS3.Precision    =  HelaS3.Precision[Hela.Start.Thr:length(HelaS3.Precision)]


  K562.Recall     = K562.Data[ , 6]
  K562.Recall     = K562.Recall[K562.Start.Thr:length(K562.Recall)]
  GM12878.Recall  = GM12878.Data[ , 6]
  GM12878.Recall  = GM12878.Recall[GM.Start.Thr:length(GM12878.Recall)]
  HelaS3.Recall   = HelaS3.Data[ , 6]
  HelaS3.Recall   = HelaS3.Recall[Hela.Start.Thr:length(HelaS3.Recall)]

  K562.Thresholds     = K562.Data[ , 1]
  K562.Thresholds     = K562.Thresholds[ K562.Start.Thr:length(K562.Thresholds)]
  GM12878.Thresholds  = GM12878.Data[, 1]
  GM12878.Thresholds  = GM12878.Thresholds[GM.Start.Thr:length(GM12878.Thresholds)]
  HelaS3.Thresholds   = HelaS3.Data[, 1]
  HelaS3.Thresholds   = HelaS3.Thresholds[Hela.Start.Thr:length(HelaS3.Thresholds)]

  Ylab = paste("F_",beta,"_Score", sep="")
  cofficent   = (1+(beta)^2)
  
  K562.Overlap     = cofficent *  (K562.Precision * K562.Recall) /(((beta)^2 *  K562.Precision) +  K562.Recall)  
  GM12878.Overlap  = cofficent *  (GM12878.Precision * GM12878.Recall) /(((beta)^2 *  GM12878.Precision) +  GM12878.Recall)   
  HelaS3.Overlap   = cofficent *  (HelaS3.Precision * HelaS3.Recall) /(((beta)^2 *  HelaS3.Precision) +  HelaS3.Recall)

  
  par(mfrow=c(1,3))
  

  plot( K562.Overlap~K562.Thresholds, lwd = 3, col='blue', type='b',pch = 2,  xlab='Threshold', ylab = Ylab, main = "K562")
  plot(GM12878.Overlap~GM12878.Thresholds, lwd =3, type = 'b', pch =2, col= 'blue', ylab=Ylab, main="GM12878", xlab='Threshold')
  plot(HelaS3.Overlap~HelaS3.Thresholds,  lwd =3, type = 'b', pch =2, col= 'blue', ylab=Ylab, main="HelaS3", xlab='Threshold')

  #legend('topleft',legend=c('K562','GM12878', 'HelaS3'), pch=c(2,3,4), text.col=c('blue', 'red', 'orange'), col=c('blue', 'red', 'orange'))

}#plot.precision.vs.recall.for.all.three.cell.lines#







precision.and.recall <- function(TFs.vs.UW.File, TFs.vs.Duke.File, Title, Model='Additive_Average', beta = 1, start.Threshold=1){
  
  UW.Data          = read.table(TFs.vs.UW.File)
  Precision.UW     = UW.Data[ , 5]
  Recall.UW        =  UW.Data[ , 6]
  Thresholds.UW    =  UW.Data[ , 1]

  Duke.Data       = read.table(TFs.vs.Duke.File)
  Precision.Duke  =  Duke.Data[ , 5]
  print(Precision.Duke)
  Recall.Duke     =  Duke.Data[ , 6]
  print(Recall.Duke )
  Thresholds.Duke = Duke.Data[ ,1]

  if (! all(Thresholds.UW ==  Thresholds.Duke)){
    print(paste("Threshlds used for UW and Duke do not look the same! check your data") )
  }
  par(mfrow = c(1,2))

  Precision.UW.limited = Precision.UW[start.Threshold:length(Precision.UW) ]
  Recall.UW.limited    = Recall.UW[start.Threshold:length(Recall.UW)   ]
  Threholds.limited    = Thresholds.UW[start.Threshold:length(Thresholds.UW )   ]

  
  

  Precision.Duke.limited = Precision.Duke[start.Threshold:length(Precision.Duke)  ]
  Recall.Duke.limited    = Recall.Duke[start.Threshold:length(Recall.Duke)  ]


  if(Model == 'Additive_Average'){
    UW.Overlap           = ( Precision.UW.limited + Recall.UW.limited )/2
    Duke.Overlap        = (Precision.Duke.limited + Recall.Duke.limited)/2
    Ylab   = paste(' (precision+recall)/2')
  }
  else if (Model == 'F_Score' ){
    Ylab = paste("F_",beta,"_Score", sep="")
    cofficent   = (1+(beta)^2)
     UW.Overlap   = cofficent *  (Precision.UW.limited   * Recall.UW.limited)   /(((beta)^2 * Precision.UW.limited) + Recall.UW.limited)
     Duke.Overlap = cofficent *  (Precision.Duke.limited * Recall.Duke.limited) /(((beta)^2 * Precision.Duke.limited) + Recall.Duke.limited)
    
  }
  else{
    stop("Unknown model!")
  }
  
  plot(UW.Overlap~Threholds.limited, lwd = 3, col = 'red', type= 'l', xlab='Threshold', ylab = Ylab, main = 'UW', ylim = c(0.45, 0.68))
  plot(Duke.Overlap~Threholds.limited, lwd = 3, col='blue', type='l', xlab='Threshold', ylab = Ylab, ylim = c(0.32, 0.55))
  #print(Threholds.limited,)
  #print(Duke.Overlap)
  #lines(Duke.Overlap~Threholds.limited, lwd = 3, col='red')
 }#precision.and.recall#


precision.vs.recall <- function(TFs.vs.UW.File, TFs.vs.Duke.File, Title = "dummy"){
  UW.Data          = read.table(TFs.vs.UW.File)
  Precision.UW     = UW.Data[ , 5]
  Recall.UW        =  UW.Data[ , 6]
  Thresholds.UW    =  UW.Data[ , 1]
  
  Duke.Data       = read.table(TFs.vs.Duke.File)
  Precision.Duke  =  Duke.Data[ , 5]
  Recall.Duke     =  Duke.Data[ , 6]
  Thresholds.Duke = Duke.Data[ ,1]
  
  if (! all(Thresholds.UW ==  Thresholds.Duke)){
    print(paste("Threshlds used for UW and Duke do not look the same! check your data") )
  }
  par(mfrow = c(1,1))
  
  Precision.UW.limited = Precision.UW[5:length(Precision.UW)]
  Recall.UW.limited    = Recall.UW[5:length(Recall.UW)]
  Threholds.limited    = Thresholds.UW[5:length(Thresholds.UW )]
  
  
  
  
  Precision.Duke.limited = Precision.Duke[5:length(Precision.Duke)]
  Recall.Duke.limited    = Recall.Duke[5:length(Recall.Duke)]
  
  plot(Threholds.limited, Recall.UW.limited,  lwd =3, pch = 2,  col='red', ylim= c(0.2,0.8))
  points(Threholds.limited, Precision.Duke.limited, lwd =3, pch =3,  col='blue')
}#precision.vs.recall#


read.recall.and.precision.data.as.table <- function(dataFile){
  Data   = read.table(dataFile)
  Data
}#read.recall.and.precision.data.as.table#

FScore <- function(precision, recall, beta){
  F = (1 + beta^2) * ( (precision*recall)/ (   (beta^2)*precision + recall    )     )
  F
}#FScore#



plot.number.of.tags.removed <- function(){
  Scores = seq(from=-2, to=4.5, by=0.5)
  K562.total.number.of.tags = 434278
  number.of.tags.at.each.threshold = c(22682, 38741, 61705, 93011, 129295, 171324, 219368, 272421, 325625, 372433, 407373, 427131, 433648, 434277)
  number.of.tags.remove = K562.total.number.of.tags
  fraction.of.tags.remove = (K562.total.number.of.tags - number.of.tags.at.each.threshold)/K562.total.number.of.tags
  #plot(Scores, fraction.of.tags.remove, type= 'h', lwd = 3, col = 'red', main = 'K562: fraction of tags removed at each score', ylab= 'fraction', xlab= 'biase scores')
  barplot( fraction.of.tags.remove, names = Scores, col = 'red', main = 'K562: fraction of tags removed at each score', ylab= 'fraction', xlab= 'biase scores', ylim = c(0,1))
}


pdf(file = "/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/PLOS_ONE_REVISION/K562_Fraction_of_Tags_Removed_at_Each_Score.pdf", height = 8, width=8)
plot.number.of.tags.removed()
dev.off()





plot.effects.of.randomly.removing.tags <- function(TFs.vs.UW.File, TFs.vs.Randomly.Removed.Tags, Title, Model='Additive_Average', beta = 1, start.Threshold=1, Cell.Line = "  "){
 
  UW.Data          = read.table(TFs.vs.UW.File)
  Precision.UW     = UW.Data[ , 5]
  Recall.UW        =  UW.Data[ , 6]
  Thresholds.UW    =  UW.Data[ , 1]

  print(Thresholds.UW)

  
  Precision.UW.limited = Precision.UW[start.Threshold:length(Precision.UW) ]
  Recall.UW.limited    = Recall.UW[start.Threshold:length(Recall.UW)   ]
  Threholds.limited    = Thresholds.UW[start.Threshold:length(Thresholds.UW )  ]


  Randomly.Removed.Tags = read.table(TFs.vs.Randomly.Removed.Tags)
  Precision.Random    = Randomly.Removed.Tags[ ,5]
  Recall.Random       = Randomly.Removed.Tags[ ,6]
  Thresholds.Random   = Randomly.Removed.Tags[ ,1]
  print(Thresholds.Random)
  
   Precision.Random.limited  =  Precision.Random[start.Threshold:length(Precision.Random)  ] 
   Recall.Random.limited     =  Recall.Random[start.Threshold:length(Recall.Random) ] 
   Thresholds.Random.limited =  Thresholds.Random[start.Threshold:length(Thresholds.Random) ]
  print(Thresholds.Random.limited)

  if(Model == 'Additive_Average'){
    UW.Overlap           = ( Precision.UW.limited + Recall.UW.limited )/2
    Random.Overlap       = (Precision.Random.limited + Recall.Random.limited  )/2
    Ylab   = paste(' (precision+recall)/2')
  }
  else if (Model == 'F_Score' ){
    Ylab = paste("F_",beta,"_Score", sep="")
    cofficent   = (1+(beta)^2)
     UW.Overlap   = cofficent *    (Precision.UW.limited   * Recall.UW.limited)   /  (((beta)^2 * Precision.UW.limited) + Recall.UW.limited)
     Random.Overlap = cofficent *  (Precision.Random.limited* Recall.Random.limited)/(((beta)^2 * Precision.Random.limited)+Recall.Random.limited) 
     
    
  }
  else{
    stop("Unknown model!")
  }
  
  plot(UW.Overlap~Threholds.limited, lwd = 3, col = 'red', type= 'l', xlab='Threshold', ylab = Ylab, main = Title, cex.lab=1.5, cex.axis=1.5, cex.main=1.5, cex.sub=1.5, ylim = c(0.28, 0.54))
  lines(Random.Overlap~Thresholds.Random.limited , lty=2, lwd =3, col='blue')
  legend('bottomright', legend= c("Removed Based On Scores", "Removed Randomly"), col= c('red', 'blue'), text.col = c('red', 'blue'), cex=1.2)
  
 }#plot.effects.of.randomly.removing.tags#

pdf(file = "/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/PLOS_ONE_REVISION/K562_And_Randomly_Removed_vs_TFs.pdf", height = 6, width=8)
#plot.effects.of.randomly.removing.tags(TFs.vs.UW.File_t_4, Randomly.Removed.Tags, "UW: K562", Model='F_Score', beta = 0.5, start.Threshold=1)
plot.effects.of.randomly.removing.tags(K562.UW.vs.TFs.File, K562.UW.Randomly.Removed.vs.TFs.File, "UW: K562", Model='F_Score', beta = 0.5, start.Threshold=4)
dev.off()
pdf(file = "/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/PLOS_ONE_REVISION/GM12878_And_Randomly_Removed_vs_TFs.pdf", height = 6, width=8)
#plot.effects.of.randomly.removing.tags(GM12878.TFs.vs.UW.File, GM12878.Randomly.Removed.Tags, "UW: GM12878", Model='F_Score', beta = 0.5, start.Threshold=1)
plot.effects.of.randomly.removing.tags(GM12878.UW.vs.TFs.File, GM12878.UW.Randomly.Removed.vs.TFs, "UW: GM12878", Model='F_Score', beta = 0.5, start.Threshold=1)
dev.off()


plot.effects.of.randomly.removing.tags(HelaS3.UW.vs.TFs.File, HelaS3.UW.Randomly.Removed.vs.TFs.File, "UW: HelaS3", Model='F_Score', beta = 0.5, start.Threshold=4)


plot.Precision.vs.Recall <- function(dataFile, randomDataFile, Title){
  data.as.table = read.table(dataFile)
  Precision   = data.as.table[ ,5]
  Recall      = data.as.table[ ,6]
  Threshold   = data.as.table[ ,1]
#ignore the last elements of the vector
  Precision = Precision[1: (length(Precision)-1)]
  Recall    = Recall[1:(length(Recall)-1)]
  Threshold = Threshold[1:(length(Threshold)-1  )]
  
  plot(Precision~Threshold, col= 'blue', lwd =3, xlab='Scores', ylab='Precision and Recall', ylim= c(0.2,0.95), pch='P', type='b', main = Title)
  lines(Recall~Threshold, col= 'blue', lwd =3,pch ='R', type='b')

  random.data.as.table = read.table(randomDataFile)
  R.Precision    = random.data.as.table[,5]
  R.Recall       = random.data.as.table[,6]
  R.Threshold      = random.data.as.table[, 1] 
  lines(R.Precision~R.Threshold, col= 'red', lwd =3,pch ='P', type='b')
  lines(R.Recall~R.Threshold, col= 'red', lwd =3,pch ='R', type='b')
  legend(2.6,0.6, legend= c("Removed Based On Scores", "Removed Randomly"), col= c('blue', 'red'), text.col = c('red', 'blue'))
}##
