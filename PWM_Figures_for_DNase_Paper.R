PLOT.WEIGHTS.FOR.EACH.BASE <- function(dataFile,Main){
  pwm_data<- scan(file= dataFile, sep =",", quiet = TRUE)
  pwm_matrix <- matrix(pwm_data, ncol =4, byrow = TRUE)
  plot(pwm_matrix[,1],col = 'red', lwd =3, type = 'l', ylab= 'weight', xlab= 'position',ylim= c(-2,1),main = Main)
lines(pwm_matrix[,2], col = 'blue', lwd =3)
lines(pwm_matrix[,3], col = 'green', lwd =3)
lines(pwm_matrix[,4], col = 'grey', lwd =3)
abline(v = 10, lty='dashed',lwd=2, col='orange')
abline(v=46, lty='dashed',lwd=2, col='orange')
legend('topright', legend = c("a","c","g","t"), lty=1:4,col = c("red", "blue","green", "grey"), pt.bg = 'orange', pt.lwd =3, lwd =2, bg= 'khaki', ncol =2)

}#PLOT.WEIGHTS.FOR.EACH.BASE#



######################  interface ########

## K562
K562.PWM.File       = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/pwm_real_tags.txt"
K562.BG.PWM.File    = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/pwm_shifted_tags.txt"
  
Gm12878.PWM.File    = "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/pwm_real_tags.txt"
Gm12878.BG.PWM.File = "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/pwm_shifted_tags.txt"
  
H1hesc.PWM.File     = "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc_For_Paper_Analysis/pwm_real_tags.txt"
H1hesc.BG.PWM.File  = "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc_For_Paper_Analysis/pwm_shifted_tags.txt"



pdf("Bias_at_Tags_Level.pdf", width = 12, height = 12)


par(cex=2, lwd =1, col.axis='black', col.lab='black', col.main='black', col.sub='black', fg='black', cex.axis=1.1, mfrow=c(2,3))

PLOT.WEIGHTS.FOR.EACH.BASE(K562.PWM.File, "K562")
#PLOT.WEIGHTS.FOR.EACH.BASE(K562.BG.PWM.File, "K562 background")


PLOT.WEIGHTS.FOR.EACH.BASE(Gm12878.PWM.File, "Gm12878")
#PLOT.WEIGHTS.FOR.EACH.BASE(Gm12878.BG.PWM.File, "Gm12878 background")

PLOT.WEIGHTS.FOR.EACH.BASE(H1hesc.PWM.File, "H1hesc")




#histone data

# K562    
K562.H3k4me3.PWM.File =  "/nfs/th_group/hk3/wgEncodeUwHistone/K562_Histon/pwm_real_tags.txt"
#K562.H3k4me3.BG.PWM.File =  "/nfs/th_group/hk3/wgEncodeUwHistone/K562_Histon/pwm_shifted_tags.txt"

# Gm12878
Gm12878.H3k4me3.PWM.File   = "/nfs/th_group/hk3/wgEncodeUwHistone/Gm12878_Histone/pwm_real_tags.txt"
#Gm12878.H3k4me3.BG.PWM.File = "/nfs/th_group/hk3/wgEncodeUwHistone/Gm12878_Histone/pwm_shifted_tags.txt"




PLOT.WEIGHTS.FOR.EACH.BASE(K562.H3k4me3.PWM.File, "K562: H3k4me3")
#PLOT.WEIGHTS.FOR.EACH.BASE(Gm12878.H3k4me3.PWM.File, "Gm12878, H3k4me3")


PLOT.WEIGHTS.FOR.EACH.BASE(H1hesc.BG.PWM.File, "H1hesc: Randomly Generated Tags")


title("Sequence Bias at Tags Level", outer= TRUE, line = -1.3)
dev.off()
