# Update all config.json files with proper Dutch names and numbers
$exercises = @{
    "01. Level of Measurement [Remember]" = "01. Meetniveau van variabelen"
    "02. Descriptive vs Inferential Statistics [Remember]" = "02. Beschrijvende vs. inferentiële statistiek"
    "03. Null Hypothesis Formation [Understand]" = "03. Nulhypothese formulering"
    "04. Central Tendency and Outliers [Understand]" = "04. Centrummaten: gemiddelde, mediaan of modus"
    "05. Crime Rate Calculation [Apply]" = "05. Misdaadcijfer berekening"
    "06. Crime Rates vs National Average [Apply]" = "06. Misdaadcijfers en nationaal gemiddelde"
    "07. Sampling Distribution Concepts [Apply]" = "07. Steekproefverdeling concepten"
    "08. Standard Deviation Calculation [Apply]" = "08. Standaarddeviatie berekening"
    "09. Correlation Coefficient Calculation [Apply]" = "09. Correlatiecoëfficiënt berekening"
    "10. Chi-Square Test Analysis [Analyse]" = "10. Chi-kwadraat toets analyse"
    "11. Histogram Interpretation [Analyse]" = "11. Histogram interpretatie"
    "12. Boxplot Interpretation [Analyse]" = "12. Boxplot interpretatie"
    "13. t-Test Calculation [Analyse]" = "13. t-Toets berekening"
    "14. Confidence Interval Construction [Analyse]" = "14. Betrouwbaarheidsinterval constructie"
    "15. Effect Size Calculation [Analyse]" = "15. Effectgrootte berekening"
    "16. Scatterplot and Correlation Evaluation [Evaluate]" = "16. Spreidingsdiagram en correlatie evaluatie"
    "17. Partial Correlation Analysis [Evaluate]" = "17. Partiële correlatie analyse"
    "18. Statistical Significance Interpretation [Evaluate]" = "18. Statistische significantie interpretatie"
    "19. Spurious Correlation Detection [Evaluate]" = "19. Schijncorrelatie detectie"
    "20. Research Design Creation [Create]" = "20. Onderzoeksontwerp creatie"
}

foreach ($folder in $exercises.Keys) {
    $configPath = "./$folder/config.json"
    if (Test-Path $configPath) {
        $content = Get-Content $configPath -Raw | ConvertFrom-Json
        $content.description.names.en = $exercises[$folder]
        $content | ConvertTo-Json -Depth 10 | Set-Content $configPath
        Write-Host "Updated: $folder -> $($exercises[$folder])"
    } else {
        Write-Warning "Config file not found: $configPath"
    }
}

Write-Host "All config files updated with full Dutch names!"
