import os
DIR = os.path.basename(os.getcwd())

GENES, = glob_wildcards("/project2/yangili1/qhauck/splicing_PCA/pca_testing/tcga_sampling/tcga_vs_sf_ko/250505_filters/" + DIR + "/FastTopics_output/{gene}/res.RDS")

rule all:
    input:
        expand("{gene}_aml_loadings.tsv", gene=GENES)

rule snaptron_to_LF:
    input:
        tcga_metadata="/project2/yangili1/qhauck/splicing_PCA/pca_testing/tcga_sampling/tcga_v2_samples.tsv",
    output:
        '{gene}_aml_loadings.tsv'
    conda: 
        "../rscript.yml"
    threads: 24
    resources:
        mem_mb=50000
    params:
        chr=DIR
    shell:
        """
        Rscript ../pulling_aml_data.R {params.chr} {wildcards.gene} {input.tcga_metadata} /project2/yangili1/qhauck/nmd_splicing_rules/add_on_script/rules_test/gencode.v46.annotation.gtf \
        /project2/yangili1/qhauck/splicing_PCA/pca_testing/tcga_sampling/tcga_vs_sf_ko/250505_filters/
        """
