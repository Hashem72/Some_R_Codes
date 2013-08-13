GM12878.Binding.Scores.File = "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/Gm12878_Binding_Scores_in_ENCODE_DHS.txt"
GM12878.Binding.Scores.Random.Seqs.File = "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/Gm12878_Binding_Scores_in_ENCODE_DHS_From_Randomly_Pickes_Sequences.txt"


K562.Binding.Scores.File = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/K562_Binding_Scores_in_ENCODE_DHS.txt"
K562.Binding.Scores.Random.Seqs.File = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/K562_Binding_Scores_in_ENCODE_DHS_From_Randomly_Pickes_Sequences.txt"

Helas3.Binding.Scores.File = "/nfs/th_group/hk3/UW_DNaseI_HS/Helas3_For_Paper_Analysis/Helas3_Binding_Scores_in_ENCODE_DHS.txt"
Helas3.Binding.Scores.Random.Seqs.File = "/nfs/th_group/hk3/UW_DNaseI_HS/Helas3_For_Paper_Analysis/Helas3_Binding_Scores_in_ENCODE_DHS_From_Randomly_Pickes_Sequences.txt"



H1hesc.Binding.Scores.File = "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc_For_Paper_Analysis/H1hesc_Binding_Scores_in_ENCODE_DHS.txt"
H1hesc.Binding.Scores.Random.Seqs.File = "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc_For_Paper_Analysis/H1hesc_Binding_Scores_in_ENCODE_DHS_From_Randomly_Pickes_Sequences.txt"


Hsmm.Binding.Scores.File = "/nfs/th_group/hk3/UW_DNaseI_HS/Hsmm_For_Paper_Analysis/Hsmm_Binding_Scores_in_ENCODE_DHS.txt"
Hsmm.Binding.Scores.Random.Seqs.File = "/nfs/th_group/hk3/UW_DNaseI_HS/Hsmm_For_Paper_Analysis/Hsmm_Binding_Scores_in_ENCODE_DHS_From_Randomly_Pickes_Sequences.txt"






get.binding.data <- function(file.Name.Real.DHS, file.Name.Random.Sequence, cell.Line){
  data.DHS = scan(file.Name.Real.DHS, sep=",")
  data.Random = scan(file.Name.Random.Sequence, sep=",")
  p.DHS = hist(data.DHS, breaks =100)
  p.Ran = hist(data.Random, breaks=100)
  plot(p.DHS, col='red', xlim=c(-5,5), main = cell.Line, xlab='motif scores'  )
  plot(p.Ran, col='blue', xlim=c(-5,5), add=T, density=50, )
}#get.binding.data#




get.binding.data(Helas3.Binding.Scores.File, Helas3.Binding.Scores.Random.Seqs.File,  "HelaS3")
get.binding.data(K562.Binding.Scores.File, K562.Binding.Scores.Random.Seqs.File, "K562")
get.binding.data(GM12878.Binding.Scores.File, GM12878.Binding.Scores.Random.Seqs.File, "GM12878")
get.binding.data(Hsmm.Binding.Scores.File, Hsmm.Binding.Scores.Random.Seqs.File, "HSMM")
