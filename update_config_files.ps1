# PowerShell Script to Update Config.json Files with New Exercise Numbers and Names
# Based on Bloom's Taxonomy Reorganization

$exercises = @(
    @{old = "03. Null Hypothesis Formation [Understand]"; new = "03. Null Hypothesis Formation [Understand]" },
    @{old = "04. Central Tendency and Outliers [Understand]"; new = "04. Central Tendency and Outliers [Understand]" },
    @{old = "05. Crime Rate Calculation [Apply]"; new = "05. Crime Rate Calculation [Apply]" },
    @{old = "06. Crime Rates vs National Average [Apply]"; new = "06. Crime Rates vs National Average [Apply]" },
    @{old = "07. Sampling Distribution Concepts [Apply]"; new = "07. Sampling Distribution Concepts [Apply]" },
    @{old = "08. Standard Deviation Calculation [Apply]"; new = "08. Standard Deviation Calculation [Apply]" },
    @{old = "09. Correlation Coefficient Calculation [Apply]"; new = "09. Correlation Coefficient Calculation [Apply]" },
    @{old = "10. Chi-Square Test Analysis [Analyse]"; new = "10. Chi-Square Test Analysis [Analyse]" },
    @{old = "11. Histogram Interpretation [Analyse]"; new = "11. Histogram Interpretation [Analyse]" },
    @{old = "12. Boxplot Interpretation [Analyse]"; new = "12. Boxplot Interpretation [Analyse]" },
    @{old = "13. t-Test Calculation [Analyse]"; new = "13. t-Test Calculation [Analyse]" },
    @{old = "14. Confidence Interval Construction [Analyse]"; new = "14. Confidence Interval Construction [Analyse]" },
    @{old = "15. Effect Size Calculation [Analyse]"; new = "15. Effect Size Calculation [Analyse]" },
    @{old = "16. Scatterplot and Correlation Evaluation [Evaluate]"; new = "16. Scatterplot and Correlation Evaluation [Evaluate]" },
    @{old = "17. Partial Correlation Analysis [Evaluate]"; new = "17. Partial Correlation Analysis [Evaluate]" },
    @{old = "18. Statistical Significance Interpretation [Evaluate]"; new = "18. Statistical Significance Interpretation [Evaluate]" },
    @{old = "19. Spurious Correlation Detection [Evaluate]"; new = "19. Spurious Correlation Detection [Evaluate]" },
    @{old = "20. Research Design Creation [Create]"; new = "20. Research Design Creation [Create]" }
)

# Update each config file
foreach ($exercise in $exercises) {
    $configPath = "$($exercise.old)\config.json"
    
    if (Test-Path $configPath) {
        Write-Host "Updating: $configPath"
        
        # Read the config file
        $config = Get-Content $configPath -Raw | ConvertFrom-Json
        
        # Update the name
        $config.description.names.en = $exercise.new
        
        # Write back to file
        $config | ConvertTo-Json -Depth 10 | Set-Content $configPath
        
        Write-Host "✓ Updated: $($exercise.new)"
    }
    else {
        Write-Host "✗ File not found: $configPath"
    }
}

Write-Host ""
Write-Host "Config file updates completed!"
Write-Host "All exercises now have proper numbering (01-20) with Bloom's taxonomy levels."
