@echo off
echo Updating config.json files with new exercise numbers and Bloom's taxonomy levels...
echo.

REM Update Exercise 05 - Crime Rate Calculation
powershell -Command "(Get-Content '05. Crime Rate Calculation [Apply]\config.json' -Raw | ConvertFrom-Json | %% { $_.description.names.en = '05. Crime Rate Calculation [Apply]'; $_ } | ConvertTo-Json -Depth 10) | Set-Content '05. Crime Rate Calculation [Apply]\config.json'"
echo Updated: 05. Crime Rate Calculation [Apply]

REM Update Exercise 06 - Crime Rates vs National Average  
powershell -Command "(Get-Content '06. Crime Rates vs National Average [Apply]\config.json' -Raw | ConvertFrom-Json | %% { $_.description.names.en = '06. Crime Rates vs National Average [Apply]'; $_ } | ConvertTo-Json -Depth 10) | Set-Content '06. Crime Rates vs National Average [Apply]\config.json'"
echo Updated: 06. Crime Rates vs National Average [Apply]

REM Update Exercise 07 - Sampling Distribution Concepts
powershell -Command "(Get-Content '07. Sampling Distribution Concepts [Apply]\config.json' -Raw | ConvertFrom-Json | %% { $_.description.names.en = '07. Sampling Distribution Concepts [Apply]'; $_ } | ConvertTo-Json -Depth 10) | Set-Content '07. Sampling Distribution Concepts [Apply]\config.json'"
echo Updated: 07. Sampling Distribution Concepts [Apply]

REM Update Exercise 08 - Standard Deviation Calculation
powershell -Command "(Get-Content '08. Standard Deviation Calculation [Apply]\config.json' -Raw | ConvertFrom-Json | %% { $_.description.names.en = '08. Standard Deviation Calculation [Apply]'; $_ } | ConvertTo-Json -Depth 10) | Set-Content '08. Standard Deviation Calculation [Apply]\config.json'"
echo Updated: 08. Standard Deviation Calculation [Apply]

REM Update Exercise 09 - Correlation Coefficient Calculation
powershell -Command "(Get-Content '09. Correlation Coefficient Calculation [Apply]\config.json' -Raw | ConvertFrom-Json | %% { $_.description.names.en = '09. Correlation Coefficient Calculation [Apply]'; $_ } | ConvertTo-Json -Depth 10) | Set-Content '09. Correlation Coefficient Calculation [Apply]\config.json'"
echo Updated: 09. Correlation Coefficient Calculation [Apply]

REM Update Exercise 10 - Chi-Square Test Analysis
powershell -Command "(Get-Content '10. Chi-Square Test Analysis [Analyse]\config.json' -Raw | ConvertFrom-Json | %% { $_.description.names.en = '10. Chi-Square Test Analysis [Analyse]'; $_ } | ConvertTo-Json -Depth 10) | Set-Content '10. Chi-Square Test Analysis [Analyse]\config.json'"
echo Updated: 10. Chi-Square Test Analysis [Analyse]

echo.
echo Config file updates completed!
echo All exercises now have proper numbering (01-20) with Bloom's taxonomy levels.
pause
