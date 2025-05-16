#!/usr/bin/env sh

######################################################################
# @author      : qhauck (qhauck@midway2-login2.rcc.local)
# @file        : setting_up_snakemake
# @created     : Monday May 12, 2025 14:47:54 CST
#
# @description : 
######################################################################

for file in ../splicing_PCA/pca_testing/tcga_sampling/all_genes/chr*.tsv
do
    chr=$(basename $file .tsv )
    mkdir -p $chr
    
    cp Snakefile $chr/

    cd $chr
    snakemake -s Snakefile --executor slurm --default-resources slurm_partition=broadwl slurm_account=pi-yangili1 --jobs 90 --use-conda --rerun-incomplete

    cd ..
done

