install.packages("augmentedRCBD")
library(augmentedRCBD)
setwd("C:/Users/user/Desktop/github/augumented RBD")
augRBD <- read.csv("C:/Users/user/Desktop/github/augumented RBD/augRBD.csv")
augRBD
options(max.print = 10000)
augRBD$Blk <- as.factor(augRBD$Blk)
augRBD$trt <- as.factor(augRBD$trt)
str(augRBD)
bout <- augmentedRCBD.bulk(data = augRBD, block = "Blk",
                           treatment = "trt", traits = c("DFF", "NPB","NSB","TW","SY"),
                           checks = NULL, alpha = 0.05, describe = TRUE,
                           freqdist = TRUE, gva = TRUE,
                           check.col = c("brown", "darkcyan",
                                         "forestgreen"),
                           console = TRUE)
report.augmentedRCBD.bulk(aug.bulk = bout, target = file.path(tempdir(), "augRBD_Result.docx"))
tempdir()
