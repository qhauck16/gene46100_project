## APPLYING SIMPLE MLP ARCHITECTURE TOWARDS THE CLASSIFICATION OF SPLICE FACTOR MUTANTS IN TCGA

This model uses a basic Multi-layer perceptron to attempt to classify three type of splice factor mutants common in cancer: _SF3B1_, _RBM10_ and _U2AF1_ mutants.
The model is written in the file model.ipynb, and requires two metadata files, [tcga_v2_samples.tsv](https://snaptron.cs.jhu.edu/data/tcgav2/samples.tsv) and [seiller_splicing_mutant_metadata.xlsx](https://ars.els-cdn.com/content/image/1-s2.0-S2211124718301529-mmc3.xlsx), which should be converted to a text file by users upon download.

Any numerical data associated with individual rail IDs from Snaptron can be used for classification. I used privately processed loadings upon Poisson non-negative matrix factorization (NMF) factors run across TCGA junction counts from snaptron as my input, simply as these loadings are an easy way to store normalized splicing information at a sample level.

Data for this project come from [TCGA](https://www.cancer.gov/ccg/research/genome-sequencing/tcga) which was pre-processed by [Christopher Wilks et al](https://academic.oup.com/bioinformatics/article/34/1/114/4101942).
Data was accessed via [Snaptron](https://snaptron.cs.jhu.edu/).
Splice Factor Mutant Classifications come from [Seiler et al](10.1016/j.celrep.2018.01.088).

NMF factors and loadings were generated using [Fasttopics](https://cran.r-project.org/web/packages/fastTopics/index.html) from [Carbonetto et al](https://doi.org/10.48550/arXiv.2105.13440).


This model was submitted for the final project for GENE 46100 at The University of Chicago, Spring 2025
