# Chi-square calculation for 3x2 table
cat("=== Exercise 10: Chi-Square Calculation ===\n")

# Observed frequencies
observed <- matrix(c(
  25, 15,  # Laag opgeleid: 25 geweld, 15 diefstal
  18, 22,  # Midden opgeleid: 18 geweld, 22 diefstal  
  12, 28   # Hoog opgeleid: 12 geweld, 28 diefstal
), nrow=3, byrow=TRUE)

rownames(observed) <- c("Laag", "Midden", "Hoog")
colnames(observed) <- c("Geweld", "Diefstal")

cat("Observed frequencies:\n")
print(observed)

# Calculate totals
row_totals <- rowSums(observed)
col_totals <- colSums(observed)
total <- sum(observed)

cat("\nRow totals:", row_totals, "\n")
cat("Column totals:", col_totals, "\n")
cat("Grand total:", total, "\n")

# Calculate expected frequencies
expected <- outer(row_totals, col_totals) / total
cat("\nExpected frequencies:\n")
print(expected)

# Calculate chi-square statistic
chi_square_components <- (observed - expected)^2 / expected
cat("\nChi-square components:\n")
print(chi_square_components)

chi_sq <- sum(chi_square_components)
cat("\nChi-square statistic:", chi_sq, "\n")
cat("Rounded to 2 decimal places:", round(chi_sq, 2), "\n")

# Verify with R's built-in function
chisq_test <- chisq.test(observed)
cat("R's chisq.test result:", chisq_test$statistic, "\n")
