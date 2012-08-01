

source("/nfs/users/nfs_h/hk3/My_R_Scripts/MAKE_MAPPABLE_10K_FILES.R")

file <- "/nfs/th_group/hk3/Data_For_Testing_Hotspots_for_gh19/data/hg18.k36.mappable_only_chr22.bed"
Length <- 49000000
Window <- 10000


MAKE.MAPPLE.10K.FILE.CHRO.SPECIFIC <- function(dataFile, chrLength, windowLength){
   dataTable = read.table(file =dataFile, sep = "\t" )
   dataMatrix= as.matrix(dataTable)
   dataMatrix
   for(p  in seq(0,chrLength,by=windowLength) ){
     X <- which( as.numeric(dataMatrix[,2 ]) < p+windowLength )
     diff <- 0
     if(length(X)>0 ){
       X.Last.Index <- X[length(X)]
       print(paste("length of X is ",length(X), sep = "   " ))
       
       if( as.numeric(dataMatrix[X.Last.Index,3 ]) > p+windowLength ){
         diff <- as.numeric(dataMatrix[X.Last.Index,3 ]) - p+windowLength
       }
   }
     
     X <- which(as.numeric(dataMatrix[X,2]) >= p  )
     L <- as.numeric(dataMatrix[X,3 ]) - as.numeric(dataMatrix[X,2 ])
     S <- sum(L)
     S <- S+diff
     print(paste("22", p, S, sep = "  "))
   }
 }
