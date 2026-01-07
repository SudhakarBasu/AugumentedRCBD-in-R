# Install and load the augmentedRCBD package
install.packages("augmentedRCBD")
library(augmentedRCBD)

# Set working directory
setwd("C:/Users/user/Desktop/github/augumented RBD")

# Read the CSV file containing the augmented RBD data
augRBD <- read.csv("augRBD.csv")

# Display the data to check if it's correctly loaded
augRBD

# Set options to display more rows in the console
options(max.print = 10000)

# Convert certain columns to factors
augRBD$Blk <- as.factor(augRBD$Blk)
augRBD$trt <- as.factor(augRBD$trt)

# Check the structure of the data frame
str(augRBD)

# Perform augmented RBD analysis
bout <- augmentedRCBD.bulk(data = augRBD,
                            block = "Blk",
                            treatment = "trt",
                            traits = c("DFF", "NPB", "NSB", "TW", "SY"),
                            checks = NULL,
                            alpha = 0.05,
                            describe = TRUE,
                            freqdist = TRUE,
                            gva = TRUE,
                            check.col = c("brown", "darkcyan", "forestgreen"),
                            console = TRUE)

# Generate a report and save it as a Word document
report.augmentedRCBD.bulk(aug.bulk = bout, target = file.path(tempdir(), "augRBD_Result.docx"))

# Print the temporary directory where the report is saved
tempdir()

