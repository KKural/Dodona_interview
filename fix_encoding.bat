@echo off
echo Starting encoding fix process...

rem Use PowerShell to fix encoding issues
powershell -Command ^
"$files = Get-ChildItem -Recurse -Include *.R,*.md,*.txt,*.json,*.Rmd -File; ^
$fixedCount = 0; ^
foreach ($file in $files) { ^
  $content = Get-Content $file.FullName -Encoding UTF8 -Raw -ErrorAction SilentlyContinue; ^
  if ($content) { ^
    $original = $content; ^
    $content = $content -replace 'â€œ', '\"'; ^
    $content = $content -replace 'â€', '\"'; ^
    $content = $content -replace 'â€™', \"'\"; ^
    $content = $content -replace 'Ã«', 'ë'; ^
    $content = $content -replace 'Ã¯', 'ï'; ^
    $content = $content -replace 'Ã¡', 'á'; ^
    $content = $content -replace 'Ã©', 'é'; ^
    $content = $content -replace 'Ã­', 'í'; ^
    $content = $content -replace 'Ã³', 'ó'; ^
    $content = $content -replace 'Ãº', 'ú'; ^
    $content = $content -replace 'Ã¢', 'â'; ^
    $content = $content -replace 'Ãª', 'ê'; ^
    $content = $content -replace 'Ã®', 'î'; ^
    $content = $content -replace 'Ã´', 'ô'; ^
    $content = $content -replace 'Ã»', 'û'; ^
    $content = $content -replace 'Ã ', 'à'; ^
    $content = $content -replace 'Ã¨', 'è'; ^
    $content = $content -replace 'Ã¬', 'ì'; ^
    $content = $content -replace 'Ã²', 'ò'; ^
    $content = $content -replace 'Ã¹', 'ù'; ^
    $content = $content -replace 'Ã§', 'ç'; ^
    $content = $content -replace 'Ã±', 'ñ'; ^
    $content = $content -replace 'Ã¤', 'ä'; ^
    $content = $content -replace 'Ã¶', 'ö'; ^
    $content = $content -replace 'Ã¼', 'ü'; ^
    $content = $content -replace 'Ãÿ', 'ÿ'; ^
    $content = $content -replace 'âŒ', '❌'; ^
    $content = $content -replace 'âœ…', '✅'; ^
    if ($content -ne $original) { ^
      Copy-Item $file.FullName ($file.FullName + '.backup'); ^
      $utf8 = New-Object System.Text.UTF8Encoding($false); ^
      [System.IO.File]::WriteAllText($file.FullName, $content, $utf8); ^
      Write-Host \"Fixed: $($file.Name)\" -ForegroundColor Green; ^
      $fixedCount++; ^
    } ^
  } ^
}; ^
Write-Host \"Total files fixed: $fixedCount\" -ForegroundColor Yellow"

echo Encoding fix process completed!
pause
