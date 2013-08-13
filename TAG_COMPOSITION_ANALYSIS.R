par(mfrow=c(1,2))
pwm.file <- "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878/pwm_model_file.txt"
pwm.background.model.file <- "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878/pwm_bg_model_testing_file.txt"


freq.file <- "/nfs/th_group/hk3/wgEncodeUwHistone/Gm12878_Histone/Composition_wgEncodeUwHistoneGm12878H3k4me3StdAlnRep1_chr22.txt"
PLOT.FREQ.FOR.EAH.BASE(freq.file,"CHIP-SEQ from Gm12878H3k4me3StdAlnRep1")
GET.TAG.COMPOSITIONS.V.2(freq.file,"CHIP-SEQ from Gm12878H3k4me3StdAlnRep1")



com.File.A <- "/nfs/th_group/hk3/UW_DNaseI_HS/K562/tags_compositions_file_A.txt"
com.File.B <- "/nfs/th_group/hk3/UW_DNaseI_HS/K562/tags_compositions_file_B.txt"

GET.TAG.COMPOSITIONS.V.2(com.File.A, "Tags: Group A")
GET.TAG.COMPOSITIONS.V.2(com.File.B, "Tags: Group B")
par(mfrow= c(3,1))
GET.TAG.COMPOSITIONS.V.2("/nfs/th_group/hk3/Duke_DNaseI_HS/Gm12878/tags_composition_wgEncodeOpenChromDnaseGm12878AlnRep1_chr22.txt", "Duke Tags Gm12878")

GET.TAG.COMPOSITIONS.V.2("/nfs/th_group/hk3/Duke_DNaseI_HS/H1hesc/tags_composition_wgEncodeOpenChromDnaseH1hescAlnRep1_chr22.txt", "Duke Tags H1hesc")
GET.TAG.COMPOSITIONS.V.2("/nfs/th_group/hk3/Duke_DNaseI_HS/K562/tags_compositions_wgEncodeOpenChromDnaseK562AlnRep1_chr22.txt", "Duke Tags K562")


PLOT.FREQ.FOR.EAH.BASE("/nfs/th_group/hk3/Duke_DNaseI_HS/Gm12878/tags_composition_wgEncodeOpenChromDnaseGm12878AlnRep1_chr22.txt", "Duke Tags Gm12878")
PLOT.FREQ.FOR.EAH.BASE("/nfs/th_group/hk3/Duke_DNaseI_HS/H1hesc/tags_composition_wgEncodeOpenChromDnaseH1hescAlnRep1_chr22.txt", "Duke Tags H1hesc")
PLOT.FREQ.FOR.EAH.BASE("/nfs/th_group/hk3/Duke_DNaseI_HS/K562/tags_compositions_wgEncodeOpenChromDnaseK562AlnRep1_chr22.txt", "Duke Tags K562")


PLOT.WEIGHTS.FOR.EACH.BASE(pwm.file, "PWM model")
PLOT.WEIGHTS.FOR.EACH.BASE(pwm.background.model.file,"Background model")

pdf("Tags_Compositions.pdf", height = 20, width=15, title = "Nucleotide bias at tags level",paper="a4")
par(cex=1, lwd =1, col.axis="black", col.lab="black", col.main="black", col.sub="black", fg="black", mfrow = c(3,2), cex.axis=1.2, tck=-.01, cex.lab=1.3)
PLOT.FREQ.FOR.EAH.BASE("/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878/wgEncodeUwDnaseGm12878AlnRep1_chr22_composition.txt", "UW Gm12878")
PLOT.FREQ.FOR.EAH.BASE("/nfs/th_group/hk3/wgEncodeUwHistone/Gm12878_Histone/Composition_wgEncodeUwHistoneGm12878H3k4me3StdAlnRep1_chr22.txt", "Gm12878- H3k5me3")


PLOT.FREQ.FOR.EAH.BASE("/nfs/th_group/hk3/UW_DNaseI_HS/K562/wgEncodeUwDnaseK562AlnRep1_chr22_composition.txt","UW K562")
PLOT.FREQ.FOR.EAH.BASE("/nfs/th_group/hk3/wgEncodeUwHistone/K562_Histon/wgEncodeUwHistoneK562H3k4me3StdAlnRep1_chr22_composition.txt", "K562- H3k4me")

PLOT.FREQ.FOR.EAH.BASE("/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc/wgEncodeUwDnaseH1hescAlnRep1_chr22_composition.txt","UW H1hesc")
PLOT.FREQ.FOR.EAH.BASE("/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc/wgEncodeUwDnaseH1hescAlnRep1_chr22_composition_moved_tags.txt", "H1hesc Background")

dev.off()

pmsFile <- "/nfs/th_group/hk3/UW_DNaseI_HS/K562/pms_scores.txt"
pbsFile <- "/nfs/th_group/hk3/UW_DNaseI_HS/K562/pbs_scores.txt"

pmsData <- GET.DATA.FROM.CVS.FILE(pmsFile)
Main <- "Dist. log(P(S|M)), Length 7"
hist(pmsData, breaks =100, col = 'grey',prob= TRUE, xlim = c(-2,2), ylab = "Density", xlab = "Scores", main = Main)
lines(density(pmsData),col= 'red', lwd = 3, lty= 'dotted')

pbsData <- GET.DATA.FROM.CVS.FILE(pbsFile)
hist(pbsData, breaks = 100, col = 'khaki', prob= TRUE)
lines(density(pbsData), col = 'blue', lwd =3)

MAKE.BAR.PLOT(c(151494,282807), c(145008, 281762), c(148744,247067))

######################### functions ##############################

MAKE.BAR.PLOT <- function(vOne, vTwo, vThree){
  #normalize vectors
  sumOne   <-  sum(vOne)
  vOne     <-  vOne/sumOne
  sumTwo   <-  sum(vTwo)
  vTwo     <-  vTwo/sumTwo
  sumThree <-  sum(vThree)
  vThree   <-  vThree/sumThree

  #make matrix
  dataMatrix <- c()
  dataMatrix <- cbind(dataMatrix,vOne)
  dataMatrix <- cbind(dataMatrix, vTwo)
  dataMatrix <- cbind(dataMatrix,vThree)
  colnames(dataMatrix) <- c("K562","Gm12878", "H1hesc")
  barplot(dataMatrix, ylab = "Fraction", beside = TRUE, col = c('green', 'blue'), ylim= c(0,1))
  legend("topleft", c("Unbiased", "Biased"), cex =1, fill = c("green", "blue"))
  
}#MAKE.BAR.PLOT#

GET.DATA.FROM.CVS.FILE<- function(pmsFile){
  pmsData <- scan(file = pmsFile, sep=",", quiet= TRUE)
  numberOfData <- length(pmsData)
  pmsData <- pmsData[-numberOfData]
  pmsData
}#PLOT.PMS#

PLOT.WEIGHTS.FOR.EACH.BASE <- function(dataFile,Main){
  pwm_data<- scan(file= dataFile, sep =",", quiet = TRUE)
  pwm_matrix <- matrix(pwm_data, ncol =4, byrow = TRUE)
  plot(pwm_matrix[,1],col = 'red', lwd =3, type = 'l', ylab= 'weight', xlab= 'position',ylim= c(-2,1),main = Main)
lines(pwm_matrix[,2], col = 'blue', lwd =3)
lines(pwm_matrix[,3], col = 'green', lwd =3)
lines(pwm_matrix[,4], col = 'grey', lwd =3)
legend('topright', legend = c("a","c","g","t"), lty=1:4,col = c("red", "blue","green", "grey"), pt.bg = 'orange', pt.lwd =3, lwd =2, bg= 'khaki', ncol =2)

}#PLOT.WEIGHTS.FOR.EACH.BASE#


PLOT.FREQ.FOR.EAH.BASE<- function(dataFile,Main){
  pwm_data<- scan(file= dataFile, sep =",", quiet = TRUE)
  pwm_matrix <- matrix(pwm_data, ncol =4, byrow = TRUE)
  total.A <- sum(pwm_matrix[1,])
  total.C <- sum(pwm_matrix[,2])
  total.G <- sum(pwm_matrix[,3])
  total.T <- sum(pwm_matrix[,4])
  print(paste("a= ", total.A, "c=", total.C, "g=", total.G,"t=", total.T, sep = " " ))

  plot(pwm_matrix[,1]/total.A,col = 'red', lwd =3, type = 'l', ylab= 'frequency', xlab= 'tag position',,main = Main,ylim = c(0,0.5), font.axis =1, font.lab = 3)
lines(pwm_matrix[,2]/total.A, col = 'blue', lwd =3)
lines(pwm_matrix[,3]/total.A, col = 'green', lwd =3)
lines(pwm_matrix[,4]/total.A, col = 'grey', lwd =3)
legend('topright', legend = c("a","c","g","t"), lty=1:4,col = c("red", "blue","green", "grey"), pt.bg = 'orange', pt.lwd =3, lwd =2, bg= 'khaki', ncol =2)

}#PLOT.FREQ.FOR.EAH.BASE#


GET.TAG.COMPOSITIONS.V.2 <- function(compFile, cellType){
	compData   <- scan(file = compFile, sep = ",", quiet = TRUE)
	compDataMatrix <- matrix(compData, ncol =4, byrow = TRUE)
	total  <- sum(compDataMatrix[1,])
	for(i in 1:nrow(compDataMatrix)){
		compDataMatrix[i,] = compDataMatrix[i,]/total
	}
	Main = paste("", cellType, sep = " ")
	A.And.T = (compDataMatrix[,1]+compDataMatrix[,4])/2
	C.And.G = (compDataMatrix[,2]+compDataMatrix[,3])/2
	plot(A.And.T, xlab = 'tag position', ylab = "[a+t]/2 and [c+g]/2", col = 'red', lwd =3 , pch =1, type = 'l', ylim = c(0.0, 0.5), lty=1, main = Main)
	lines(C.And.G, col = 'blue', lwd =3, pch=2)
	legend('topright', legend= c('[a+t]/2', '[c+g]2'), col = c('red', 'blue'), lty=1, pt.bg='orange', bg= 'grey', ncol=1,pch =1:2)
	}#GET.TAG.COMPOSITIONS.V.2#
	
