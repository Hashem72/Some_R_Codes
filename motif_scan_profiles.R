NMSCAN_OUTPUT = read.table("/Users/hk3/Desktop/Main/Five_Vertebrate/Motif_Scan/hsap/hsap_cebpa_500_cfg52_nreads_summit_12_motifscanThreshold_minus100_as_table.txt", sep = "")

CHR1_NMSCAN_SCORES_BOTH_STRANDS =  NMSCAN_OUTPUT[,6]
POSITIVE_STRAND_INDICES        = seq(1,length(CHR1_NMSCAN_SCORES_BOTH_STRANDS), by=2)
NEGATIVE_STRAND_INDICES        = seq(2,length(CHR1_NMSCAN_SCORES_BOTH_STRANDS), by=2)
POSITIVE_STARND_SCORES        =  CHR1_NMSCAN_SCORES_BOTH_STRANDS[POSITIVE_STRAND_INDICES]
NEGATIVE_STRAND_SCORES        = CHR1_NMSCAN_SCORES_BOTH_STRANDS[NEGATIVE_STRAND_INDICES]
Threshold                     = -4.0
POSITIVE_SCORES_WITH_APPLIED_THRESHOLD = FILTER_SCORES_LOWER_THAN_THRESHOLD(POSITIVE_STARND_SCORES, Threshold)
Negative_Scores_With_Applied_Threshold = FILTER_SCORES_LOWER_THAN_THRESHOLD(NEGATIVE_STRAND_SCORES, Threshold)

plot( POSITIVE_SCORES_WITH_APPLIED_THRESHOLD,col = colors()[32], type = 'l')
lines(Negative_Scores_With_Applied_Threshold, col = colors()[26] )

# ===============================================================
#                       FUCNTIONS                               #
#================================================================


FILTER_SCORES_LOWER_THAN_THRESHOLD <- function(vectorOfScores,threshold){
	Length_of_vector  = length(vectorOfScores)
	Mean_of_vector    = mean(vectorOfScores)
	for(i in 1:Length_of_vector){
		if(vectorOfScores[i]< threshold){
			vectorOfScores[i] = threshold
			}
		}
		vectorOfScores
		
	}#FILTER_SCORES_LOWER_THAN_THRESHOLD#

plot(POSITIVE_STARND_SCORES, col =2, type= "l")
lines(NEGATIVE_STRAND_SCORES, col =3)
