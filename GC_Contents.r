#UW data:
UW.Gm12878 <- "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/GC_Content_rep1.txt"
UW.K562    <- "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/GC_Content_rep1.txt"
UW.H1hesc  <- "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc_For_Paper_Analysis/GC_Content_rep1.txt"
UW.Hsmm    <- "/nfs/th_group/hk3/UW_DNaseI_HS/Hsmm_For_Paper_Analysis/GC_Content_rep1.txt"
UW.Helas3  <- "/nfs/th_group/hk3/UW_DNaseI_HS/Helas3_For_Paper_Analysis/GC_Content_rep1.txt"



#Duke data:
Duke.Gm12878 <- "/nfs/th_group/hk3/Duke_DNaseI_HS/Gm12878_For_Paper_Analysis/GC_Content1.txt"
Duke.K562    <- "/nfs/th_group/hk3/Duke_DNaseI_HS/K562_For_Paper_Analysis/GC_Content1.txt"
Duke.H1hesc  <- "/nfs/th_group/hk3/Duke_DNaseI_HS/H1hesc_For_Paper_Analysis/GC_Content1.txt"
Duke.Hsmm    <- "/nfs/th_group/hk3/Duke_DNaseI_HS/Hsmm_For_Paper_Analysis/GC_Content1.txt"
Duke.Helas3  <- "/nfs/th_group/hk3/Duke_DNaseI_HS/Helas3_For_Paper_Analysis/GC_Content1.txt"







###################################################


get.gc.content.data <- function(uw.FileName, uDuke.FileName, title = " "){
  
  uw.data   = scan(uw.FileName, skip=1)
  duke.data = scan(uDuke.FileName, skip = 1)

  myList = list(UWGM = uw.data, DUKEGM = duke.data)

  boxplot(myList,  names = c("UW", "Duke"), col = c('red', 'blue'), main = title, ylab = "GC Content")
  
  #boxplot(duke.data, main = "Duke")
 # hist(uw.data, breaks = 1000, col = 'red')
  #hist(duke.data, breaks =1000, col = 'blue', add = TRUE)
}



pdf("Figures/GC_Content_UW_VS_Duke.pdf", height = 6, width = 10)
par(mfrow = c(1,5))
get.gc.content.data(UW.Gm12878, Duke.Gm12878, "Gm12878")
get.gc.content.data(UW.K562, Duke.K562, "K562")
get.gc.content.data(UW.H1hesc, Duke.H1hesc, "H1hesc")
get.gc.content.data(UW.Hsmm, Duke.Hsmm, "Hsmm")
get.gc.content.data(UW.Helas3, Duke.Helas3, "Helas3")
dev.off()
