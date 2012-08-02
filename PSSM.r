source("http://bioconductor.org/biocLite.R")
biocLite("seqLogo")
library(seqLogo)


pssmFile_hesc = "/Users/hk3/Desktop/Main/Human_Data/CHR_22/DH_UW_Duke/H1hescHotspot/PSSM_Minus10_Plus10_RepeatMasked_start_Human_UW_hesc_DNasei_HS_ch22.txt"
pwmFile_hesc = "/Users/hk3/Desktop/Main/Human_Data/CHR_22/DH_UW_Duke/H1hescHotspot/PWM_Minus10_Plus10_RepeatMasked_start_Human_UW_hesc_DNasei_HS_ch22.txt"

pssmFile_Gm = "/Users/hk3/Desktop/Main/Human_Data/CHR_22/DH_UW_Duke/Gm12878Hotspot/PSSM_Minus10_Plus10_RepeatMasked_start_Human_UW_Gm_DNasei_HS_ch22.txt"
pwmFile_Gm = "/Users/hk3/Desktop/Main/Human_Data/CHR_22/DH_UW_Duke/Gm12878Hotspot/PWM_Minus10_Plus10_RepeatMasked_start_Human_UW_Gm_DNasei_HS_ch22.txt"

pssmFile_mouse = "/Users/hk3/Desktop/Main/Mouse_DHS/PSSM_Minus10_Plus10_repeatMasked_Flanking_start_Mouse_UW_DNasei_HS_ch19.txt"
pwmFile_mouse  = "/Users/hk3/Desktop/Main/Mouse_DHS/PWM_Minus10_Plus10_repeatMasked_Flanking_start_Mouse_UW_DNasei_HS_ch19.txt"

PWM       = PLOT_PWM(pwmFile_hesc)
SEQLOGO   = DRAW_SEQ_LOGO(pssmFile_hesc)
PSSM      = READ_DATA_FROAM_A_TSV_FILE(pssmFile_hesc)
##############################################################################################
PSSM      = READ_DATA_FROAM_A_TSV_FILE(pssmFile)
PWM       = PLOT_PWM(pwmFile)
SEQLOGO   = DRAW_SEQ_LOGO(pssmFile)



READ_DATA_FROAM_A_TSV_FILE<- function(dataFile){
	rowNames  <- c("A","C","G","T")
	table     <- read.table(file = dataFile, sep = "\t")
	seqLength <-  length(table[])
	#Matrix    <- data.matrix(table[1: seqLength-1])
	Matrix    <- data.matrix(table)
	xpos      <- seq(from = 1, to =seqLength, by =1)
	xpos      <- xpos-((seqLength)/2-0.5)
	
	total     <- sum(Matrix[,1])
	print(paste("total = ", total, sep = " "))
	A_content <- Matrix[1,]/total
	C_content <- Matrix[2,]/total
	G_content <- Matrix[3,]/total
	T_content <- Matrix[4,]/total
	#stop(  paste(  length(A_content),length(xpos)) )
	plot( xpos,A_content, xlab = "seq position", col = "green", type = 'l', ylim = c(0., 0.5), lwd =3, ylab = "average of bases")
	lines(xpos ,C_content, col = "blue",lwd =3)
	lines(xpos ,G_content, col = "yellow",lwd =3)
	lines(xpos ,T_content, col = "red",lwd =3)
	legend('topleft',legend = rowNames,  col =  c('green', 'blue', 'yellow', 'red'), pch = rowNames  )
	
	for(x in xpos){
		abline(v=x, lty =2)
		}
	Matrix
	
	}#READ_DATA_FROAM_A_TSV_FILE#
	
DRAW_SEQ_LOGO<- function(pssmDataFile){
	table       <- read.table(file = pssmDataFile, sep = "\t")
	asMatrix    <- data.matrix(table)
	total       <- sum(asMatrix[,1])
	pssmMatrix  <- asMatrix/total
	seqLogo(pwm = pssmMatrix)
	asMatrix
		}#DRAW_SEQ_LOGO#
	

PLOT_PWM<- function(dataFile){
	baseNames <- c("A","C","G","T");
	table     <- read.table(file = dataFile, sep = "\t")
	seqLength <- length(table)
	Matrix    <- data.matrix(table)
	midPoint   <- 0;
	if(seqLength %% 2 ==0 ){
		midPoint = seqLength/2
		}
		else{
			midPoint = seqLength/2-0.5
			}
	xPos      <- seq(from=1, to= seqLength, by = 1)
	xPos      <- xPos-midPoint
	A_weight  <- Matrix[1,]
	C_weight  <- Matrix[2,]
	G_weight  <- Matrix[3,]
	T_weight  <- Matrix[4,]
	plot(xPos, A_weight,xlab = "seq position", col ='green', type = 'l', ylim = c(-1,1), lwd =3, ylab = "weights" , main = "PWM for Mouse")
	lines(xPos, C_weight, col = "blue",lwd =3)
	lines(xPos, G_weight,col = "yellow",lwd =3)
	lines(xPos, T_weight,col = "red",lwd =3)
	legend('topleft',legend = baseNames,  col = c('green', 'blue', 'yellow', 'red'), pch = baseNames )
	
		for(x in xPos){
		abline(v=x, lty =2)
		}
		Matrix
	}#PLOT_PWM#