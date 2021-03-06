source("http://bioconductor.org/biocLite.R")
biocLite(c("graph", "RBGL", "gtools", "xtable"))
install.packages("Vennerable", repos="http://R-Forge.R-project.org")


par(mfrow= c(1,3))
Formats <- c("bed","bed", "bed")

#H1hesc without filtering short hotspots
Encod.hotspot.H1hesc   <- "/nfs/th_group/hk3/Hotspot_Analysis/H1hesc/wgEncodeUwDnaseH1hescAlnRep1_chr22_modified_sorted.bed-both-passes/wgEncodeUwDnaseH1hescAlnRep1_chr22_modified_sorted.bed.hotspot.twopass.zscore_higher_than_2.wig"
group.A.hotspot.H1hesc <-  "/nfs/th_group/hk3/Hotspot_Analysis/H1hesc/file_A_modified_sorted.bed-both-passes/group_A_scores_higher_than_2.wig"
group.B.hotspot.H1hesc <- "/nfs/th_group/hk3/Hotspot_Analysis/H1hesc/file_B_modified_sorted.bed-both-passes/group_B_scores_higher_than_2.wig"
Bed.Files <- c(Encod.hotspot.H1hesc,group.A.hotspot.H1hesc,group.B.hotspot.H1hesc)
VENNDIAGRAM(Bed.Files,Formats,FALSE,TRUE,0)


#Gm12878 without filtering short hotspots
Encod.hotspot.Gm12878 <- "/nfs/th_group/hk3/Hotspot_Analysis/Gm12878/wgEncodeUwDnaseGm12878AlnRep1_chr22_modified_sorted.bed-both-passes/wgEncodeUwDnaseGm12878AlnRep1_chr22_modified_sorted.bed.hotspot.twopass.zscore_higher_than_2.wig"
group.A.hotspot.Gm12878 <- "/nfs/th_group/hk3/Hotspot_Analysis/Gm12878/file_A_modified_sorted.bed-both-passes/group_A_scores_higher_than_2.wig" 
group.B.hotspot.Gm12878 <- "/nfs/th_group/hk3/Hotspot_Analysis/Gm12878/file_B_modified_sorted.bed-both-passes/group_B_scores_higher_than_2.wig"
Gm12878.Bed.Files <- c(Encod.hotspot.Gm12878,group.A.hotspot.Gm12878,group.B.hotspot.Gm12878)
VENNDIAGRAM(Gm12878.Bed.Files,Formats,FALSE,TRUE,0)

#K562 without filtering short hotspots
Encod.hotspot.K562  <- "/nfs/th_group/hk3/Hotspot_Analysis/K562/wgEncodeUwDnaseK562AlnRep1_chr22_modified_sorted.bed-both-passes/wgEncodeUwDnaseK562AlnRep1_chr22_modified_sorted.bed.hotspot.twopass.zscore_higher_than_2.wig"
group.A.hotspot.K562 <- "/nfs/th_group/hk3/Hotspot_Analysis/K562/file_A_modified_sorted.bed-both-passes/group_A_scores_higher_than_2.wig"
group.B.hotspot.K562 <- "/nfs/th_group/hk3/Hotspot_Analysis/K562/file_B_modified_sorted.bed-both-passes/group_B_scors_higher_than_two.wig"
K562.Bed.Files <-  c(Encod.hotspot.K562,group.A.hotspot.K562,group.B.hotspot.K562)
VENNDIAGRAM(K562.Bed.Files,Formats,FALSE,TRUE,0)


#not: the next line is hotspot that i have obtained from encode project:
Encod.Hotspots.H1hesc <- "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc/wgEncodeUwDnaseH1hescHotspotsRep1.bed"

Whole.Genome.Merged.Hotspots <- "/nfs/th_group/hk3/Hotspot_Analysis/H1hesc/whole_genome_wgEncodeUwDnaseH1hescAlnRep1_modified_for_hotspot_sorted.bed-both-passes/wgEncodeUwDnaseH1hescAlnRep1_modified_for_hotspot_sorted.bed.twopass.merge150.wgt10.zgt2_chr22.wig"

Whole.Genome.Not.Merged.Hotspots <- "/nfs/th_group/hk3/Hotspot_Analysis/H1hesc/whole_genome_wgEncodeUwDnaseH1hescAlnRep1_modified_for_hotspot_sorted.bed-both-passes/wgEncodeUwDnaseH1hescAlnRep1_modified_for_hotspot_sorted.bed.hotspot.twopass.zscore_chr22.wig"

H1hesc.Bed.Files.For.Segmentation.Problem <- c(Encod.Hotspots.H1hesc, Whole.Genome.Merged.Hotspots, Whole.Genome.Not.Merged.Hotspots)
VENNDIAGRAM(H1hesc.Bed.Files.For.Segmentation.Problem,Formats,FALSE,TRUE,0)

Encode.And.Merged <- c(Encod.Hotspots.H1hesc, Whole.Genome.Merged.Hotspots)
Formats.FOR.TWO <- c("bed","bed")

VENNDIAGRAM.FOR.TWO.SETS(Encode.And.Merged ,Formats.FOR.TWO,FALSE,TRUE,0)



####################
VENNDIAGRAM <- function(vectorOfThreeFiles,vectorOfThreeFileFormats,getData,percentageMode=FALSE,lengthThreshold =0){
  #NOTE: ORDER is important here: first file is encode, second file is group A and third file is group B. formats must be the same order: ie E, A and B

  first.matrix  <- GET.MATRIX(vectorOfThreeFiles[1])
  second.matrix <- GET.MATRIX(vectorOfThreeFiles[2])
  third.matrix  <- GET.MATRIX(vectorOfThreeFiles[3])
  features.from.first.file  <- GET.VECTOR.OF.FEATURES(first.matrix,vectorOfThreeFileFormats[1], lengthThreshold)
  first.set.length <- length(features.from.first.file)
  print(paste("Total length of features in first file is: " ,  first.set.length, sep = " "))
  features.from.second.file <- GET.VECTOR.OF.FEATURES(second.matrix,vectorOfThreeFileFormats[2],lengthThreshold )
  second.set.length <- length(features.from.second.file)
   print(paste("Total length of features in second file is: ", second.set.length, sep = " "))
  features.from.third.file  <- GET.VECTOR.OF.FEATURES(third.matrix,vectorOfThreeFileFormats[3],lengthThreshold )
  third.set.length <- length(features.from.third.file)
   print(paste("Total length of features in third file is: ", third.set.length, sep = " "))
  vd <- venndia(E=features.from.first.file, A=features.from.second.file,B=  features.from.third.file, getdata=getData, percentage = percentageMode)

  vd
}#VENNDIAGRAM#


VENNDIAGRAM.FOR.TWO.SETS <- function(vectorOfThreeFiles,vectorOfThreeFileFormats,getData,percentageMode=FALSE,lengthThreshold =0){
  #NOTE: ORDER is important here: first file is encode, second file is group A and third file is group B. formats must be the same order: ie E, A and B

  first.matrix  <- GET.MATRIX(vectorOfThreeFiles[1])
  second.matrix <- GET.MATRIX(vectorOfThreeFiles[2])
  
  features.from.first.file  <- GET.VECTOR.OF.FEATURES(first.matrix,vectorOfThreeFileFormats[1], lengthThreshold)
  first.set.length <- length(features.from.first.file)
  print(paste("Total length of features in first file is: " ,  first.set.length, sep = " "))
  features.from.second.file <- GET.VECTOR.OF.FEATURES(second.matrix,vectorOfThreeFileFormats[2],lengthThreshold )
  second.set.length <- length(features.from.second.file)
   print(paste("Total length of features in second file is: ", second.set.length, sep = " "))
 
  
   
  vd <- venndia(E=features.from.first.file, A=features.from.second.file, getdata=getData, percentage = percentageMode)

  vd
}#VENNDIAGRAM.FOR.TWO.SETS#







GET.MATRIX <- function(aBedOrGffFile){
  #this reads the data from a file and return them as a matrix:
  top.five.rows <- read.table(file=aBedOrGffFile, nrows =5)
  classes       <- sapply(top.five.rows, class)
  dataAsTable   <- read.table(file = aBedOrGffFile, colClasses = classes)
  dataAsTable   <- as.matrix(dataAsTable)
  dataAsTable
}#GET.MATRIX#

GET.VECTOR.OF.FEATURES <- function(dataMatrix, fileFormat,lengthThreshold){
  vector.of.feature  <- c()
  number.of.features <- nrow(dataMatrix)
  for(i in 1:number.of.features){
    if(fileFormat== "bed" || fileFormat=="BED"){
      start <- as.numeric(dataMatrix[i,2])
      end <- as.numeric(dataMatrix[i,3])
      one.Length = end-start
      if(one.Length>lengthThreshold){
        one.feature <- seq(start,end)
        vector.of.feature <- c(vector.of.feature,one.feature)
      }
    }
    else if (fileFormat == "gff" ||fileFormat == "GFF" ){
      start <-  as.numeric(dataMatrix[i,4])
      end   <-  as.numeric(dataMatrix[i,5])
      one.Length <- end-start
      if(one.Length>lengthThreshold){
        one.feature <- seq(start,end)
        vector.of.feature <- c(vector.of.feature,one.feature)
      }

    }
    else{
      stop(paste("Undefined file format!",fileFormat, sep = " " ))
    }
  }
  vector.of.feature
}#GET.VECTOR.OF.FEATURES#

circle <- function(x, y, r, ...) {
    ang <- seq(0, 2*pi, length = 100)
    xx <- x + r * cos(ang)
    yy <- y + r * sin(ang)
    polygon(xx, yy, ...)
}#curcle#

venndia <- function(E, A, B, getdata=FALSE,percentage = FALSE, ...){
    bMissing <- missing(B)
    if(bMissing){ B <- c() }

    unionEA <- union(E, A)
    unionEB <- union(E, B)
    unionAB <- union(A, B)
    uniqueE <- setdiff(E, unionAB)
    uniqueA <- setdiff(A, unionEB)
    uniqueB <- setdiff(B, unionEA)
    intersEA <- setdiff(intersect(E, A), B)
    intersEB <- setdiff(intersect(E, B), A)
    intersAB <- setdiff(intersect(A, B), E)
    intersEAB <- intersect(intersect(E, A), intersect(A, B))

    unionEAB <-union(unionEA,B)
    unqueEAB <- unique(unionEAB)
    nUnionEAB <- length(unqueEAB)

    nE <- length(uniqueE)       
    nA <- length(uniqueA)
    nB <- length(uniqueB)

    nEA <- length(intersEA)
    nEB <- length(intersEB)
    nAB <- length(intersAB)

    nEAB <- length(intersEAB)   

    par(mar=c(2, 2, 0, 0))
    plot(-10, -10, ylim=c(0, 9), xlim=c(0, 9), axes=FALSE, ...)
    circle(x=3, y=6, r=3, col=rgb(1,0,0,.5), border=NA)
    circle(x=6, y=6, r=3, col=rgb(0,.5,.1,.5), border=NA)
    circle(x=4.5, y=3, r=3, col=rgb(0,0,1,.5), border=NA)

    text( x=c(1.2, 7.7, 4.5), y=c(7.8, 7.8, 0.8), c("E", "A", "B"), cex=3, col="gray90" )
    message.to.print <-  c(nE, nA, nB, nEA, nEB, nAB, nEAB)

    if(percentage){
      unionEAB <-union(unionEA,B)
      unqueEAB <- unique(unionEAB)
      nUnionEAB <- length(unqueEAB)

      message.to.print <- c(round(nE/nUnionEAB*100,2), round( nA/nUnionEAB*100,2), round( nB/nUnionEAB*100,2), round( nEA/nUnionEAB*100,2), round( nEB/nUnionEAB*100,2), round( nAB/nUnionEAB*100,2), round( nEAB/nUnionEAB*100,2))
    }

    text(
        x=c(2, 7, 4.5, 4.5, 3, 6, 4.5), 
        y=c(7, 7, 2  , 7  , 4, 4, 5), 
        message.to.print, 
        cex=2
    )

    if(getdata){
        list(E=uniqueE, A=uniqueA, B=uniqueB, 
                EA=intersEA , EB=intersEB , AB=intersAB , 
                EAB=intersEAB
        )
    }
}#venndia#
