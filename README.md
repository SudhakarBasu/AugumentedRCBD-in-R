# Augmented Randomized Complete Block Design (RCBD) Analysis

## Overview

Augmented randomized complete block design (RCBD) is a design that can be used when there are limited facilities or a lack of seed for testing many treatments. In this design, augmented blocks are built and the same number of controls are allocated in each block along with the treatments.

This repository contains an R script for analyzing augmented RCBD data using the `augmentedRCBD` package.

## Features

- **Bulk analysis** of multiple traits simultaneously
- **Descriptive statistics** for all traits
- **Frequency distribution** visualization
- **Genetic variability analysis (GVA)**
- **Automated report generation** in Word format
- Support for custom check treatments with color coding

## Installation

### Prerequisites

Make sure you have R installed on your system. Then install the required package:

```r
install.packages("augmentedRCBD")
library(augmentedRCBD)
```

## Data Format

Your data should be in CSV format with the following structure:

- **Blk**: Block identifier (will be converted to factor)
- **trt**: Treatment identifier (will be converted to factor)
- **Trait columns**: Numerical measurements for each trait

Example traits analyzed in this script:
- `DFF` - Days to First Flowering
- `NPB` - Number of Primary Branches
- `NSB` - Number of Secondary Branches
- `TW` - Test Weight
- `SY` - Seed Yield

## Usage

1. **Set your working directory** to the location of your data:

```r
setwd("path/to/your/directory")
```

2. **Load your data**:

```r
augRBD <- read.csv("augRBD.csv")
```

3. **Convert block and treatment columns to factors**:

```r
augRBD$Blk <- as.factor(augRBD$Blk)
augRBD$trt <- as.factor(augRBD$trt)
```

4. **Run the augmented RCBD analysis**:

```r
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
```

5. **Generate a comprehensive report**:

```r
report.augmentedRCBD.bulk(aug.bulk = bout, 
                          target = file.path(tempdir(), "augRBD_Result.docx"))
```

## Analysis Parameters

- **alpha**: Significance level (default: 0.05)
- **describe**: Generate descriptive statistics (TRUE/FALSE)
- **freqdist**: Generate frequency distribution plots (TRUE/FALSE)
- **gva**: Perform genetic variability analysis (TRUE/FALSE)
- **check.col**: Colors for check treatments in visualizations
- **console**: Print results to console (TRUE/FALSE)

## Output

The analysis generates:

1. **Console output**: Statistical summaries and ANOVA results
2. **Word document**: Comprehensive report including:
   - Descriptive statistics
   - Frequency distribution plots
   - ANOVA tables
   - Genetic variability parameters
   - Treatment comparisons

The report is saved in the temporary directory by default. You can find it using:

```r
tempdir()
```

## Files in This Repository

- `augumeted RBD.R` - Main R script for analysis
- `augRBD.csv` - Sample data file
- `README.md` - This documentation file
- `augRBD_Result.docx` - Example output report

## References

For more information about the `augmentedRCBD` package, visit:
- [CRAN Package Documentation](https://cran.r-project.org/package=augmentedRCBD)

## License

This project is open source and available for educational and research purposes.

## Contact

For questions or issues, please open an issue in this repository.
