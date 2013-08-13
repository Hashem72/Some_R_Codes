K562 = "/nfs/th_group/hk3/UW_DNaseI_HS/K562_For_Paper_Analysis/wgEncodeUwDnaseK562AlnRep1_chr22_with_biasness_scores_and_gc_content.txt"

Gm12878 = "/nfs/th_group/hk3/UW_DNaseI_HS/Gm12878_For_Paper_Analysis/wgEncodeUwDnaseGm12878AlnRep1_chr22_with_biasness_scores_and_gc_content.txt"


H1hesc = "/nfs/th_group/hk3/UW_DNaseI_HS/H1hesc_For_Paper_Analysis/wgEncodeUwDnaseH1hescAlnRep1_chr22_with_biasness_scores_and_gc_content.txt"


get.gc.statistics <-  function(gc.file){
  data = read.table(file = gc.file, header = TRUE, sep = "\t")
  gc.content = data$gc_content
  gc.content.sorted = sort(gc.content)
  scores    = data$score
  scores.sorted = sort(scores)
  correlation = cor(gc.content, scores)
  print(paste("correlation between gc content and bias scores is: ", correlation, sep = "  "))
  par(mfrow = c(1,2))
  plot(gc.content, scores, ylab = "scores", xlab = "gc content")
  plot(gc.content.sorted, ylab = "gc content", xlab = "indes of tags")
}#get.gc.statistics#

get.gc.statistics(K562)
get.gc.statistics(Gm12878)
get.gc.statistics(H1hesc)

