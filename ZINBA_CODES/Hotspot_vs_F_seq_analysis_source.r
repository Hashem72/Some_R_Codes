FSEQ  <- list(THRESHOLDS=c(0.001, 0.01, 0.1, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6.5), DEFAULT=4  )
MACS  <- list(THRESHOLDS=c(0.001, 0.01,  0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.2, 0.3), DEFAULT=0.05 )
ZINBA <- list(THRESHOLDS=c(0.001, 0.005, 0.01, 0.02, 0.03, 0.04,  0.05, 0.06, 0.08, 0.09,  0.1, 0.2, 0.3), DEFAULT= 0.05)
HOTSPOT <- list(THRESHOLDS=c(0.001, 0.005, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.2, 0.3), DEFAULT= 0.05 )


#MACS$THRESHOLDS    <- c(0.001, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.08, 0.09, 0.1, 0.2, 0.3, 0.4, 0.5 )
#MACS$DEFAULT       <- 0.05

#ZINBA$THRESHOLDS   <- c(0.001, 0.005, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.08, 0.09, 0.1, 0.2, 0.3, 0.4)
#ZINBA$DEFAULT      <- 0.05

plot.precision.vs.recall <- function(tfs.vs.fseq.output.file,
                                     tfs.vs.macs.output.file,
                                     tfs.vs.zinba.broad.peaks.file,
                                     tfs.vs.zinba.narrow.peaks.file,
                                     tfs.vs.encode.dhs.file,
                                     tfs.vs.hotspot.output.file,
                                     cell.line=" ",
                                     fseq,
                                     macs,
                                     zinba,
                                     hotspot){
  #fseq
  TFs.vs.F.Seq                    = read.table(tfs.vs.fseq.output.file)
  fseq.applied.thresholds.indices = match(fseq$THRESHOLDS, TFs.vs.F.Seq[ ,1] )
  TFs.vs.F.Seq                    = TFs.vs.F.Seq[fseq.applied.thresholds.indices, ]
  FSEQ.COVERAGE                   = TFs.vs.F.Seq[ , 5]
  FSEQ.PPV                        = TFs.vs.F.Seq[ , 6]
 plot(1-FSEQ.PPV, FSEQ.COVERAGE, main = cell.line,  xlab = 'FDR=FP/(FP+TP)', ylab = 'TPR=TP/(TP+FN)', xlim = c(0.1,1), ylim = c(0.1,1) , lwd =3, col = 'orange', type='b', pch =20)
  fseq.default.index =which(TFs.vs.F.Seq[ ,1] == fseq$DEFAULT )
  fseq.default.coverage = TFs.vs.F.Seq[fseq.default.index, 5]
  fseq.default.ppv      = TFs.vs.F.Seq[fseq.default.index, 6]
  points(1-fseq.default.ppv, fseq.default.coverage, lwd=3, pch=20)



  #macs
  TFs.vs.MACS                     = read.table(tfs.vs.macs.output.file)
  macs.applied.thresholds.indices = match(macs$THRESHOLDS, TFs.vs.MACS[ ,1] )
  TFs.vs.MACS                     = TFs.vs.MACS[macs.applied.thresholds.indices, ]
  MACS.COVERAGE                   = TFs.vs.MACS[ , 5]
  MACS.PPV                        = TFs.vs.MACS[ , 6]
  lines(1-MACS.PPV, MACS.COVERAGE, lwd = 3, col='red', type='b', pch=20)
  macs.default.index = which(TFs.vs.MACS[,1] == macs$DEFAULT)
  macs.coverage.default = TFs.vs.MACS[macs.default.index, 5] 
  macs.ppv.default      = TFs.vs.MACS[macs.default.index, 6]
  points(1-macs.ppv.default, macs.coverage.default, lwd=3, pch=20)


  #zinba
  TFs.vs.ZINBA.Broad               = read.table(tfs.vs.zinba.broad.peaks.file)
  zinba.applied.thresholds.indices = match(zinba$THRESHOLDS,TFs.vs.ZINBA.Broad[ ,1] )
  TFs.vs.ZINBA.Broad               = TFs.vs.ZINBA.Broad[zinba.applied.thresholds.indices, ]
  ZINBA.COVERAGE.BROAD             = TFs.vs.ZINBA.Broad[, 5]
  ZINBA.PPV.BROAD                  = TFs.vs.ZINBA.Broad[, 6]
  lines(1- ZINBA.PPV.BROAD, ZINBA.COVERAGE.BROAD, col= 'blue', lwd = 3, pch = 20, type='b' )
  zinba.default.index = which(TFs.vs.ZINBA.Broad[ ,1]==zinba$DEFAULT)
  zinba.broad.coverage.default =  TFs.vs.ZINBA.Broad[zinba.default.index, 5]
  zinba.broad.ppv.default =  TFs.vs.ZINBA.Broad[zinba.default.index, 6]
  points(1-zinba.broad.ppv.default, zinba.broad.coverage.default, lwd=3, pch=20)
  
  
  TFs.vs.ZINBA.Narrow      = read.table(tfs.vs.zinba.narrow.peaks.file)
  zinba.narrow.thresholds.indices = match(zinba$THRESHOLDS,  TFs.vs.ZINBA.Narrow[ ,1] )
  TFs.vs.ZINBA.Narrow      = TFs.vs.ZINBA.Narrow[zinba.narrow.thresholds.indices, ]
  ZINBA.COVERAGE.NARROW    = TFs.vs.ZINBA.Narrow[, 5]
  ZINBA.PPV.NARROW         = TFs.vs.ZINBA.Narrow[, 6]
  lines(1- ZINBA.PPV.NARROW, ZINBA.COVERAGE.NARROW, col= 'coral4', lwd = 3, pch = 20, type='b' )
  zinba.narrow.coverage.default =TFs.vs.ZINBA.Narrow[zinba.default.index, 5]
  zinba.narrow.ppv.default      =TFs.vs.ZINBA.Narrow[zinba.default.index, 6]
  points(1-zinba.narrow.ppv.default, zinba.narrow.coverage.default, lwd=3, pch=20)
  #zinba.default.index = which()
  
  
  #HOTSPOT
  TFs.vs.HOTSPOT              = read.table(tfs.vs.hotspot.output.file)
  hotspot.thresholds.indices  = match(hotspot$THRESHOLDS, TFs.vs.HOTSPOT[ ,1])
  TFs.vs.HOTSPOT              = TFs.vs.HOTSPOT[hotspot.thresholds.indices, ]
  HOTSPOT.COVERAGE            = TFs.vs.HOTSPOT [ , 5]
  HOTSPOT.PPV                 = TFs.vs.HOTSPOT [ , 6]
  lines(1-HOTSPOT.PPV, HOTSPOT.COVERAGE, col='darkmagenta', lwd=3, pch=20, type='b')
  hotspot.default.index       = which(TFs.vs.HOTSPOT[ , 1] == hotspot$DEFAULT )
  hotspot.coverage.default    = TFs.vs.HOTSPOT[hotspot.default.index, 5]
  hotspot.ppv.default         =  TFs.vs.HOTSPOT[hotspot.default.index, 6]
  points(1-hotspot.ppv.default, hotspot.coverage.default, lwd=3, pch=20)


  #ENCODE
  TF.vs.ENCODE         = read.table(tfs.vs.encode.dhs.file)
  HOTSPOT.COVERAGE     = TF.vs.ENCODE[,4]
  HOTSPLOT.PPV         = TF.vs.ENCODE[ ,5]
  points(1-HOTSPLOT.PPV, HOTSPOT.COVERAGE, col = 'darkgreen', lwd =3 , pch=20)
  
 
  
  legend('topleft', legend= c("F_Seq", "Hotspot", "DHS",  "MACS", "ZINBA_B", "ZINBA_N"), col = c( 'orange', 'darkmagenta', 'darkgreen','red', 'coral4', 'blue'), pch = c(1,1,1,1,1,1), text.col =  c('orange', 'darkmagenta', 'darkgreen','red', 'coral4', 'blue'))
  
}#plot.precision.vs.recall#


F.Beta.Scores <- function(beta, precision, recall){
  f = (1+beta^2) *(  (precision*recall)/( (beta^2)*precision + recall) )
  f
}#F.Beta.Scores#

plot.f.beta.scores.v2 <- function(file.name,
                               macs.file.name,
                               zinba.broad.file,
                               zinba.narrow.data,
                               encode.file,
                               hotspot.file,
                               beta,
                               fseq,
                               macs,
                               zinba,
                               hotspot){
  par(mfrow=c(2,3))
  YLab = paste("F_",beta,sep="")
  
  #fseq
  data        = read.table(file.name)
  fseq.applied.thresholds.indices = match(fseq$THRESHOLDS, data[ ,1])
  data        = data[fseq.applied.thresholds.indices, ]
  thresholds  = data[ , 1]
  pre         = data[ , 5]
  rec         = data[ , 6]
  f           = F.Beta.Scores(beta, pre, rec)
  plot(f~ thresholds, col='orange', lwd=3, type='l', ylim= c(0.3, 0.8),xlab="threshold",ylab=YLab,main="F-SEQ")
  fseq.default = which(data[ ,1]==fseq$DEFAULT)
  fseq.pre.default = data[fseq.default, 5]
  fseq.rec.default = data[fseq.default, 6]
  f.default = F.Beta.Scores(beta, fseq.pre.default, fseq.rec.default)
  points(data[fseq.default,1], f.default,lwd=3, pch=1 )
  
  #hotspot
  hotspot.data                          = read.table(hotspot.file)
  hotspot.applied.thresholds.indices    = match(hotspot$THRESHOLDS, hotspot.data[ ,1])
  hotspot.data                          = hotspot.data[hotspot.applied.thresholds.indices, ]
  hotspot.thresholds                    = hotspot.data[ , 1]
  hotspot.pre                           = hotspot.data[ , 5]
  hotspot.rec                           = hotspot.data[ , 6]
  hotspot.f                             = F.Beta.Scores(beta, hotspot.pre, hotspot.rec)
  plot(hotspot.f~hotspot.thresholds, col='darkmagenta', lwd=3, type='l', ylim= c(0.3, 0.8),xlab="threshold",ylab=YLab,main="Hotspot")
  hotspot.default  = which( hotspot.data == hotspot$DEFAULT)
  hotspot.pre.default = hotspot.data[hotspot.default, 5]
  hotspot.rec.default = hotspot.data[hotspot.default, 6]
  hotspot.f.default   = F.Beta.Scores(beta, hotspot.pre.default, hotspot.rec.default)
  points(hotspot.data[hotspot.default, 1], hotspot.f.default, lwd=3, pch=1)
  
  
  #encode
  #encode.data = read.table(encode.file)
  #encode.pre  = encode.data[ , 4]
  #encode.rec  = encode.data[ , 5]
  #encode.f    = F.Beta.Scores(beta, encode.pre, encode.rec)
  #points(encode.f, col='green', lwd=3)


  
  
#macs
  macs.data                       = read.table(macs.file.name)
  macs.applied.thresholds.indices = match( macs$THRESHOLDS, macs.data[ ,1])
  macs.data                       = macs.data[macs.applied.thresholds.indices, ]
  
  macs.pre                        = macs.data[ , 5]
  macs.rec                        = macs.data[ , 6]
  macs.threshold                  =  macs.data[ , 1]
  
  macs.f                  = F.Beta.Scores(beta, macs.pre, macs.rec)
  plot(macs.f~macs.threshold, col='red', lwd=3, type='l', xlab="threshold", ylab=YLab, main="MACS", ylim= c(0.3, 0.8))
  macs.default.index        = which(macs.data[ ,1]  == macs$DEFAULT)
  macs.pre.default  = macs.data[macs.default.index, 5]
  macs.rec.default = macs.data[macs.default.index, 6]
  f.macs.default    = F.Beta.Scores(beta, macs.pre.default, macs.rec.default )
  points(macs.data[macs.default.index,1 ],  f.macs.default, lwd=2, pch=1)

#zina.broad
  zinba.broad.data      = read.table(zinba.broad.file)
  zinba.braod.applied.threshold.indices = match(zinba$THRESHOLDS, zinba.broad.data[ ,1] )
  zinba.broad.data      = zinba.broad.data[zinba.braod.applied.threshold.indices, ]
  zinba.broad.pre       = zinba.broad.data[ , 5]
  zinba.broad.rec       = zinba.broad.data[ , 6]
  zinba.broad.threholds = zinba.broad.data[ , 1]
  zinba.broad.f         = F.Beta.Scores(beta,  zinba.broad.pre,  zinba.broad.rec)
  plot(zinba.broad.f~zinba.broad.threholds, col='brown', lwd=3, type='l', xlab="threshold", ylab=YLab, main="ZINBA_BROAD", ylim= c(0.3, 0.8))

  
  zinba.broad.default.index = which(zinba.broad.data[, 1]==zinba$DEFAULT)
  zinba.broad.pre.default   = zinba.broad.data[zinba.broad.default.index,5]
  zinba.broad.rec.default   = zinba.broad.data[zinba.broad.default.index,6]
  f.zinba.braod.default   = F.Beta.Scores(beta, zinba.broad.pre.default, zinba.broad.rec.default )
  points(zinba.broad.data[ zinba.broad.default.index,1],  f.zinba.braod.default, lwd=2, pch=1 )
  
  
  

 #zinba.narrow
  zinba.narrow.data       = read.table(zinba.narrow.data)
  zinba.narrow.applied.threshold.indices = match(zinba$THRESHOLDS, zinba.narrow.data[ ,1] )
  zinba.narrow.data      = zinba.narrow.data[zinba.narrow.applied.threshold.indices, ]
  zinba.narrow.pre        =  zinba.narrow.data[ , 5]
  zinba.narrow.rec        =  zinba.narrow.data[ , 6]
  zinba.narrow.thresholds =  zinba.narrow.data[ , 1]
  zinba.narrow.f          =  F.Beta.Scores(beta, zinba.narrow.pre, zinba.narrow.rec )
  plot(zinba.narrow.f~zinba.narrow.thresholds, col='blue', lwd=3, type='l', xlab="threshold", ylab=YLab, main="ZINAB_NARROW", ylim= c(0.3, 0.8))

  zinba.narrow.default.index = which(zinba.narrow.data[,1]==zinba$DEFAULT)
  zinba.narrow.pre.default   = zinba.narrow.data[zinba.narrow.default.index,5]
  zinba.narrow.rec.default   = zinba.narrow.data[zinba.narrow.default.index,6]
  f.zinba.narrow.default     = F.Beta.Scores(beta, zinba.narrow.pre.default, zinba.narrow.rec.default )
  points(zinba.narrow.data[zinba.narrow.default.index,1], f.zinba.narrow.default, lwd=2, pch=1)
  

   
}#plot.f.beta.scores.v2#



plot.average.of.precision.and.recall.v2 <- function(fseqDataFile, macsDataFile, zinbaBDataFile, zinbaNDataFile, HotspotDataFile ){
    par(mfrow=c(2,2))
  fseqData <- read.table(fseqDataFile)
  Pre <- fseqData[ ,5]
  Rec <- fseqData[ ,6 ]
  Thre <- fseqData[ ,1]
  Average <- (Pre+Rec)/2
  plot(Thre, Average, col='red', lwd=3, type='b', main="fseq and hotspot", xlab='Threshold', ylab='(Recall+Precision)/2', ylim=c(0.32,0.62))

  #hotspot
  hotspotData <- read.table(HotspotDataFile)
  hotspot.Pre <- hotspotData[ ,4]
  hotspot.Rec <- hotspotData[ ,5]
  hotspot.Average = (hotspot.Pre + hotspot.Rec)/2
  print(hotspot.Average)
  points(hotspot.Average, col='green', lwd=3)

  #macs
  macsData <- read.table(macsDataFile)
  macs.Pre <- macsData[ ,5]
  macs.Rec <- macsData[ ,6]
  macs.Thre <- macsData[ ,1]
  macs.Average <- (macs.Pre + macs.Rec)/2
  plot(macs.Thre, macs.Average, col='blue', lwd=3, type='b', main='macs', xlab='Threshold', ylab='(Recall+Precision)/2',  ylim=c(0.32,0.62))

  #zinba Narrow
  zinbaNarrowData <- read.table(zinbaNDataFile)
  zinba.Narrow.Pre <- zinbaNarrowData[ ,5]
  zinba.Narrow.Rec <- zinbaNarrowData[ ,6]
  zinba.Narrow.Thre <- zinbaNarrowData[ ,1]
  zinba.Narrow.Average <- (zinba.Narrow.Pre+zinba.Narrow.Rec)/2
  plot(  zinba.Narrow.Thre, zinba.Narrow.Average, lwd=3, type='b', col='brown', main='zinba-narrow',xlab='Threshold', ylab='(Recall+Precision)/2', ylim=c(0.32,0.62))
  
  #zinba Broad
  zinbaBroadData <- read.table(zinbaBDataFile)
  zinba.Broad.Pre <- zinbaBroadData[ ,5]
  zinba.Broad.Rec <- zinbaBroadData[ ,6]
  zinba.Broad.Thre <- zinbaBroadData[ ,1]
  zinba.Broad.Average <- (zinba.Broad.Pre+zinba.Broad.Rec)/2
  plot( zinba.Broad.Thre, zinba.Broad.Average, lwd=3, type='b', col='yellow', main='zinba-broad', xlab='Threshold', ylab='(Recall+Precision)/2', ylim=c(0.32,0.62))
  
}#plot.average.of.precision.and.recall.v2#






get.length.from.npf <- function(ApeakFile){
  L = list()
  data = read.table(ApeakFile)
  number.of.peaks = nrow(data)
  L$Number   = number.of.peaks
  len =  data[,3]-data[,2]
  L$Lengths = len
  L
}#get.length.from.npf#




peak.summary.of.statistics <- function(zinba.narrow.peaks.file, 
										zinba.broad.peaks.file, 
										macs.peaks.file, 
										fseq.peaks.file, 
										dhs.peaks.file,
										hotspot.peaks.file, 
										cell.line='' ){
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
  
  #HOTSPOTS
  hotspot <- get.length.from.npf(hotspot.peaks.file)
  hotspot.lengths = hotspot$Lengths
  hotspot.number.of.peaks = hotspot$Number
  print(hotspot.number.of.peaks)

  #DHS
  dhs <- get.length.from.npf(dhs.peaks.file)
  dhs.lengths = dhs$Lengths
  dhs.number.of.peaks = dhs$Number
  print(dhs.number.of.peaks)
  
  List = list()
  List$ZN      = zinba.narrow.lengths
  List$ZB      =  zinba.braod.lengths
  List$MACS    =  macs.lengths
  List$FSEQ    = fseq.lengths
  List$DHS     = dhs.lengths
  List$HOTSPOT = hotspot.lengths
  
  Number.of.peaks = c(zinba.narrwo.number.of.peaks, zinba.broad.number.of.peaks, macs.number.of.peaks, fseq.number.of.peaks, dhs.number.of.peaks, hotspot.number.of.peaks)
  
  
   #par(mfrow=c(2,1))
  layout(matrix(c(1,2), 2, 1, byrow = TRUE), widths=c(1,1), heights=c(2,1))
    boxplot(List, col=c('red','blue', 'green', 'orange','grey','darkmagenta'), names=c('ZINBA_N', 'ZINBA_B', 'MACS', 'F_Seq','DHS','Hotspot'), ylab='lengths', main=cell.line)#at= c(0.7, 1.9, 3.1, 4.3, 5.4)
  barplot(Number.of.peaks,  col=c('red','blue', 'green', 'orange','grey','darkmagenta'), names=c('ZINBA_N', 'ZINBA_B', 'MACS', 'F_Seq','DHS','Hotspot'), ylab='number of peaks')

  
}#peak.summary.of.statistics#






plot.f.bets.scores.for.all.cell.line.from.one.algorithm <- function(K562.cell.line.file,
                                                                    Gm12878.cell.line.file,
                                                                    Helas3.cell.line.file,
                                                                    beta,
                                                                    algorithm,
                                                                    title = " "
                                                                    ){
  YLab = paste("F_",beta,sep="")
  #K562
  K562.data                           = read.table(K562.cell.line.file)
  K562.applied.thresholds.indics      = match(algorithm$THRESHOLDS, K562.data[ ,1])
  K562.data                           = K562.data[K562.applied.thresholds.indics, ]
  K562.thresholds                     =  K562.data[ , 1]
  K562.pre                            =  K562.data[ , 5]
  K562.rec                            =  K562.data[ , 6]
  K562.f                              = F.Beta.Scores(beta, K562.pre, K562.rec)
  plot( K562.f~K562.thresholds, lwd =3, type='l', col='red', ylim= c(0.3, 0.8),xlab="threshold",ylab=YLab,main=title)
 
  #Gm12878
  Gm12878.data                           = read.table(Gm12878.cell.line.file)
  Gm12878.applied.thresholds.indics      = match(algorithm$THRESHOLDS, Gm12878.data[ ,1])
  Gm12878.data                           = Gm12878.data[Gm12878.applied.thresholds.indics, ]
  Gm12878.thresholds                     =  Gm12878.data[ , 1]
  Gm12878.pre                            =  Gm12878.data[ , 5]
  Gm12878.rec                            =  Gm12878.data[ , 6]
  Gm12878.f                              = F.Beta.Scores(beta, Gm12878.pre, Gm12878.rec)
  points( Gm12878.f~Gm12878.thresholds, lwd =3, type='l', col='blue')

  #Helas3
  Helas3.data                           = read.table(Helas3.cell.line.file)
  Helas3.applied.thresholds.indics      = match(algorithm$THRESHOLDS, Helas3.data[ ,1])
  Helas3.data                           = Helas3.data[Helas3.applied.thresholds.indics, ]
  Helas3.thresholds                     =  Helas3.data[ , 1]
  Helas3.pre                            =  Helas3.data[ , 5]
  Helas3.rec                            =  Helas3.data[ , 6]
  Helas3.f                              = F.Beta.Scores(beta, Helas3.pre, Helas3.rec)
  points( Helas3.f~Helas3.thresholds, lwd =3, type='l', col='darkmagenta')
  abline(v=algorithm$DEFAULT,lty='dashed', lwd=2,col='grey')
  legend('topleft', legend= c("K562", "GM12878", "HelaS3"), col = c( 'blue', 'red', 'darkmagenta','red'), pch = c(20,20,20), text.col =  c('blue', 'red', 'darkmagenta','red'))
  
  
  
}#plot.f.bets.scores.for.all.cell.line.from.one.algorithm#


