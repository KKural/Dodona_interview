# PowerShell script to update all config.json files with Dutch names
$exerciseMapping = @{
    "05. Crime Rate Calculation [Apply]" = "05. Misdaadcijfer berekening"
    "06. Crime Rates vs National Average [Apply]" = "06. Misdaadcijfers en nationaal gemiddelde"
    "07. Sampling Distribution Concepts [Apply]" = "07. Steekproefverdeling"
    "08. Standard Deviation Calculation [Apply]" = "08. Standaarddeviatie berekening"
    "09. Correlation Coefficient Calculation [Apply]" = "09. Correlatiecoëfficiënt berekening"
    "10. Chi-Square Test Analysis [Analyse]" = "10. Chi-kwadraat"
    "11. Histogram Interpretation [Analyse]" = "11. Histogram interpretatie"
    "12. Boxplot Interpretation [Analyse]" = "12. Boxplot interpretatie"
    "13. t-Test Calculation [Analyse]" = "13. t-Test berekening"
    "14. Confidence Interval Construction [Analyse]" = "14. Betrouwbaarheidsinterval berekening"
    "15. Effect Size Calculation [Analyse]" = "15. Effectgrootte berekening"
    "16. Scatterplot and Correlation Evaluation [Evaluate]" = "16. Scatterplot van werkloosheid"
    "17. Partial Correlation Analysis [Evaluate]" = "17. Partiële correlatie"
    "18. Statistical Significance Interpretation [Evaluate]" = "18. Interpretatie van een significantietest"
    "19. Spurious Correlation Detection [Evaluate]" = "19. Schijncorrelatie"
    "20. Research Design Creation [Create]" = "20. Onderzoeksontwerp creatie"
}

foreach ($folder in $exerciseMapping.Keys) {
    $folderPath = ".\$folder"
    $configPath = "$folderPath\config.json"
    $newName = $exerciseMapping[$folder]
    
    if (Test-Path $configPath) {
        Write-Host "Updating $folder -> $newName"
        $config = Get-Content $configPath -Raw | ConvertFrom-Json
        $config.description.names.en = $newName
        $config | ConvertTo-Json -Depth 10 | Set-Content $configPath
        Write-Host "Updated: $newName"
    } else {
        Write-Host "Config not found: $configPath"
    }
}

Write-Host "All config files updated with Dutch names!"
