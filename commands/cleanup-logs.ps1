# Log Cleanup Utility
$Logs = @(
    "X-RESEARCH-LAB/brain/WATCHDOG_LOG.txt",
    "X-RESEARCH-LAB/brain/HEALTH_LOG.json",
    "X-RESEARCH-LAB/ERROR_JOURNAL.md"
)

foreach ($Log in $Logs) {
    if (Test-Path $Log) {
        $Size = (Get-Item $Log).Length / 1MB
        if ($Size -gt 50) { # Jei daugiau nei 50MB
            Write-Host "Valomas didelis log failas: $Log ($([Math]::Round($Size, 2)) MB)" -ForegroundColor Yellow
            $Content = Get-Content $Log -Tail 1000 # Paliekame tik paskutines 1000 eilučių
            $Content | Out-File $Log
        }
    }
}
