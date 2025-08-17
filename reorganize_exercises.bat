@echo off
echo Starting Exercise Reorganization Based on Bloom's Taxonomy
echo ========================================================

cd /d "c:\Users\kukumar\OneDrive - UGent\Job\stats-course-dodona\20250817_exercise\Dodona_interview\Dodona_interview"

echo.
echo Creating temporary renamed folders to avoid conflicts...
echo.

REM Step 1: Rename to temporary names to avoid conflicts
ren "01. Level of Measurement" "TEMP_01_Level_of_Measurement"
ren "1. Level of measurement" "TEMP_01_Level_of_Measurement_duplicate"
ren "2. Descriptive vs. Inferential" "TEMP_02_Descriptive_vs_Inferential"
ren "3.Null hypothesis" "TEMP_03_Null_Hypothesis"
ren "4. Centeral tendency" "TEMP_04_Central_Tendency"
ren "5. Crime rate calculation" "TEMP_05_Crime_Rate_Calculation"
ren "6. Crime rates and national average" "TEMP_06_Crime_Rates_vs_National"
ren "7. Sampling Distribution" "TEMP_07_Sampling_Distribution"
ren "16. Standard Deviation Calculation" "TEMP_08_Standard_Deviation"
ren "17. Correlation Coefficient Calculation" "TEMP_09_Correlation_Coefficient"
ren "8. Chi-square" "TEMP_10_Chi_Square"
ren "9. Histogram Interpretation" "TEMP_11_Histogram_Interpretation"
ren "10. Boxplot Interpretation" "TEMP_12_Boxplot_Interpretation"
ren "18. t-Test Calculation" "TEMP_13_t_Test"
ren "19. Confidence Interval Calculation" "TEMP_14_Confidence_Interval"
ren "20. Effect Size Calculation" "TEMP_15_Effect_Size"
ren "11. Scatterplot of unemployment" "TEMP_16_Scatterplot_Evaluation"
ren "12. Partial Correlation" "TEMP_17_Partial_Correlation"
ren "13. Interpretation of a significance test" "TEMP_18_Significance_Interpretation"
ren "14. Spurious correlation" "TEMP_19_Spurious_Correlation"
ren "15. Research Design Creation" "TEMP_20_Research_Design"

echo.
echo Step 1 Complete: Temporary renaming done
echo.
echo Now renaming to final pedagogical order...
echo.

REM Step 2: Rename to final order based on Bloom's Taxonomy
ren "TEMP_01_Level_of_Measurement" "01. Level of Measurement [Remember]"
ren "TEMP_02_Descriptive_vs_Inferential" "02. Descriptive vs Inferential Statistics [Remember]"
ren "TEMP_03_Null_Hypothesis" "03. Null Hypothesis Formation [Understand]"
ren "TEMP_04_Central_Tendency" "04. Central Tendency and Outliers [Understand]"
ren "TEMP_05_Crime_Rate_Calculation" "05. Crime Rate Calculation [Apply]"
ren "TEMP_06_Crime_Rates_vs_National" "06. Crime Rates vs National Average [Apply]"
ren "TEMP_07_Sampling_Distribution" "07. Sampling Distribution Concepts [Apply]"
ren "TEMP_08_Standard_Deviation" "08. Standard Deviation Calculation [Apply]"
ren "TEMP_09_Correlation_Coefficient" "09. Correlation Coefficient Calculation [Apply]"
ren "TEMP_10_Chi_Square" "10. Chi-Square Test Analysis [Analyse]"
ren "TEMP_11_Histogram_Interpretation" "11. Histogram Interpretation [Analyse]"
ren "TEMP_12_Boxplot_Interpretation" "12. Boxplot Interpretation [Analyse]"
ren "TEMP_13_t_Test" "13. t-Test Calculation [Analyse]"
ren "TEMP_14_Confidence_Interval" "14. Confidence Interval Construction [Analyse]"
ren "TEMP_15_Effect_Size" "15. Effect Size Calculation [Analyse]"
ren "TEMP_16_Scatterplot_Evaluation" "16. Scatterplot and Correlation Evaluation [Evaluate]"
ren "TEMP_17_Partial_Correlation" "17. Partial Correlation Analysis [Evaluate]"
ren "TEMP_18_Significance_Interpretation" "18. Statistical Significance Interpretation [Evaluate]"
ren "TEMP_19_Spurious_Correlation" "19. Spurious Correlation Detection [Evaluate]"
ren "TEMP_20_Research_Design" "20. Research Design Creation [Create]"

REM Handle the duplicate Level of Measurement folder
if exist "TEMP_01_Level_of_Measurement_duplicate" (
    echo.
    echo WARNING: Duplicate Level of Measurement folder found.
    echo Please manually review and merge content if needed.
    ren "TEMP_01_Level_of_Measurement_duplicate" "DUPLICATE_Level_of_Measurement_REVIEW"
)

echo.
echo ========================================================
echo REORGANIZATION COMPLETE!
echo ========================================================
echo.
echo Your exercises are now ordered according to:
echo 1. Bloom's Taxonomy progression (Remember → Create)
echo 2. Scaffolding reduction (Maximum → Minimal support)
echo 3. Pedagogical best practices for criminology students
echo.
echo Exercise distribution:
echo - Remember: 01-02 (10%% - Maximum Scaffolding)
echo - Understand: 03-04 (10%% - Heavy Scaffolding) 
echo - Apply: 05-09 (25%% - Moderate Scaffolding)
echo - Analyse: 10-15 (30%% - Light-Moderate Scaffolding)
echo - Evaluate: 16-19 (20%% - Light Scaffolding)
echo - Create: 20 (5%% - Minimal Scaffolding)
echo.
echo Higher-order thinking skills: 55%% (Analyse + Evaluate + Create)
echo.

pause
