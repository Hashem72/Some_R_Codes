library(ggplot2)
library(VennDiagram)
K562.zinba.narrow.file <- "/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/K562/NPF_Files/ZINBA_OUT_FDR_0.05_narrow_peaks.npf"
K562.zinba.broad.file  <- "/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/K562/NPF_Files/ZINBA_OUT_FDR_0.05_broad_peaks.npf"
K562.macs.file         <- "/nfs/th_group/hk3/MACS_ANALYSIS/UW/K562/K562_0.05_peaks.encodePeak"
K562.fseq.file         <- "/nfs/th_group/hk3/Hotspot_vs_F_Seq/UW/K562/F_Seq_Outputs_for_different_t_Parameters/chr22_t_4.npf"
K562.encode.file       <- "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/K562_Encode_hotspots.npf"
K562.hotspot.file      <- "/nfs/th_group/hk3/Hotspot_V3_Analysis/UW/K562/NPFs/wgEncodeUwDnaseK562AlnRep1.hotspot.twopass.fdr0.05.npf"

####################### Gm12878 ##########
Gm12878.zinba.narrow.file <- "/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/Gm12878/NPF_Files/ZINBA_OUT_FDR_0.05_narrow_peaks.npf"
Gm12878.zinba.broad.file  <- "/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/Gm12878/NPF_Files/ZINBA_OUT_FDR_0.05_broad_peaks.npf"
Gm12878.macs.file         <- "/nfs/th_group/hk3/MACS_ANALYSIS/UW/Gm12878/Gm12878_0.05_peaks.encodePeak"
Gm12878.fseq.file         <- "/nfs/th_group/hk3/Hotspot_vs_F_Seq/UW/Gm12878/F_Seq_Outputs_for_different_t_Parameters/chr22_t_4.npf"
Gm12878.encode.file       <- "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/Gm12878_Encode_hotspots.npf"
Gm12878.hotspot.file      <- "/nfs/th_group/hk3/Hotspot_V3_Analysis/UW/Gm12878/NPFs/wgEncodeUwDnaseGm12878AlnRep1.hotspot.twopass.fdr0.05.npf"

################# Helas3 #########
Helas3.zinba.narrow.file <- "/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/Helas3/NPF_Files/ZINBA_OUT_FDR_0.05_narrow_peaks.npf"
Helas3.zinba.broad.file  <- "/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/Helas3/NPF_Files/ZINBA_OUT_FDR_0.05_broad_peaks.npf"
Helas3.macs.file         <- "/nfs/th_group/hk3/MACS_ANALYSIS/UW/Helas3/Helas3_0.05_peaks.encodePeak"
Helas3.fseq.file         <- "/nfs/th_group/hk3/Hotspot_vs_F_Seq/UW/Helas3/F_Seq_Outputs_for_different_t_Parameters/chr22_t_4.npf"
Helase.encode.file       <- "/nfs/th_group/hk3/UW_DNaseI_HS/Helas3_For_Paper_Analysis/Helas3_Encode_hotspots.npf"
Helas3.hotspot.file      <- "/nfs/th_group/hk3/Hotspot_V3_Analysis/UW/Helas3/NPFs/wgEncodeUwDnaseHelas3AlnRep1.hotspot.twopass.fdr0.05.npf"




########################## calls  ################

box.plot.lengths.v3(K562.hotspot.file,
                 Gm12878.hotspot.file,
                 Helas3.hotspot.file,
                 K562.fseq.file,
                 Gm12878.fseq.file,
                 Helas3.fseq.file,
                 K562.macs.file,
                 Gm12878.macs.file,
                 Helas3.macs.file,
                 K562.zinba.narrow.file,
                 Gm12878.zinba.narrow.file,
                 Helas3.zinba.narrow.file,
                 K562.zinba.broad.file,
                 Gm12878.zinba.broad.file,
                 Helas3.zinba.broad.file,
                 K562.encode.file ,
                 Gm12878.encode.file,
                 Helase.encode.file
                 )



get.intersection.of.DHSs.as.Venn.Daigrams(K562.encode.file, 
											Gm12878.encode.file ,
											Helase.encode.file
											)
											

########################## function ################

get.positions <- function(data.File){
	results = c()
	data = read.table(data.File)
	number.of.rows = nrow(data)
	for(i in 1:number.of.rows){
		one.peak.start = data[i,2]
		one.peak.end   = data[i,3]-1 # bed files are [colsed, open)
		positions      =  one.peak.start:one.peak.end
		results        =c(results,positions)
	}
	print("One file done!")
results
}#get.positions#

get.intersection.of.DHSs.as.Venn.Daigrams <- function(K562.DHS.NPF, Gm12878.DHS.NPF, Helas3.DHS.NPF ){
	K562     = get.positions(K562.DHS.NPF)
	print("K562 done!")
	GM12878  = get.positions(Gm12878.DHS.NPF)
	print("GM12878 done!")
	HelaS3   = get.positions(Helas3.DHS.NPF)
	print("HelaS3 done!")
	
	venn.diagram(list(K562 = K562, GM12878=GM12878, HelaS3=HelaS3) ,fill = c("red", "green","blue"), ,filename = "/nfs/users/nfs_h/hk3/My_R_Scripts/ZINBA_CODES/Overlapes_as_VennDiagram.tiff",
  alpha = c(0.5, 0.5, 0.5), cex = 2,cat.fontface = 4,lty =2, fontfamily =3, 
  height = 5000, width = 5000,);

}#get.intersection.of.DHSs.as.Venn.Daigrams #

box.plot.lengths.v3 <- function(Hotspot.K562.File,
                             Hotspot.Gm12878.File,
                             Hotspot.Helas3.File,
                             FSeq.K562.File,
                             FSeq.Gm12878.File,
                             FSeq.Helas3.File,
                             MACS.K562.File,
                             MACS.Gm12878.File,
                             MACS.Helas3.File,
                             ZINBA.N.K562.File,
                             ZINBA.N.Gm12878.File,
                             ZINBA.N.Helas3.File,
                             ZINBA.B.K562.File,
                             ZINBA.B.Gm12878.File,
                             ZINBA.B.Helas3.File,
                             DHS.K562.File,
                             DHS.Gm12878.File,
                             DHS.Helas3.File
                             ){

#hotspot
  Hotspot.K562.DF      = make.data.frame(Hotspot.K562.File, "Hotspot", "K562")
  Hotspot.Gm12878.DF   = make.data.frame(Hotspot.Gm12878.File, "Hotspot", "GM12878")
  Hotspot.HelaS3.DF    = make.data.frame(Hotspot.Helas3.File,  "Hotspot", "HelaS3")
  
  Hotspot.K562.NoP     = get.number.of.peaks.as.df(Hotspot.K562.File, "Hotspot", "K562")
  Hotspot.Gm12878.NoP  = get.number.of.peaks.as.df(Hotspot.Gm12878.File, "Hotspot", "GM12878")
  Hotspot.Helase.NoP   = get.number.of.peaks.as.df(Hotspot.Helas3.File, "Hotspot", "HelaS3")
  
  
#FSeq
  FSeq.K562.DF      = make.data.frame(FSeq.K562.File, "FSeq", "K562")
  FSeq.Gm12878.DF   = make.data.frame(FSeq.Gm12878.File, "FSeq", "GM12878")
  FSeq.HelaS3.DF    = make.data.frame(FSeq.Helas3.File,  "FSeq", "HelaS3")
  
  FSeq.K562.NoP     = get.number.of.peaks.as.df(FSeq.K562.File, "FSeq", "K562")
  FSeq.Gm12878.NoP  = get.number.of.peaks.as.df(FSeq.Gm12878.File, "FSeq", "GM12878")
  FSeq.Helase.NoP   = get.number.of.peaks.as.df(FSeq.Helas3.File, "FSeq", "HelaS3")

#MACS
  MACS.K562.DF    = make.data.frame(MACS.K562.File, "MACS", "K562")
  MACS.Gm12878.DF = make.data.frame(MACS.Gm12878.File, "MACS", "GM12878")
  MACS.HelaS3.DF    = make.data.frame(MACS.Helas3.File,  "MACS", "HelaS3")
  
  MACS.K562.NoP     = get.number.of.peaks.as.df(MACS.K562.File, "MACS", "K562")
  MACS.Gm12878.NoP  = get.number.of.peaks.as.df(MACS.Gm12878.File, "MACS", "GM12878")
  MACS.Helase.NoP   = get.number.of.peaks.as.df(MACS.Helas3.File, "MACS", "HelaS3")

#ZINBA.N
  ZINBA.N.K562.DF    = make.data.frame(ZINBA.N.K562.File, "ZINBA.N", "K562")
  ZINBA.N.Gm12878.DF = make.data.frame(ZINBA.N.Gm12878.File, "ZINBA.N", "GM12878")
  ZINBA.N.HelaS3.DF    = make.data.frame(ZINBA.N.Helas3.File,  "ZINBA.N", "HelaS3")
  
  ZINBA.N.K562.NoP     = get.number.of.peaks.as.df(ZINBA.N.K562.File, "ZINBA.N", "K562")
  ZINBA.N.Gm12878.NoP  = get.number.of.peaks.as.df(ZINBA.N.Gm12878.File, "ZINBA.N", "GM12878")
  ZINBA.N.Helase.NoP   = get.number.of.peaks.as.df(ZINBA.N.Helas3.File, "ZINBA.N", "HelaS3")

#ZINBA.B
  ZINBA.B.K562.DF    = make.data.frame(ZINBA.B.K562.File, "ZINBA.B", "K562")
  ZINBA.B.Gm12878.DF = make.data.frame(ZINBA.B.Gm12878.File, "ZINBA.B", "GM12878")
  ZINBA.B.HelaS3.DF    = make.data.frame(ZINBA.B.Helas3.File,  "ZINBA.B", "HelaS3")
  
  ZINBA.B.K562.NoP     = get.number.of.peaks.as.df(ZINBA.B.K562.File, "ZINBA.B", "K562")
  ZINBA.B.Gm12878.NoP  = get.number.of.peaks.as.df(ZINBA.B.Gm12878.File, "ZINBA.B", "GM12878")
  ZINBA.B.Helase.NoP   = get.number.of.peaks.as.df(ZINBA.B.Helas3.File, "ZINBA.B", "HelaS3")

#DHS
  DHS.K562.DF    = make.data.frame(DHS.K562.File, "DHS", "K562")
  DHS.Gm12878.DF = make.data.frame(DHS.Gm12878.File, "DHS", "GM12878")
  DHS.HelaS3.DF    = make.data.frame(DHS.Helas3.File,  "DHS", "HelaS3")
  
  DHS.K562.NoP     = get.number.of.peaks.as.df(DHS.K562.File, "DHS", "K562")
  DHS.Gm12878.NoP  = get.number.of.peaks.as.df(DHS.Gm12878.File, "DHS", "GM12878")
  DHS.Helase.NoP   = get.number.of.peaks.as.df(DHS.Helas3.File, "DHS", "HelaS3")



DF = rbind(Hotspot.K562.DF, Hotspot.Gm12878.DF, Hotspot.HelaS3.DF,
			FSeq.K562.DF, FSeq.Gm12878.DF, FSeq.HelaS3.DF,
			MACS.K562.DF, MACS.Gm12878.DF, MACS.HelaS3.DF,
			ZINBA.N.K562.DF, ZINBA.N.Gm12878.DF, ZINBA.N.HelaS3.DF,
			ZINBA.B.K562.DF, ZINBA.B.Gm12878.DF, ZINBA.B.HelaS3.DF,
			 DHS.K562.DF, DHS.Gm12878.DF, DHS.HelaS3.DF)
			 
NoP.DF = rbind(Hotspot.K562.NoP, Hotspot.Gm12878.NoP, Hotspot.Helase.NoP,
				FSeq.K562.NoP, FSeq.Gm12878.NoP, FSeq.Helase.NoP,
				 MACS.K562.NoP, MACS.Gm12878.NoP, MACS.Helase.NoP,
				 ZINBA.N.K562.NoP, ZINBA.N.Gm12878.NoP, ZINBA.N.Helase.NoP,
				 ZINBA.B.K562.NoP, ZINBA.B.Gm12878.NoP, ZINBA.B.Helase.NoP,
				 DHS.K562.NoP, DHS.Gm12878.NoP, DHS.Helase.NoP)
  
  tiff(file="/nfs/users/nfs_h/hk3/My_R_Scripts/ZINBA_CODES/Figures/Number_of_Peaks.tiff", height=5.5, width=5,compression = "lzw",units='in', res=150 )
	#pdf(file="/nfs/users/nfs_h/hk3/My_R_Scripts/ZINBA_CODES/Figures/Distribution_of_lengths.pdf", height=6, width=5)		 
#plt1 <- ggplot(DF, aes(x = Algorithm, y = Lengths, fill = Algorithm)) + geom_boxplot() + facet_wrap(~ Cell) + theme(text = element_text(size=12),axis.text.x = element_text(angle=90,vjust=1,  color='black')) 
#plt2 <- ggplot(NoP.DF, aes(x = Algorithm, y = Number.of.Peaks, fill = Algorithm)) + geom_bar() + facet_wrap(~ Cell) +  theme(text = element_text(size=12),axis.text.x = element_text(angle=90, vjust=1,  color='black'))

#plt1 <-ggplot(DF, aes(x = Cell, y = log10(Lengths), fill = Cell)) + geom_boxplot() + facet_wrap(~ Algorithm) + theme(text = element_text(size=12),axis.text.x = element_text(angle=90,vjust=1,  color='black')) 
plt2 <- ggplot(NoP.DF, aes(x = Cell, y = Number.of.Peaks, fill = Cell)) + geom_bar() + facet_wrap(~ Algorithm) +  theme(text = element_text(size=12),axis.text.x = element_text(angle=90, vjust=1,  color='black'))
  
multiplot(plt2, cols=1)
dev.off()
}#box.plot.lengths.v3#


multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  require(grid)

  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)

  numPlots = length(plots)

  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                    ncol = cols, nrow = ceiling(numPlots/cols))
  }

 if (numPlots==1) {
    print(plots[[1]])

  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))

    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))

      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}#multiplot#





make.data.frame <- function(data.File, algorithm, cell.Line){
  Lengths         = get.length.from.npf(data.File)$Length
  Number.of.Peaks = get.length.from.npf(data.File)$Number
  cell            = rep(cell.Line, Number.of.Peaks)
  algo            = rep(algorithm, Number.of.Peaks)
  df              = data.frame(Lengths=  Lengths, Cell = cell, Algorithm=algo)
  df
}#make.data.frame#

get.number.of.peaks.as.df <- function(data.File, algorithm, cell.Line){
	NoP = get.length.from.npf(data.File)$Number
	df              = data.frame(Number.of.Peaks=NoP, Cell= cell.Line, Algorithm= algorithm)
	df
}#get.number.of.peaks.as.df#


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

