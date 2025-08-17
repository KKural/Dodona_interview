# Verify Exercise 8: Standard Deviation
cat("=== Exercise 8: Standard Deviation ===\n")
data8 <- c(12, 15, 18, 22, 25, 28, 32, 35)
mean8 <- mean(data8)
cat("Data:", paste(data8, collapse=", "), "\n")
cat("Mean:", mean8, "\n")

# Population standard deviation (divide by n)
pop_sd8 <- sqrt(sum((data8 - mean8)^2) / length(data8))
cat("Population SD:", pop_sd8, "\n")
cat("Rounded to 2 decimal places:", round(pop_sd8, 2), "\n\n")

# Verify Exercise 9: Correlation Coefficient
cat("=== Exercise 9: Correlation Coefficient ===\n")
x9 <- c(2, 4, 6, 8, 10, 12)
y9 <- c(8, 6, 4, 2, 1, 0)
cat("X (Police patrols):", paste(x9, collapse=", "), "\n")
cat("Y (Thefts):", paste(y9, collapse=", "), "\n")

corr9 <- cor(x9, y9)
cat("Correlation coefficient:", corr9, "\n")
cat("Rounded to 3 decimal places:", round(corr9, 3), "\n\n")

# Verify Exercise 10: Chi-Square Test
cat("=== Exercise 10: Chi-Square Test ===\n")
observed <- matrix(c(25, 30, 15, 20), nrow=2, byrow=TRUE)
cat("Observed frequencies:\n")
print(observed)

# Expected frequencies
row_totals <- rowSums(observed)
col_totals <- colSums(observed)
total <- sum(observed)
expected <- outer(row_totals, col_totals) / total
cat("\nExpected frequencies:\n")
print(expected)

chi_sq <- sum((observed - expected)^2 / expected)
cat("Chi-square statistic:", chi_sq, "\n")
cat("Rounded to 2 decimal places:", round(chi_sq, 2), "\n\n")

# Verify Exercise 13: t-Test Calculation
cat("=== Exercise 13: t-Test Calculation ===\n")
group1 <- c(15, 18, 22, 19, 21, 17)  # Before
group2 <- c(12, 10, 14, 11, 9, 13)   # After

cat("Group 1 (Before):", paste(group1, collapse=", "), "\n")
cat("Group 2 (After):", paste(group2, collapse=", "), "\n")

mean1 <- mean(group1)
mean2 <- mean(group2)
sd1 <- sd(group1)
sd2 <- sd(group2)
n1 <- length(group1)
n2 <- length(group2)

cat("Mean 1:", mean1, "\n")
cat("Mean 2:", mean2, "\n")
cat("SD 1:", sd1, "\n")
cat("SD 2:", sd2, "\n")

# Pooled variance
pooled_var <- ((n1-1)*sd1^2 + (n2-1)*sd2^2) / (n1+n2-2)
pooled_se <- sqrt(pooled_var * (1/n1 + 1/n2))
t_stat <- (mean1 - mean2) / pooled_se

cat("Pooled variance:", pooled_var, "\n")
cat("Pooled SE:", pooled_se, "\n")
cat("t-statistic:", t_stat, "\n")
cat("Rounded to 2 decimal places:", round(t_stat, 2), "\n\n")

# Verify Exercise 14: Confidence Interval
cat("=== Exercise 14: Confidence Interval ===\n")
data14 <- c(24, 28, 32, 26, 30, 22, 35, 29, 27)
cat("Data:", paste(data14, collapse=", "), "\n")

mean14 <- mean(data14)
sd14 <- sd(data14)
n14 <- length(data14)
se14 <- sd14 / sqrt(n14)

cat("Mean:", mean14, "\n")
cat("SD:", sd14, "\n")
cat("SE:", se14, "\n")

# t-value for 95% CI with df=8
t_val <- 2.306
me14 <- t_val * se14
lower14 <- mean14 - me14
upper14 <- mean14 + me14

cat("t-value (df=8):", t_val, "\n")
cat("Margin of error:", me14, "\n")
cat("Lower bound:", lower14, "\n")
cat("Upper bound:", upper14, "\n")
cat("Confidence interval: [", round(lower14, 2), ",", round(upper14, 2), "]\n\n")

# Verify Exercise 15: Effect Size (Cohen's d)
cat("=== Exercise 15: Effect Size (Cohen's d) ===\n")
# Using same data as Exercise 13
cat("Using same groups as Exercise 13\n")
pooled_sd <- sqrt(pooled_var)
cohens_d <- (mean1 - mean2) / pooled_sd

cat("Pooled SD:", pooled_sd, "\n")
cat("Cohen's d:", cohens_d, "\n")
cat("Rounded to 2 decimal places:", round(cohens_d, 2), "\n")
