
TF = c("CTCF", "POL2", "BHLHE40", "ATF3", "NFYB", "JUND", "CCNT2", "CFOS", "E2F4", "GATA1")
path = "/nfs/th_group/hk3/SYD_TFS/K562"

get.lengths <- function(TFs, path.to.length.files){
  par(mfrow = c(2,5)) 
  for(tf in TFs){
    lengths.file = paste(path.to.length.files, "/", tf,"/", tf,"_Peak_Lengths.txt", sep="")
    len.for.one.tf = scan(lengths.file)
    hist(len.for.one.tf, col='red', main = paste(tf), xlab = 'length', breaks = seq(0,11000, by=200), ylim=c(0,900))
  }
  
}#get.lengths#
