source("some_handy_functions.r")

Hotspot.vs.F.Seq <- read.table(file = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/testing_hotspot_vs_f_seq.txt")


TFs.vs.F.Seq <- read.table(file = "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/testing_29TFs_vs_f_seq.txt")
TFs.vs.MACS <- read.table("/nfs/th_group/hk3/MACS_ANALYSIS/UW/K562/29TFs_vs_MACS.txt")




plot.coverage.vs.ppv.v2("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/29TFs_vs_F_SEQ.txt",
                        "/nfs/th_group/hk3/MACS_ANALYSIS/UW/K562/29TFs_vs_MACS.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/HelaS3_TFs_vs_DHS/ZINBA_Vs_29TFs_Broad.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/HelaS3_TFs_vs_DHS/ZINBA_Vs_29TFs_Narrow.txt",
                        "K562")

                       plot.coverage.vs.ppv.v3("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_Full_Sets_of_TFs_vs_F_Seq.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_Full_Set_of_TFs_vs_MACS.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_TFs_vs_ZINBA_BROAD_2.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_TFs_vs_ZINBA_NARROW_2.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_Full_Sets_of_TFs_vs_ENCODE.txt",
                        "K562")



plot.f.beta.scores("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_Full_Sets_of_TFs_vs_F_Seq.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_Full_Set_of_TFs_vs_MACS.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_TFs_vs_ZINBA_BROAD_2.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_TFs_vs_ZINBA_NARROW_2.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_K562_Full_Sets_of_TFs_vs_ENCODE.txt",
                   1.5)                       


plot.coverage.vs.ppv.v3("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_13_K562_TFs_vs_F_SEQ.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_13_K562_TFs_vs_MACS.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/ZINBA_Broad_Vs_Union_of_13_K562_TFs.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/ZINBA_Narrow_Vs_Union_of_13_K562_TFs.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_13_K562_TFs_vs_ENCODE_DHS.txt")

plot.f.beta.scores("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_of_13_K562_TFs_vs_F_SEQ.txt",
                   "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_13_K562_TFs_vs_MACS.txt",
                   "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/ZINBA_Broad_Vs_Union_of_13_K562_TFs.txt",
                   "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/ZINBA_Narrow_Vs_Union_of_13_K562_TFs.txt",
                   "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/K562/Union_13_K562_TFs_vs_ENCODE_DHS.txt",
                   1)



#Gm12878 
plot.coverage.vs.ppv.v3("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_F_SES.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_MACS.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ZINBA_BROAD.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ZINBA_NARROW.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ENCODE_HOTSPOTS.txt",
                        "GM12878")

plot.coverage.vs.ppv.v3("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_13_Common_TFs_vs_F_Seq.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_13_Common_TFs_vs_MACS.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_13_Common_TFs_vs_ZINBA_BROAD.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_13_Common_TFs_vs_ZINBA_NARROW.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_13_Common_TFs_vs_ENCODE.txt",
                        "GM12878-Common TFs")

plot.f.beta.scores("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_F_SES.txt",
                   "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_MACS.txt",
                   "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ZINBA_BROAD.txt",
                   "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ZINBA_NARROW.txt",
                   "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ENCODE_HOTSPOTS.txt",
                   1.5)


#Helas3
plot.coverage.vs.ppv.v3("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_F_SES.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_MACS.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_ZINBA_BROAD.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_ZINBA_NARROW.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_ENCODE_HOTSPOTS.txt",
                        "Helas3")

plot.coverage.vs.ppv.v3("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_13_Common_TFs_vs_F_Seq.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_13_Common_TFs_vs_MACS.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_13_Common_TFs_vs_ZINBA_BROAD.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_13_Common_TFs_vs_ZINBA_NARROW.txt",
                        "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_13_Common_TFs_vs_ENCODE.txt",
                        "Helas3 Common TFs")


plot.f.beta.scores("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_F_SES.txt",
                   "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_MACS.txt",
                   "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_ZINBA_BROAD.txt",
                   "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_ZINBA_NARROW.txt",
                   "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Helas3/Union_of_Helas3_TFs_vs_ENCODE_HOTSPOTS.txt",
                   1.5)




plot.coverage.vs.ppv.v2 <- function(tfs.vs.fseq.output.file, tfs.vs.macs.output.file, tfs.vs.zinba.broad.peaks.file, tfs.vs.zinba.narrow.peaks.file, cill.line = ""){
  TFs.vs.F.Seq         = read.table(tfs.vs.fseq.output.file)
  TFs.vs.MACS          = read.table(tfs.vs.macs.output.file)

  TFs.vs.ZINBA.Broad       = read.table(tfs.vs.zinba.broad.peaks.file)
  ZINBA.COVERAGE.BROAD     = TFs.vs.ZINBA.Broad[, 5]
  ZINBA.PPV.BROAD          = TFs.vs.ZINBA.Broad[, 6]

  ZINBA.BROAD.COV.DEFAULT  = 0.335649
  ZINBA.BROAD.PPV.DEFAULT  = 0.587457
  
  TFs.vs.ZINBA.Narrow      = read.table(tfs.vs.zinba.narrow.peaks.file)
  ZINBA.COVERAGE.NARROW    = TFs.vs.ZINBA.Narrow[, 5]
  ZINBA.PPV.NARROW         = TFs.vs.ZINBA.Narrow[, 6]
  ZINBA.NARROW.COV.DEFAULT = 0.570978
  ZINBA.NARROW.PPV.DEFAULT = 0.300537
  
  FSEQ.COVERAGE        = TFs.vs.F.Seq[ , 4]
  FSEQ.PPV             = TFs.vs.F.Seq[ , 5]
  MACS.COVERAGE        = TFs.vs.MACS[ , 5]
  MACS.PPV             = TFs.vs.MACS[ , 6]
  MACS.COVERAGE.DEFAULT= 0.729566
  MACS.PPV.DEFAULT     = 0.335838
  HOTSPOT.COVERAGE     = 0.588755
  HOTSPLOT.PPV         = 0.458
  

  
  plot(1-FSEQ.PPV, FSEQ.COVERAGE, xlab = 'FDR=FP/(FP+TP)', ylab = 'TPR=TP/(TP+FN)', xlim = c(0.1,0.9), ylim = c(0.1,0.9) , lwd =3, col = 'orange', type='b', main = cell.line, pch =3)
  lines(1-MACS.PPV, MACS.COVERAGE, lwd = 3, col='red', type='b', pch=4)
  points(1-MACS.PPV.DEFAULT, MACS.COVERAGE.DEFAULT, lwd=3, pch=1)
  points(1-HOTSPLOT.PPV, HOTSPOT.COVERAGE, col = 'green', lwd =3 , pch=2)
  lines(1- ZINBA.PPV.BROAD, ZINBA.COVERAGE.BROAD, col= 'blue', lwd = 3, pch = 5, type='b' )
  points(1-ZINBA.BROAD.PPV.DEFAULT, ZINBA.BROAD.COV.DEFAULT, lwd=3, pch=1 )
  lines(1- ZINBA.PPV.NARROW, ZINBA.COVERAGE.NARROW, col= 'coral4', lwd = 3, pch = 11, type='b' )
  points(1-ZINBA.NARROW.PPV.DEFAULT, ZINBA.NARROW.COV.DEFAULT, lwd =3 )
  fseq.default.coverage = 0.772194
  fseq.default.ppv      = 0.347717
  points(1-fseq.default.ppv, fseq.default.coverage, lwd=3, pch=1)
  #abline(h = fseq.default.coverage, lty='dashed', col='grey')
  #abline(v= 1-fseq.default.ppv, lty='dashed', col='grey')
 
  
  legend('topleft', legend= c("Hotspot", "F_Seq", "MACS", "ZINBA_NARROW", "ZINBA_BROAD"), col = c('green', 'orange', 'red', 'blue','coral4'), pch = c(2,3,4,5,11), text.col =  c("green", "orange", "red", "blue", 'coral4'))
  
}#plot.coverage.vs.ppv.v2#


F.Beta.Scores <- function(beta, precision, recall){
  f = (1+beta^2) *(  (precision*recall)/( (beta^2)*precision + recall) )
  f
}#F.Beta.Scores#

plot.f.beta.scores <- function(file.name, macs.file.name, zinba.broad.file, zinba.narrow.data, encode.file,  beta){
  par(mfrow=c(2,2))
  YLab = paste("F_",beta,sep="")
  
  #fses
  data        = read.table(file.name)
  thresholds  = data[ , 1]
  pre         = data[ , 6]
  rec         = data[ , 5]
  f           = F.Beta.Scores(beta, pre, rec)
  plot(f~ thresholds, col='orange', lwd=3, type='l', ylim= c(0.2, 0.8),xlab="threshold",ylab=YLab,main="F-SEQ and Hotspot")
  
  #encode
  encode.data = read.table(encode.file)
  encode.pre  = encode.data[ , 5]
  encode.rec  = encode.data[ , 4]
  encode.f    = F.Beta.Scores(beta, encode.pre, encode.rec)
  points(encode.f, col='green', lwd=3)


#macs
  macs.data       = read.table(macs.file.name)
  macs.pre        = macs.data[ , 6]
  macs.rec        = macs.data[ , 5]
  macs.threshold  =  macs.data[ , 1]
  macs.f          = F.Beta.Scores(beta, macs.pre, macs.rec)
  plot(macs.f~macs.threshold, col='red', lwd=3, type='l', xlab="threshold", ylab=YLab, main="MACS")

#zina.broad
  zinba.broad.data      = read.table(zinba.broad.file)
  zinba.broad.pre       = zinba.broad.data[ , 6]
  zinba.broad.rec       = zinba.broad.data[ , 5]
  zinba.broad.threholds = zinba.broad.data[ , 1]
  zinba.broad.f         = F.Beta.Scores(beta,  zinba.broad.pre,  zinba.broad.rec)
  plot(zinba.broad.f~zinba.broad.threholds, col='brown', lwd=3, type='l', xlab="threshold", ylab=YLab, main="ZINBA_BROAD")

 #zinba.narrow
  zinba.narrow.data       = read.table(zinba.narrow.data)
  zinba.narrow.pre        =  zinba.narrow.data[ , 6]
  zinba.narrow.rec        =  zinba.narrow.data[ , 5]
  zinba.narrow.thresholds =  zinba.narrow.data[ , 1]
  zinba.narrow.f          =  F.Beta.Scores(beta, zinba.narrow.pre, zinba.narrow.rec )
  plot(zinba.narrow.f~zinba.narrow.thresholds, col='blue', lwd=3, type='l', xlab="threshold", ylab=YLab, main="ZINAB_NARROW")

   
}#plot.f.beta.scores#

get.length.from.npf <- function(ApeakFile){
  L = list()
  data = read.table(ApeakFile)
  number.of.peaks = nrow(data)
  L$Number   = number.of.peaks
  len =  data[,3]-data[,2]
  L$Lengths = len
  L
}#get.length.from.npf#


peak.summary.of.statistics <- function(zinba.narrow.peaks.file, zinba.broad.peaks.file, macs.peaks.file, fseq.peaks.file, hotspot.peaks.file, cell.line='' ){
  zinba.narrow <-  get.length.from.npf(zinba.narrow.peaks.file)
  zinba.narrow.lengths = zinba.narrow$Lengths
  zinba.narrwo.number.of.peaks = zinba.narrow$Number
  print(zinba.narrwo.number.of.peaks)

  #zinba broad
  zinba.broad <-  get.length.from.npf(zinba.broad.peaks.file)
  zinba.braod.lengths = zinba.broad$Lengths
  zinba.broad.number.of.peaks = zinba.broad$Number
  print(zinba.broad.number.of.peaks)

  #MACS
  macs <- get.length.from.npf(macs.peaks.file)
  macs.lengths = macs$Lengths
  macs.number.of.peaks = macs$Number
  print(macs.number.of.peaks)

  #FSEQ
  fseq <- get.length.from.npf(fseq.peaks.file)
  fseq.lengths = fseq$Lengths
  fseq.number.of.peaks = fseq$Number
  print(fseq.number.of.peaks)

  #HOTSPOT

  hotspot <- get.length.from.npf(hotspot.peaks.file)
  hotspot.lengths = hotspot$Lengths
  hotspot.number.of.peaks = hotspot$Number
  print(hotspot.number.of.peaks)
  
  List = list()
  List$ZN     = zinba.narrow.lengths
  List$ZB     =  zinba.braod.lengths
  List$MACS   =  macs.lengths
  List$FSEQ   = fseq.lengths
  List$HOTSPOT= hotspot.lengths
  
  Number.of.peaks = c(zinba.narrwo.number.of.peaks, zinba.broad.number.of.peaks, macs.number.of.peaks, fseq.number.of.peaks, hotspot.number.of.peaks)
  
  
   #par(mfrow=c(2,1))
  layout(matrix(c(1,2), 2, 1, byrow = TRUE), widths=c(1,1), heights=c(2,1))
    boxplot(List, col=c('red','blue', 'green', 'orange','grey'), names=c('ZINBA_NARROW', 'ZINBA_BROAD', 'MACS', 'F_SEQ','ENCODE_DHS'), at= c(0.7, 1.9, 3.1, 4.3, 5.4), ylab='lengths', main=cell.line)
  barplot(Number.of.peaks,  col=c('red','blue', 'green', 'orange','grey'), names=c('ZINBA_NARROW', 'ZINBA_BROAD', 'MACS', 'F_SEQ','ENCODE_DHS'), ylab='number of peaks')

  
}#peak.summary.of.statistics#


zinba.narrow.file <- "/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/K562/NPF_Files/ZINBA_OUT_FDR_0.05_narrow_peaks.npf"
zinba.broad.file  <- "/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/K562/NPF_Files/ZINBA_OUT_FDR_0.05_broad_peaks.npf"
macs.file         <- "/nfs/th_group/hk3/MACS_ANALYSIS/UW/K562/K562_0.05_peaks.encodePeak"
fseq.file <- "/nfs/th_group/hk3/Hotspot_vs_F_Seq/UW/K562/F_Seq_Outputs_for_different_t_Parameters/chr22_t_4.npf"
hotspot.file <- "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/K562_Encode_hotspots.npf"

zinba.narraw.data <- peak.summary.of.statistics(zinba.narrow.file, zinba.broad.file, macs.file, fseq.file, hotspot.file, cell.line='K562')





plot.coverage.vs.ppv.v3 <- function(tfs.vs.fseq.output.file, tfs.vs.macs.output.file, tfs.vs.zinba.broad.peaks.file, tfs.vs.zinba.narrow.peaks.file, tfs.vs.encode.dhs.file, cell.line=" "){
  TFs.vs.F.Seq         = read.table(tfs.vs.fseq.output.file)
  TFs.vs.MACS          = read.table(tfs.vs.macs.output.file)

  TFs.vs.ZINBA.Broad       = read.table(tfs.vs.zinba.broad.peaks.file)
  ZINBA.COVERAGE.BROAD     = TFs.vs.ZINBA.Broad[, 5]
  ZINBA.PPV.BROAD          = TFs.vs.ZINBA.Broad[, 6]

  ZINBA.BROAD.COV.DEFAULT  = 0.346447
  ZINBA.BROAD.PPV.DEFAULT  = 0.394756
  
  TFs.vs.ZINBA.Narrow      = read.table(tfs.vs.zinba.narrow.peaks.file)
  ZINBA.COVERAGE.NARROW    = TFs.vs.ZINBA.Narrow[, 5]
  ZINBA.PPV.NARROW         = TFs.vs.ZINBA.Narrow[, 6]
  ZINBA.NARROW.COV.DEFAULT = 0.560663
  ZINBA.NARROW.PPV.DEFAULT = 0.192124
  
  FSEQ.COVERAGE        = TFs.vs.F.Seq[ , 5]
  FSEQ.PPV             = TFs.vs.F.Seq[ , 6]
  MACS.COVERAGE        = TFs.vs.MACS[ , 5]
  MACS.PPV             = TFs.vs.MACS[ , 6]
  MACS.COVERAGE.DEFAULT= 0.709623
  MACS.PPV.DEFAULT     = 0.212664

  TF.vs.ENCODE         = read.table(tfs.vs.encode.dhs.file)
  HOTSPOT.COVERAGE     = TF.vs.ENCODE[,4]
  HOTSPLOT.PPV         = TF.vs.ENCODE[ ,5]
  

  
  plot(1-FSEQ.PPV, FSEQ.COVERAGE, main = cell.line,  xlab = 'FDR=FP/(FP+TP)', ylab = 'TPR=TP/(TP+FN)', xlim = c(0.1,1), ylim = c(0.1,1) , lwd =3, col = 'orange', type='b', pch =3)
  lines(1-MACS.PPV, MACS.COVERAGE, lwd = 3, col='red', type='b', pch=4)
  #points(1-MACS.PPV.DEFAULT, MACS.COVERAGE.DEFAULT, lwd=3, pch=1)
  points(1-HOTSPLOT.PPV, HOTSPOT.COVERAGE, col = 'green', lwd =3 , pch=2)
  lines(1- ZINBA.PPV.BROAD, ZINBA.COVERAGE.BROAD, col= 'blue', lwd = 3, pch = 5, type='b' )
  #points(1-ZINBA.BROAD.PPV.DEFAULT, ZINBA.BROAD.COV.DEFAULT, lwd=3, pch=1 )
  lines(1- ZINBA.PPV.NARROW, ZINBA.COVERAGE.NARROW, col= 'coral4', lwd = 3, pch = 11, type='b' )
  #points(1-ZINBA.NARROW.PPV.DEFAULT, ZINBA.NARROW.COV.DEFAULT, lwd =3 )
  fseq.default.coverage = 0.779565
  fseq.default.ppv      = 0.228535
  #points(1-fseq.default.ppv, fseq.default.coverage, lwd=3, pch=1)
  #abline(h = fseq.default.coverage, lty='dashed', col='grey')
  #abline(v= 1-fseq.default.ppv, lty='dashed', col='grey')
 
  
  legend('topleft', legend= c("Hotspot", "F_Seq", "MACS", "ZINBA_NARROW", "ZINBA_BROAD"), col = c('green', 'orange', 'red', 'blue','coral4'), pch = c(2,3,4,5,11), text.col =  c("green", "orange", "red", "blue", 'coral4'))
  
}#plot.coverage.vs.ppv.v3#




#######################################################################################################

plot.coverage.vs.ppv <- function(DF, DF.TFs.vs.MACS){
    covrage.data.as.matrix   = matrix(DF[ ,4], nrow = 10, ncol= 7, byrow = TRUE)
    ppv.data.as.matrix       = matrix(DF[ ,5], nrow = 10, ncol= 7, byrow = TRUE)
    Coverage.Mean.Over.Length  = rowMeans(covrage.data.as.matrix)
    PPV.Mean.Over.Length       = rowMeans(ppv.data.as.matrix)
    plot(1- PPV.Mean.Over.Length,  Coverage.Mean.Over.Length, lwd =3, col = 'orange', type='l', xlab='1-ppv',xlim= c(0.5, 0.8), ylab= 'coverage',ylim= c(0.2, 0.9), main = "coverage vs ppv")
    cov=0.588755
    ppv=0.458
    points(1-ppv, cov, lwd=3, col = 'green')
    MACS.COVERAGE = DF.TFs.vs.MACS[, 4]
    MACS.PPV      = DF.TFs.vs.MACS[, 5]
    lines(1-MACS.PPV, MACS.COVERAGE, lwd =3, col='red')

    
    legend('topleft', legend= c("Hotspot", "F_Seq", "MACS"), col = c('green', 'orange', 'red'), pch = c(2,3,4), text.col =  c("green", "orange", "red"))

  }



plot.data <- function(df){
  T = seq(0.5, 5, by = 0.5)
  L = seq(200, 800, by = 100)

#pdf("/nfs/th_group/hk3/Hotspot_vs_F_Seq/UW/K562/F_Seq_Outputs_for_diff_parameters/fseq_vs_hotspot_for_diff_ts.pdf")
par(mfrow= c(1,2))

  covrage.data.as.matrix   = matrix(df[ ,4], nrow = 10, ncol= 7, byrow = TRUE)
  ppv.data.as.matrix       = matrix(df[ ,5], nrow = 10, ncol= 7, byrow = TRUE)
Coverage.Mean.Over.Length  = rowMeans(covrage.data.as.matrix)
PPV.Mean.Over.Length       = rowMeans(ppv.data.as.matrix)
Mean.of.both = (Coverage.Mean.Over.Length+  PPV.Mean.Over.Length)/2

Range = range(Coverage.Mean.Over.Length, PPV.Mean.Over.Length)
plot(T, Coverage.Mean.Over.Length, type='l', lwd =3, col='red', ylim=Range, xlab='t threshold', ylab = "fraction of coverage and ppv" , main = "coverage and ppv vs FDR threshold")
lines(T, PPV.Mean.Over.Length, lwd=3, col='blue')
lines(T, Mean.of.both, lwd = 3, col='green')
abline(v=4, col='grey', lty='dashed', lwd = 3)

    legend('topright', legend= c("coverage", "ppv", "coverage+ppv/2"), col = c("red", "blue", 'green'), pch= c(2,3,4), text.col =  c("red", "blue", "green"))

  plot( PPV.Mean.Over.Length,   Coverage.Mean.Over.Length, lwd =3, col = 'orange', type='l', xlab='ppv', ylab= 'coverage', ylim = c(), main = "coverage vs ppv")
  cov=0.588755
  ppv=0.458
  points(ppv, cov, lwd=3, col = 'green')
    
  #}



}




Gm12878_DHS_df = bed.as.data.frame("/nfs/th_group/hk3/Hotspot_vs_F_Seq/UW/Gm12878/wgEncodeUwDnaseGm12878HotspotsRep1_chr22.broadPeak")
Gm12287_Length = Gm12878_DHS_df$end - Gm12878_DHS_df$start
hist(Gm12287_Length, xlab = "length", main = "Gm12878 DHS lengths", breaks = 100, col ='red', ylim  = c(0,30000), xlim= c(0,8000))

for (t in c(0.5, 1, 1.5, 2, 2.5)){
  for (l in c(200, 300, 400, 500, 600, 700, 800)){
    File = paste("/nfs/th_group/hk3/Hotspot_vs_F_Seq/UW/Gm12878/chr22_t_",t,"_l_",l,".npf", sep = "")
    Main = paste("t=",t ," l = ", l, sep= " ")
    #print(File)
    df =  bed.as.data.frame(File)
    Lengths = df$end - df$start
    hist(Lengths, xlab = "length", main = Main, breaks = 100, col ='blue', ylim  = c(0,30000), xlim= c(0,8000))

  }
}



plot.average.of.precision.and.recall <- function(fseqDataFile, macsDataFile, zinbaBDataFile, zinbaNDataFile, HotspotDataFile){
  par(mfrow=c(1,2))
  fseqData <- read.table(fseqDataFile)
  Pre <- fseqData[ ,5]
  Rec <- fseqData[ ,6 ]
  Thre <- fseqData[ ,1]
  Average <- (Pre+Rec)/2
  plot(Thre, Average, col='red', lwd=3, type='b', ylim=c(0.4,1))

  #hotspot
  hotspotData <- read.table(HotspotDataFile)
  hotspot.Pre <- hotspotData[ ,4]
  hotspot.Rec <- hotspotData[ ,5]
  hotspot.Average = (hotspot.Pre + hotspot.Rec)/2
  points(hotspot.Average, col='green', lwd=3)

  #macs
  macsData <- read.table(macsDataFile)
  macs.Pre <- macsData[ ,5]
  macs.Rec <- macsData[ ,6]
  macs.Thre <- macsData[ ,1]
  macs.Average <- (macs.Pre + macs.Rec)/2
  plot(macs.Thre, macs.Average, col='blue', lwd=3, type='b', ylim=c(0.4,1))

  #zinba Narrow
  zinbaNarrowData <- read.table(zinbaNDataFile)
  zinba.Narrow.Pre <- zinbaNarrowData[ ,5]
  zinba.Narrow.Rec <- zinbaNarrowData[ ,6]
  zinba.Narrow.Thre <- zinbaNarrowData[ ,1]
  zinba.Narrow.Average <- (zinba.Narrow.Pre+zinba.Narrow.Rec)
  points( zinba.Narrow.Thre,zinba.Narrow.Average, lwd=3, type='b', col='brown')
  
  #zinba Broad
  zinbaBroadData <- read.table(zinbaBDataFile)
  zinba.Broad.Pre <- zinbaBroadData[ ,5]
  zinba.Broad.Rec <- zinbaBroadData[ ,6]
  zinba.Broad.Thre <- zinbaBroadData[ ,1]
  zinba.Broad.Average <- (zinba.Broad.Pre+zinba.Broad.Rec)/2
  points(zinba.Broad.Thre, zinba.Broad.Average, lwd=3, type='b', col='yellow')
 
 
}#plot.average.of.precision.and.recall#

plot.average.of.precision.and.recall("/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_F_SES.txt",
                                     "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_MACS.txt",
                                     "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ZINBA_BROAD.txt",
                                     "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ZINBA_NARROW.txt",
                                     "/nfs/users/nfs_h/hk3/My_CPlusPlus/Overlaps_in_Beds/Benchmarking_of_Peak_Callers/Gm12878/Union_of_Gm12878_TFs_vs_ENCODE_HOTSPOTS.txt"
                                     )


make.bar.plots.from.hotspos.vs.fseq <- function(dataFile, Main){
  df = read.table(dataFile)
  barplot(df[,6]*100, main  = Main, ylab= " 100*(ppv+coverage)/2", names.arg = c("TF vs HS", "TF vs FSEQ", "HS vs FSEQ"), ylim = c(0,100), col = 'grey')
}



pdf("/nfs/users/nfs_h/hk3/My_R_Scripts/Figures/Hotspot_vs_F_Seq/ppv_and_coverage.pdf", height = 8, width=10)
par(mfrow=c(2,3))
make.bar.plots.from.hotspos.vs.fseq("/nfs/th_group/hk3/Hotspot_vs_F_Seq/UW/Gm12878/Gm12878_overlap_results.txt", "Gm12878")
make.bar.plots.from.hotspos.vs.fseq("/nfs/th_group/hk3/Hotspot_vs_F_Seq/UW/K562/K562_overlap_results.txt", "K562")
 make.bar.plots.from.hotspos.vs.fseq("/nfs/th_group/hk3/Hotspot_vs_F_Seq/UW/H1hesc/H1hesc_overlap_results.txt", "H1hesc")
 make.bar.plots.from.hotspos.vs.fseq("/nfs/th_group/hk3/Hotspot_vs_F_Seq/UW/Hsmm/Hsmm_overlap_results.txt", "Hsmm")
 make.bar.plots.from.hotspos.vs.fseq("/nfs/th_group/hk3/Hotspot_vs_F_Seq/UW/Helas3/Helas3_overlap_results.txt", "Helas3")
dev.off()
