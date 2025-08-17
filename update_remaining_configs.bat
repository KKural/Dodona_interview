cd "c:\Users\kukumar\OneDrive - UGent\Job\stats-course-dodona\20250817_exercise\Dodona_interview\Dodona_interview"

# Update config files with full Dutch names
echo Updating config files with full Dutch names...

# Exercise 06
if exist "06. Crime Rates vs National Average [Apply]\config.json" (
    powershell -Command "$config = Get-Content '06. Crime Rates vs National Average [Apply]\config.json' | ConvertFrom-Json; $config.description.names.en = '06. Misdaadcijfers en nationaal gemiddelde'; $config | ConvertTo-Json -Depth 10 | Set-Content '06. Crime Rates vs National Average [Apply]\config.json'"
    echo Updated exercise 06
)

# Exercise 07
if exist "07. Sampling Distribution Concepts [Apply]\config.json" (
    powershell -Command "$config = Get-Content '07. Sampling Distribution Concepts [Apply]\config.json' | ConvertFrom-Json; $config.description.names.en = '07. Steekproefverdeling concepten'; $config | ConvertTo-Json -Depth 10 | Set-Content '07. Sampling Distribution Concepts [Apply]\config.json'"
    echo Updated exercise 07
)

# Exercise 08
if exist "08. Standard Deviation Calculation [Apply]\config.json" (
    powershell -Command "$config = Get-Content '08. Standard Deviation Calculation [Apply]\config.json' | ConvertFrom-Json; $config.description.names.en = '08. Standaarddeviatie berekening'; $config | ConvertTo-Json -Depth 10 | Set-Content '08. Standard Deviation Calculation [Apply]\config.json'"
    echo Updated exercise 08
)

# Exercise 09
if exist "09. Correlation Coefficient Calculation [Apply]\config.json" (
    powershell -Command "$config = Get-Content '09. Correlation Coefficient Calculation [Apply]\config.json' | ConvertFrom-Json; $config.description.names.en = '09. Correlatiecoëfficiënt berekening'; $config | ConvertTo-Json -Depth 10 | Set-Content '09. Correlation Coefficient Calculation [Apply]\config.json'"
    echo Updated exercise 09
)

# Exercise 10
if exist "10. Chi-Square Test Analysis [Analyse]\config.json" (
    powershell -Command "$config = Get-Content '10. Chi-Square Test Analysis [Analyse]\config.json' | ConvertFrom-Json; $config.description.names.en = '10. Chi-kwadraat toets analyse'; $config | ConvertTo-Json -Depth 10 | Set-Content '10. Chi-Square Test Analysis [Analyse]\config.json'"
    echo Updated exercise 10
)

echo All config files updated with full Dutch names!
