# Cohen's d calculation for Exercise 15
cat("=== Exercise 15: Cohen's d Calculation ===\n")

# Data from description
mean1 <- 45  # Voor interventie
mean2 <- 38  # Na interventie
sd1 <- 12
sd2 <- 10
n1 <- 25
n2 <- 25

cat("Group 1 (Voor): mean =", mean1, ", sd =", sd1, ", n =", n1, "\n")
cat("Group 2 (Na): mean =", mean2, ", sd =", sd2, ", n =", n2, "\n")

# Calculate pooled standard deviation
pooled_var <- ((n1-1)*sd1^2 + (n2-1)*sd2^2) / (n1 + n2 - 2)
pooled_sd <- sqrt(pooled_var)

cat("Pooled variance:", pooled_var, "\n")
cat("Pooled SD:", pooled_sd, "\n")

# Calculate Cohen's d
cohens_d <- (mean1 - mean2) / pooled_sd

cat("Cohen's d:", cohens_d, "\n")
cat("Rounded to 2 decimal places:", round(cohens_d, 2), "\n")
