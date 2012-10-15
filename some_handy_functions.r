#Note: you may need to use  R-2.14.1 with to loading the following libraries: 
library(plyr)
library(ggplot2)
library(reshape2)


k.mer.as.data.frame <- function(RealKMersFile, BgKmersFile){
  tab5rows  <- read.table(RealKMersFile, nrows = 5)
  classes   <- sapply(tab5rows,class)
  Data.Real <- read.table(RealKMersFile, comment.char = "", colClasses = classes)

  tab5rowsBG <- read.table(BgKmersFile, nrows =5)
  classesBG  <- sapply(tab5rowsBG, class)
  Data.Bg <- read.table(BgKmersFile, comment.char = "", colClasses = classesBG)
  Bg.Freq <- Data.Bg[,2]

  Combind.Data <- cbind(Data.Real, Bg.Freq)
  
  colNames <- c("kmer","Real_Tags_Frequency", "BG_Tags_Frequency")
  colnames(Combind.Data) <- colNames
  
  data.as.df <- as.data.frame(Combind.Data)
  data.as.df
}#k.mer.as.data.frame#




density.file.as.data.frame <- function(densityFile){
  tab5rows <- read.table(densityFile, nrows =5)
  classes <- sapply(tab5rows, class)
  data <- read.table(densityFile, comment.char = "", sep= "\t", colClasses = classes)
  colName <- c("A", "B", "C")
  colnames(data) <- colName
  data.as.df <- as.data.frame(data)
  data.as.df
}#density.file.as.data.frame#

scatterplots.as.matrix <- function(fileName, colNames = c("A","B", "C")){
  par(cex=2, lwd =3, col.axis=300, col.lab=300, col.main=300, col.sub=300, fg=300)
  df = density.file.as.data.frame(fileName)
  numb.of.names = length(colNames)
  num.of.cols = ncol(df)
  if(numb.of.names != num.of.cols){
    stop(paste("there are ",  num.of.cols, "columns but you passed only " , numb.of.names," names!", sep= " "))
  }
  colnames(df) = colNames
  
  
  df.r = abs(cor(df))
  df.color = dmat.color(df.r)
  df.order = order.single(df.r)
  cpairs(df, df.order, panel.colors=df.color, gap=0.5, main="variables ordered and colored by correlation")
  cor(df)
}#scatterplots.as.matrix#


bed.as.data.frame <- function(aBedFile){
  #will read a bed file and return it as a data frame
  #bed files must have either 3 or 6 or 9 columns

  #for large tables it would be faster if we define colClasses parameter:
  tab5rows <- read.table(aBedFile,  nrows = 5)
  classes <- sapply(tab5rows, class)
  data <-  read.table(aBedFile, comment.char = "", colClasses = classes)
  numCol <- ncol(data)
  if(numCol == 3){
    colName = c("chrom", "start", "end")
  }
  else if(numCol == 6){
    colName = c("chrom", "start", "end", "name", "score", "strand")
  }
  else if(numCol == 9){
    colName = c("chrom", "start", "end", "name", "score", "strand", "thickStart", "thickEnd", "itemRgb")
  }
  else if(numCol == 12){
    colName = c("chrom", "start", "end", "name", "score", "strand", "thickStart", "thickEnd", "itemRgb", "blockCount", "blockSize", "blockStarts")
  }
  else{
    stop(paste("Expected a bed file but got file with ", numCol, " collumns!", sep = " "))
  }
  colnames(data) <- colName
  data.as.df <- as.data.frame(data)
  data.as.df
}#bed.as.data.frame#

distribution.of.hotspost <- function(dfE, dfA,dfB, BinWidth= 1000, cellType){
  #dfA: is the data frame of Encode Hotspots, dfA data frame of A hotsopts and so on
  Main <- paste("distribution of", cellType, " hotspots with binwidth=", BinWidth ,sep = " ")
  starts <- c(dfE$start, dfA$start, dfB$start)
  Min   <- min(starts)
  ends <- c(dfE$end, dfA$end, dfB$end)
  Max <- max(ends)
  Names <- c(rep("E", length(dfE$start)), rep("A", length(dfA$start) ), rep("B", length(dfB$start)) )
  newDF <- data.frame(starts = starts, ends = ends, Names = Names)

  E.sum <- sum(dfE$end-dfE$start)
  A.sum <- sum(dfA$end-dfA$start)
  B.sum <-  sum(dfB$end-dfB$start)
  E.coverage <- (E.sum/(Max-Min))*100
  A.coverage <- (A.sum/(Max-Min))*100
  B.coverage <- (B.sum/(Max-Min))*100
  cat(paste("E coverage percent = ", round(E.coverage, 0), "\n A coverage percent" ,round( A.coverage,0), "\n B coverage percent= ",round( B.coverage,0),"\n"), sep = " ")
  
  qplot((ends-starts)/2 +starts, data = newDF, geom = "histogram", binwidth = BinWidth, fill = Names, xlim = c(Min, Max), xlab = "midpoint of each feature", alpha = I(1/2), main = Main)

}#distribution.of.hotspost#


multiplot <- function(..., plotlist=NULL, cols) {
    require(grid)

    # Make a list from the ... arguments and plotlist
    plots <- c(list(...), plotlist)

    numPlots = length(plots)

    # Make the panel
    plotCols = cols                          # Number of columns of plots
    plotRows = ceiling(numPlots/plotCols) # Number of rows needed, calculated from # of cols

    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(plotRows, plotCols)))
    vplayout <- function(x, y)
        viewport(layout.pos.row = x, layout.pos.col = y)

    # Make each plot, in the correct location
    for (i in 1:numPlots) {
        curRow = ceiling(i/plotCols)
        curCol = (i-1) %% plotCols + 1
        print(plots[[i]], vp = vplayout(curRow, curCol ))
    }

  }#multiplot#


get.table <- function(tableFile, seperator){
  #will read a file as table
  data <- read.table(tableFile, sep = seperator)
  data
}#get.table#

draw.pwm <- function(pwm){
  # here pwm is assumed to be a matirx
  if(ncol(pwm) != 4 && nrow(pwm) != 4){
    stop(paste("either rows or columns must be 4"))
  }
  if(ncol(pwm) == 4){
    pwm <- t(pwm)
  }
 
  row.names(pwm) = c("A", "C", "G", "T")
  
  p <- ggplot(melt(pwm,varnames = c("nt", "pos")), aes(x= pos,y= value, label = nt))+
    geom_abline(aes(slope=0), colour = "grey",size=2)+
  geom_text(aes(colour=factor(nt)),size=8)+
    opts(legent.position= "none")+
    scale_x_continuous(name="Position",breaks=1:ncol(pwm))+
    scale_y_continuous(name="Log relative frequency")
  return (p)
  #pwm
}#draw.pwm#


PLOT.WEIGHTS.FOR.EACH.BASE <- function(dataFile,Main){
  pwm_data<- scan(file= dataFile, sep =",", quiet = TRUE)
  pwm_matrix <- matrix(pwm_data, ncol =4, byrow = TRUE)
  plot(pwm_matrix[,1],col = 'red', lwd =3, type = 'l', ylab= 'weight', xlab= 'position',ylim= c(-2,1),main = Main)
lines(pwm_matrix[,2], col = 'blue', lwd =3)
lines(pwm_matrix[,3], col = 'green', lwd =3)
lines(pwm_matrix[,4], col = 'grey', lwd =3)
legend('topright', legend = c("a","c","g","t"), lty=1:4,col = c("red", "blue","green", "grey"), pt.bg = 'orange', pt.lwd =3, lwd =2, bg= 'khaki', ncol =2)

}#PLOT.WEIGHTS.FOR.EACH.BASE#




