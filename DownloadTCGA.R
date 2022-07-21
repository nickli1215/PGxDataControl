BiocManager::install("TCGAbiolinks")
library(TCGAbiolinks)
library(genefu)
library(xtable)
library(rmeta)
library(Biobase)
library(caret)

NonLegacy.query<-GDCquery(
  project = "TCGA-BRCA",
  data.category = "Transcriptome Profiling",
  data.type = "Gene Expression Quantification",
  workflow.type = "STAR - Counts",
  legacy = FALSE
)
GDCdownload(
  query = NonLegacy.query, 
  method = "api", 
  files.per.chunk = 20
)
exprs.data <- GDCprepare(query = NonLegacy.query,save = TRUE, 
                   save.filename = "TCGA_BRCA_ExpCounts.rda")