#Note: you may need to use  R-2.14.1 with to loading the following libraries: 
#library(plyr)
#library(ggplot2)
#library(reshape2)



bed.as.data.frame <- function(aBedFile){
  #will read a bed file and return it as a data frame
  #bed files must have either 3 or 6 or 9 columns

  data <-  read.table(aBedFile)
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


#  p<-ggplot(melt(bval,varnames=c("nt","pos")),aes(x=pos,y=value,label=nt))+
#    geom_abline(aes(slope=0), colour = "grey",size=2)+
#    geom_text(aes(colour=factor(nt)),size=8)+
#    opts(legend.position="none")+
#    scale_x_continuous(name="Position",breaks=1:ncol(bval))+
#    scale_y_continuous(name="Log relative frequency")
#  return(p)
