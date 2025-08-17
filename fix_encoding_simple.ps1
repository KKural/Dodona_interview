# PowerShell script to fix encoding issues in all exercise files
Write-Host "Starting encoding fix process..." -ForegroundColor Green

# Define the search path
$searchPath = "."

# Define encoding replacements as individual operations
$encodingFixes = @(
    @{ from = 'â€œ'; to = '"' },      # Opening smart quote
    @{ from = 'â€'; to = '"' },       # Closing smart quote  
    @{ from = 'â€™'; to = "'" },      # Smart apostrophe
    @{ from = 'Ã«'; to = 'ë' },       # e with diaeresis
    @{ from = 'Ã¯'; to = 'ï' },       # i with diaeresis
    @{ from = 'Ã¡'; to = 'á' },       # a with acute
    @{ from = 'Ã©'; to = 'é' },       # e with acute
    @{ from = 'Ã­'; to = 'í' },       # i with acute
    @{ from = 'Ã³'; to = 'ó' },       # o with acute
    @{ from = 'Ãº'; to = 'ú' },       # u with acute
    @{ from = 'Ã¢'; to = 'â' },       # a with circumflex
    @{ from = 'Ãª'; to = 'ê' },       # e with circumflex
    @{ from = 'Ã®'; to = 'î' },       # i with circumflex
    @{ from = 'Ã´'; to = 'ô' },       # o with circumflex
    @{ from = 'Ã»'; to = 'û' },       # u with circumflex
    @{ from = 'Ã '; to = 'à' },       # a with grave
    @{ from = 'Ã¨'; to = 'è' },       # e with grave
    @{ from = 'Ã¬'; to = 'ì' },       # i with grave
    @{ from = 'Ã²'; to = 'ò' },       # o with grave
    @{ from = 'Ã¹'; to = 'ù' },       # u with grave
    @{ from = 'Ã§'; to = 'ç' },       # c with cedilla
    @{ from = 'Ã±'; to = 'ñ' },       # n with tilde
    @{ from = 'Ã¤'; to = 'ä' },       # a with diaeresis
    @{ from = 'Ã¶'; to = 'ö' },       # o with diaeresis
    @{ from = 'Ã¼'; to = 'ü' },       # u with diaeresis
    @{ from = 'Ãÿ'; to = 'ÿ' },       # y with diaeresis
    @{ from = 'Ã…'; to = 'Å' },       # A with ring above
    @{ from = 'Ã¥'; to = 'å' },       # a with ring above
    @{ from = 'Ã†'; to = 'Æ' },       # AE ligature
    @{ from = 'Ã¦'; to = 'æ' },       # ae ligature
    @{ from = 'Ã˜'; to = 'Ø' },       # O with stroke
    @{ from = 'Ã¸'; to = 'ø' },       # o with stroke
    @{ from = 'âŒ'; to = '❌' },      # Cross mark
    @{ from = 'â†µ'; to = '↵' },      # Down and right arrow
    @{ from = 'âœ…'; to = '✅' }     # Check mark
)

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
    Write-Host "Processing: $($file.Name)" -ForegroundColor Cyan
    
    try {
        # Read file content with UTF-8 encoding
        $content = Get-Content -Path $file.FullName -Encoding UTF8 -Raw -ErrorAction Stop
        $originalContent = $content
        $fileReplacements = 0
        
        # Apply all replacements
        foreach ($fix in $encodingFixes) {
            $fromPattern = $fix.from
            $toPattern = $fix.to
            
            if ($content -match [regex]::Escape($fromPattern)) {
                $beforeCount = ([regex]::Matches($content, [regex]::Escape($fromPattern))).Count
                $content = $content -replace [regex]::Escape($fromPattern), $toPattern
                $afterCount = ([regex]::Matches($content, [regex]::Escape($fromPattern))).Count
                $replacementsMade = $beforeCount - $afterCount
                
                if ($replacementsMade -gt 0) {
                    Write-Host "  Replaced '$fromPattern' with '$toPattern' ($replacementsMade times)" -ForegroundColor Green
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
    Write-Host "You can remove them later with: Get-ChildItem -Recurse -Filter '*.backup' | Remove-Item" -ForegroundColor Yellow
}
