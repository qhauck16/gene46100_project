.libPaths('/scratch/midway2/qhauck/conda_env/rstudio-server/lib/R/library/')
library(data.table)
library(tidyverse)
library(fastTopics)
library(readr)

fasttopics_dir <- '/project2/yangili1/qhauck/splicing_PCA/pca_testing/tcga_sampling/tcga_vs_sf_ko/250505_filters/'

metadata <- fread('/project2/yangili1/qhauck/splicing_PCA/pca_testing/tcga_sampling/tcga_v2_samples.tsv')

for(chr in c(1:22, 'X')){
  
  genes <- list.dirs(paste0('/project2/yangili1/qhauck/splicing_PCA/pca_testing/tcga_sampling/tcga_vs_sf_ko/250505_filters/chr', chr, '/FastTopics_output/'))
  genes <- basename(genes)[2:length(genes)]
  for (gene in genes){
    
    res <- readRDS(paste0(fasttopics_dir,'chr', chr, '/FastTopics_output/', gene, '/res.RDS'))
    
    aml_loadings <- res$L[rownames(res$L) %in% metadata$rail_id[metadata$gdc_cases.project.project_id == 'TCGA-LAML'],]
    
    aml_loadings <- as.data.frame(aml_loadings) %>%
      rownames_to_column('rail_id')
    
    write_tsv(aml_loadings, paste0('chr', chr, '/', gene, '_aml_loadings.tsv'))
  }
  
}


