### for more information about insalling and running ZINBA look at: https://code.google.com/p/zinba/wiki/UsingZINBA
# bsub -q long -o zinba_0.05_%J.output -e zinba_0.05_%J.err -M8000000 -R"select[mem>8000] rusage[mem=8000]" /software/bin/R-2.15 CMD BATCH ZINBA_Analysis.r
library(zinba)

# the following function must call only once, unless one of the parameters changes
#generateAlignability(
#                     mapdir      ="/nfs/th_group/hk3/MAPPABLE_DATA_HG19_For_ZINBA/Human",
#                     outdir      = "/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/Helas3",
#                    athresh     = 1,      #number of hits per read allowed during mapping process
#                     extension   = 150,  # average fragment library length
#                     twoBitFile  = "/nfs/th_group/hk3/Human_Genome_Build/hg19.2bit"
#                     )
basealigncount(
               inputfile  ="/nfs/th_group/hk3/Hotspot_vs_F_Seq/UW/Helas3/wgEncodeUwDnaseHelas3AlnRep1_chr22.bed",
               outputfile = "/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/Helas3/wgEncodeUwDnaseHelas3AlnRep1_chr22_0.05.basecount",
               extension  = 150,
               filetype   ="bed",
               twoBitFile="/nfs/th_group/hk3/Human_Genome_Build/hg19.2bit"
               )
zinba(
      align="/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/Helas3",
      numProc=5,
      threshold=0.05, #FDR threshold the default is 0.05 
      seq= "/nfs/th_group/hk3/Hotspot_vs_F_Seq/UW/Helas3/wgEncodeUwDnaseHelas3AlnRep1_chr22.bed",
      basecountfile="/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/Helas3/wgEncodeUwDnaseHelas3AlnRep1_chr22_0.05.basecount",
      filetype="bed",
      #outfile="/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/K562/ZINBA_OUT_3_FDR_0.75",
      outfile="/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/Helas3/ZINBA_OUT_FDR_0.05",
      twoBit="/nfs/th_group/hk3/Human_Genome_Build/hg19.2bit",
      extension=150,
      printFullOut=1,
      refinepeaks=1,
      broad=F,
      input="none"
      )



#
#run.zinba(
#  seq= "/nfs/th_group/hk3/Hotspot_vs_F_Seq/UW/K562/wgEncodeUwDnaseK562AlnRep1_chr22.bed",
#  input="none",
#  filetype="bed",
#  twoBit="/nfs/th_group/hk3/Human_Genome_Build/hg19.2bit",       
#  winSize=500,
#  offset=250,
#  extension=134,
#  basecountfile="/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/K562/wgEncodeUwDnaseK562AlnRep1_chr22.basecount",
#  align="/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/K562",
#  selectmodel=T, 
#  selectchr = "chr22",
#  selecttype = "dirty",
#  selectcovs = c("gcPerc", "align_perc", "exp_cnvwin_log"), 
#  interaction= T, 
#  threshold=0.005, # default is 0.05
#  refinepeaks=1, 
#  numProc=5,
#  winGap=0,   
#  FDR=TRUE,
#  outfile="/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/K562/ZINBA_OUT_FDR_0.005",
#  printFullOut=0,
#  method="mixture",
#  cleanup=TRUE        
#)





# summary of zinba output

zinba.peaks <- read.table(file = "/nfs/th_group/hk3/ZINBA_ANALYSIS/UW/K562/ZINBA_OUT_3.peaks", header = TRUE)
