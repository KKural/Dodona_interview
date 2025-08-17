# PowerShell script to fix encoding issues in all exercise files
# This script will recursively find and fix common encoding problems

Write-Host "Starting encoding fix process..." -ForegroundColor Green

# Define the search path
$searchPath = "c:\Users\kukumar\OneDrive - UGent\Job\stats-course-dodona\20250817_exercise\Dodona_interview\Dodona_interview"

# Define encoding replacements
$replacements = @{
    'â€œ' = '"'      # Opening smart quote
    'â€' = '"'       # Closing smart quote  
    'â€™' = "'"      # Smart apostrophe
    'Ã«' = 'ë'       # e with diaeresis
    'Ã¯' = 'ï'       # i with diaeresis
    'Ã¡' = 'á'       # a with acute
    'Ã©' = 'é'       # e with acute
    'Ã­' = 'í'       # i with acute
    'Ã³' = 'ó'       # o with acute
    'Ãº' = 'ú'       # u with acute
    'Ã¢' = 'â'       # a with circumflex
    'Ãª' = 'ê'       # e with circumflex
    'Ã®' = 'î'       # i with circumflex
    'Ã´' = 'ô'       # o with circumflex
    'Ã»' = 'û'       # u with circumflex
    'Ã ' = 'à'       # a with grave
    'Ã¨' = 'è'       # e with grave
    'Ã¬' = 'ì'       # i with grave
    'Ã²' = 'ò'       # o with grave
    'Ã¹' = 'ù'       # u with grave
    'Ã§' = 'ç'       # c with cedilla
    'Ã±' = 'ñ'       # n with tilde
    'Ã¤' = 'ä'       # a with diaeresis
    'Ã¶' = 'ö'       # o with diaeresis
    'Ã¼' = 'ü'       # u with diaeresis
    'Ãÿ' = 'ÿ'       # y with diaeresis
    'Ã…' = 'Å'       # A with ring above
    'Ã¥' = 'å'       # a with ring above
    'Ã†' = 'Æ'       # AE ligature
    'Ã¦' = 'æ'       # ae ligature
    'Ã˜' = 'Ø'       # O with stroke
    'Ã¸' = 'ø'       # o with stroke
    'âŒ' = '❌'      # Cross mark
    'â†µ' = '↵'      # Down and right arrow
    'âœ…' = '✅'     # Check mark
}

# Get all text files that might contain the encoding issues
$fileExtensions = @('*.R', '*.md', '*.txt', '*.json', '*.Rmd', '*.html', '*.js', '*.css')
$filesToProcess = @()

foreach ($ext in $fileExtensions) {
    $files = Get-ChildItem -Path $searchPath -Filter $ext -Recurse -File
    $filesToProcess += $files
}

Write-Host "Found $($filesToProcess.Count) files to process" -ForegroundColor Yellow

$fixedFiles = 0
$totalReplacements = 0

foreach ($file in $filesToProcess) {
    Write-Host "Processing: $($file.FullName)" -ForegroundColor Cyan
    
    try {
        # Read file content with UTF-8 encoding
        $content = Get-Content -Path $file.FullName -Encoding UTF8 -Raw
        $originalContent = $content
        $fileReplacements = 0
        
        # Apply all replacements
        foreach ($pair in $replacements.GetEnumerator()) {
            if ($content -match [regex]::Escape($pair.Key)) {
                $beforeCount = ($content | Select-String -Pattern ([regex]::Escape($pair.Key)) -AllMatches).Matches.Count
                $content = $content -replace [regex]::Escape($pair.Key), $pair.Value
                $afterCount = ($content | Select-String -Pattern ([regex]::Escape($pair.Key)) -AllMatches).Matches.Count
                $replacementsMade = $beforeCount - $afterCount
                if ($replacementsMade -gt 0) {
                    Write-Host "  Replaced '$($pair.Key)' with '$($pair.Value)' ($replacementsMade times)" -ForegroundColor Green
                    $fileReplacements += $replacementsMade
                }
            }
        }
        
        # Write back if changes were made
        if ($content -ne $originalContent) {
            # Create backup
            $backupPath = $file.FullName + ".backup"
            Copy-Item -Path $file.FullName -Destination $backupPath -Force
            
            # Write fixed content with UTF-8 encoding (no BOM)
            $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
            [System.IO.File]::WriteAllText($file.FullName, $content, $utf8NoBom)
            
            Write-Host "  ✅ Fixed $fileReplacements encoding issues in $($file.Name)" -ForegroundColor Green
            $fixedFiles++
            $totalReplacements += $fileReplacements
        } else {
            Write-Host "  No encoding issues found in $($file.Name)" -ForegroundColor Gray
        }
        
    } catch {
        Write-Host "  ❌ Error processing $($file.FullName): $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "===========================================" -ForegroundColor Magenta
Write-Host "Encoding fix process completed!" -ForegroundColor Green
Write-Host "Files processed: $($filesToProcess.Count)" -ForegroundColor Yellow
Write-Host "Files fixed: $fixedFiles" -ForegroundColor Green
Write-Host "Total replacements made: $totalReplacements" -ForegroundColor Green
Write-Host "===========================================" -ForegroundColor Magenta

if ($fixedFiles -gt 0) {
    Write-Host ""
    Write-Host "Note: Backup files (.backup) have been created for all modified files." -ForegroundColor Yellow
    Write-Host "You can remove them with: Get-ChildItem -Recurse -Filter '*.backup' | Remove-Item" -ForegroundColor Yellow
}
