pacman::p_load(dplyr, rattle, RGtk2)
setwd("/Users/SupremeZhenZhen/Desktop")

# Decision Tree, Random Forest and Boosting Methods
loans <- read.csv("loans.csv", stringsAsFactors = TRUE)
summary(loans)
str(loans)

# Convert "n/a" to NA and impute NA in emplength to "Unemployed"
loans[loans == "n/a"] <- NA
loans$emplength <- as.character(loans$emplength)
loans$emplength[is.na(loans$emplength)] <- "Unemployed"
loans$emplength <- as.factor(loans$emplength)

# Remove rows with NA
loans <- loans %>% subset(!is.na(delinq2yrs) )

# Change Data Type
loans$creditpolicy  <- factor(loans$creditpolicy, levels = c(0,1), labels = c('Fail', 'Pass'))
loans$targetloanstatus <- factor(loans$targetloanstatus, levels = c(0,1), labels = c('Good', 'Defaulted'))

# Impute NA to Median
revolutil.median1 <- loans %>%
  filter(targetloanstatus == "defaulted") %>%
  summarise(median = median(revolutil, na.rm = TRUE))
loans$revolutil[is.na(loans$revolutil) & loans$targetloanstatus == "Defaulted"] <- revolutil.median1$median
revolutil.median0 <- loans %>%
  filter(targetloanstatus == "Good") %>%
  summarise(median = median(revolutil, na.rm = TRUE))
loans$revolutil[is.na(loans$revolutil) & loans$targetloanstatus == "Good"] <- revolutil.median0$median

# Remove the outliers from revolbal based on lower and upper limits
loans$revolbal.log <- log(loans$revolbal)
loans.revolba.quantile <- quantile(loans$revolbal.log, c(0.25, 0.5, 0.75))
loans.revolba.iqr <- loans.revolba.quantile[3] - loans.revolba.quantile[1]
loans <- loans[-which(loans$revolbal.log <= (loans.revolba.quantile[1] - 1.5 * loans.revolba.iqr) | loans$revolbal.log >= (loans.revolba.quantile[3] + 1.5 * loans.revolba.iqr)),]

# Remove the outliers from annualinc (6000000, 3900000) 10K to 500K
loans$annualinc.log <- log(loans$annualinc)
loans.annualinc.quantile <- quantile(loans$annualinc.log, c(0.25, 0.5, 0.75))
loans.annualinc.iqr <- loans.annualinc.quantile[3] - loans.annualinc.quantile[1]
loans <- loans[-which(loans$annualinc.log <= (loans.annualinc.quantile[1] - 1.5 * loans.annualinc.iqr) | loans$annualinc.log >= (loans.annualinc.quantile[3] + 1.5 * loans.annualinc.iqr)),]

# Check Cleaning Process
summary(loans)
str(loans)

# Resample data to resolve data balancing issues
data.fail <- loans %>% filter(loans$targetloanstatus == "Defaulted")
data.pass <- loans %>% filter(loans$targetloanstatus == "Good")

# 15% of the data.pass size
smp_size <- floor(0.15 * nrow(data.pass))

# set the seed to make partitioning reproducible
set.seed(123)
data.pass_ind <- sample(seq_len(nrow(data.pass)), size = smp_size)
data.pass.mod <- loans[data.pass_ind, ]

# Combine rebalanced dataset together
data.combined <- rbind(data.fail, data.pass.mod)

summary(data.fail)
summary(data.pass.mod)
summary(data.combined)

# Export cleaned and resampled data as CSV
write.csv(data.combined, "loansResampled.csv")

# Create and run models
rattle()


