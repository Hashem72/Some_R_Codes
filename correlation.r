make.correlation.over.cumulative.sum <- function(df.of.densities){
  
  numbero.of.rows  = ncol(df.of.densities)
  diff =  numbero.of.rows -3
  #print(paste(diff))
  result = matrix(nrow = diff, ncol = 3)
  
  for(i in 1:3){
    sum = df.of.densities[,4]
    
    one.cor = cor(df.of.densities[,i], df.of.densities[,4])
    result[1,i] =  one.cor
   # print(paste("one.cor = ", one.cor, sep = " "))
    col.counter =2
    for(j in 5:numbero.of.rows){
      sum = sum  + df.of.densities[,j]
      cumulative.cor = cor(df.of.densities[,i],sum)
       result[col.counter,i] = cumulative.cor
      # print(paste("i= ", i, "j = ", j, " cor= ", cumulative.cor, sep = " "))
      col.counter =  col.counter + 1
    }
  }
   result
}#

make.correlation.plot <- function(df.of.densities, dnasei){
  data = make.correlation.over.cumulative.sum(df.of.densities)
  col.names = colnames(df.of.densities)
  tf.names = col.names[4:length(col.names)] 
  number.of.tfs = length(tf.names)
  plot(data[,1], lty=2, col='blue', lwd=2, pch=2,axes=FALSE, xlab='Chip-Seq TFs', ylab='pearson correlation',main= 'cumulative correlation of factors with DNaseI')
  points(data[,2], lty=2, lwd=2, pch=3, col='red')
  points(data[,3], lty=2, lwd=2, pch=4, col='green')
  axis(1, at=1:number.of.tfs, labels=tf.names )
  axis(2, at=seq(0, 0.7, by=0.1))
  individual.correlations = c()
  for (i in 4:length(col.names)){
    one.corr = cor(df.of.densities[,dnasei], df.of.densities[,i])
    print(one.corr)
    individual.correlations = c(individual.correlations,one.corr )
  }
#  points(individual.correlations,lty=2, col='black')
  legend("bottomright", legend=c("unbiased","biased", "whole"), pch = c(2,3,4), lty=c(2,2,2),col=c('blue','red','green'), text.col=c('blue','red','green') )
  
}#make.correlation.plot#
