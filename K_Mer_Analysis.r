source("some_handy_functions.r")

path.To.UW.Data = "/nfs/th_group/hk3/UW_DNaseI_HS/"
path.To.Duke.Data = "/nfs/th_group/hk3/Duke_DNaseI_HS/"




plot.k.mers.frequency <- function(RealTagFreqFile, BgTagFreqFile, cellType){
  df    <- k.mer.as.data.frame(RealTagFreqFile, BgTagFreqFile)
  Max   <- max( df$Real_Tags_Frequency, df$BG_Tags_Frequency)
  Title <- paste("k-mers distribution: ", cellType, "vs BG", sep=" ")
  Plot <-ggplot(df, aes(x=Real_Tags_Frequency,y=BG_Tags_Frequency))+geom_point(shape=1)+xlim(0,Max)+ylim(0,Max)+xlab("Real Tags")+ylab("background")+geom_smooth(method=lm)+opts(title=Title)
  Plot
}#plot.k.mers.frequency#


three.cell.line.plots <- function(firstCellLine, secondCellLine, thirdCellLine, kmer=8, RepMasked="RepeatMasked",threshold =60,path.Data){
  first.cell.line.file.real = paste(path.Data,firstCellLine,"_For_Paper_Analysis/",RepMasked,"_",kmer,"_mers_counts_real.txt", sep="")
  first.cell.line.file.bg = paste(path.Data,firstCellLine,"_For_Paper_Analysis/",RepMasked,"_",kmer,"_mers_counts_bg.txt", sep="")
 

   second.cell.line.file.real = paste(path.Data,secondCellLine,"_For_Paper_Analysis/",RepMasked,"_",kmer,"_mers_counts_real.txt", sep="")
  second.cell.line.file.bg = paste(path.Data,secondCellLine,"_For_Paper_Analysis/",RepMasked,"_",kmer,"_mers_counts_bg.txt", sep="")
  

  third.cell.line.file.real = paste(path.Data, thirdCellLine,"_For_Paper_Analysis/",RepMasked,"_",kmer,"_mers_counts_real.txt", sep="")
  third.cell.line.file.bg = paste(path.Data,thirdCellLine,"_For_Paper_Analysis/",RepMasked,"_",kmer,"_mers_counts_bg.txt", sep="")

First.Plot  = plot.k.mers.frequency(first.cell.line.file.real, first.cell.line.file.bg,firstCellLine )
Second.Plot = plot.k.mers.frequency(second.cell.line.file.real, second.cell.line.file.bg,secondCellLine )
Third.Plot  = plot.k.mers.frequency(third.cell.line.file.real,  third.cell.line.file.bg, thirdCellLine )
  
multiplot(First.Plot+geom_abline(intercept=-threshold,slope=1,colour='red'), Second.Plot+geom_abline(intercept=-threshold,slope=1,colour='red'), Third.Plot+geom_abline(intercept=-threshold,slope=1,colour='red'), cols=1)
  
}#three.cell.line.plots#



get.common.kmers <- function(firstCellLine, secondCellLine, thirdCellLine, kmer=8, RepMasked="RepeatMasked", threshold =60, URT = 200,path.To.Data){
   first.cell.line.file.real = paste(path.To.Data,firstCellLine,"_For_Paper_Analysis/",RepMasked,"_",kmer,"_mers_counts_real.txt", sep="")
  first.cell.line.file.bg = paste(path.To.Data,firstCellLine,"_For_Paper_Analysis/",RepMasked,"_",kmer,"_mers_counts_bg.txt", sep="")
 

   second.cell.line.file.real = paste(path.To.Data,secondCellLine,"_For_Paper_Analysis/",RepMasked,"_",kmer,"_mers_counts_real.txt", sep="")
  second.cell.line.file.bg = paste(path.To.Data, secondCellLine,"_For_Paper_Analysis/",RepMasked,"_",kmer,"_mers_counts_bg.txt", sep="")
  

  third.cell.line.file.real = paste(path.To.Data, thirdCellLine,"_For_Paper_Analysis/",RepMasked,"_",kmer,"_mers_counts_real.txt", sep="")
  third.cell.line.file.bg = paste(path.To.Data,thirdCellLine,"_For_Paper_Analysis/",RepMasked,"_",kmer,"_mers_counts_bg.txt", sep="")


First.DF   = k.mer.as.data.frame(first.cell.line.file.real, first.cell.line.file.bg)
Second.DF  = k.mer.as.data.frame(second.cell.line.file.real, second.cell.line.file.bg)
Third.DF   = k.mer.as.data.frame(third.cell.line.file.real, third.cell.line.file.bg)

First.Under.Indices = which(First.DF$BG_Tags_Frequency - First.DF$Real_Tags_Frequency >= URT)
Second.Under.Indices = which(Second.DF$BG_Tags_Frequency - Second.DF$Real_Tags_Frequency >= URT)
Third.Under.Indices = which(Third.DF$BG_Tags_Frequency - Third.DF$Real_Tags_Frequency >= URT)
 print("=========================================")
 print(First.DF[First.Under.Indices,])
 print(Second.DF[Second.Under.Indices,])
 print(Third.DF[Third.Under.Indices,])
  print("=========================================")  
First.Over.Represnted.Indices = which( First.DF$Real_Tags_Frequency - First.DF$BG_Tags_Frequency >= threshold )
First.Over.Reprented          =  First.DF[First.Over.Represnted.Indices, 1]

Second.Over.Represnted.Indices = which( Second.DF$Real_Tags_Frequency - Second.DF$BG_Tags_Frequency >= threshold )
Second.Over.Reprented          =  Second.DF[Second.Over.Represnted.Indices, 1]

Third.Over.Represnted.Indices = which( Third.DF$Real_Tags_Frequency - Third.DF$BG_Tags_Frequency >= threshold )
Third.Over.Reprented          =  Third.DF[Third.Over.Represnted.Indices, 1]

First.And.Second.Commons = intersect(First.Over.Reprented, Second.Over.Reprented)
print(paste("first and Second Common"))
print(First.And.Second.Commons)


Firts.And.Third.Commons = intersect(First.Over.Reprented, Third.Over.Reprented )
print("First and Third")
print(Firts.And.Third.Commons)

 Second.And.Third.Commons = intersect(Second.Over.Reprented, Third.Over.Reprented)
 print("Second and Third ")
 print(Second.And.Third.Commons)

 All.Commons = intersect(First.And.Second.Commons, Third.Over.Reprented)
 print("Common in all three cell lines: ")
  print(All.Commons)
}#get.common.kmers#

write.over.represented.kmers.into.a.fasta.file <- function(cellLine,  kmer=8, RepMasked="RepeatMasked", threshold =60, URT = 200,path.To.Data){
     real.tags = paste(path.To.Data, cellLine,"_For_Paper_Analysis/",RepMasked,"_",kmer,"_mers_counts_real.txt", sep="")
     bg.tags= paste(path.To.Data, cellLine,"_For_Paper_Analysis/",RepMasked,"_",kmer,"_mers_counts_bg.txt", sep="")
     output.file.name = paste(path.To.Data, cellLine,"_For_Paper_Analysis/","OverRepresentd_" ,RepMasked,"_",kmer,"_mers.fasta", sep="")

     fileConn <- file(output.file.name)
 
     DF <-  k.mer.as.data.frame(real.tags, bg.tags)
     OR.Indices = which( (DF$Real_Tags_Frequency - DF$BG_Tags_Frequency) >= threshold)

     Ids.And.Seqs = c()
         
     for (i in OR.Indices){
       id = paste(">",DF[i,2],"_",DF[i,3] , sep="")
       Ids.And.Seqs = c(Ids.And.Seqs, id)
       seq=DF$kmer[i]
       seq = factor(seq)
       seq = toString(seq)
       Ids.And.Seqs = c(Ids.And.Seqs,seq)
      # Seqs = c(Seqs, seq)
       #Names = c(Names,id)
      # print(id)
       #print(seq)
     }
     writeLines( Ids.And.Seqs,fileConn)
     close(fileConn)
 #print(length(Seqs))
#write.fasta(sequences=Seqs,names=Names, file.out = output.file.name,  open = "w", nbchar = 60)
  
}#write.over.represented.kmers.into.a.fasta.file#
