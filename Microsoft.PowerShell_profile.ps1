# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# set alias

Set-Alias -name 'npp' -value 'C:\Program Files\Notepad++\notepad++.exe'
Set-Alias -name 'venv' -value '.venv\Scripts\activate'

# set alias with parameters (has to be a function)

function poweroff {
    shutdown /p
}

# sane tab completion

Set-PSReadlineKeyHandler -Key Tab -Function Complete

# nvim sync

function Sync-NvimConfig {
    param(
        [switch]$Reverse
    )

    $src = "C:\Users\diego\dotfiles\dot_config\nvim"
    $dst = "C:\Users\diego\AppData\Local\nvim"

    if ($Reverse) {
        Write-Host "↩ Syncing FROM $dst TO $src..." -ForegroundColor Cyan

        if (Test-Path $src) {
            Remove-Item -Recurse -Force $src
        }

        Get-ChildItem -Path $dst -Recurse | ForEach-Object {
            $relativePath = $_.FullName.Substring($dst.Length)
            $translatedPath = $relativePath -replace '\\\.', '\\dot_' -replace '^\.','dot_'
            $translatedPath = ($translatedPath -replace '^\\', '') -replace '^\.','dot_'

            $targetPath = Join-Path $src $translatedPath

            if ($_.PSIsContainer) {
                New-Item -ItemType Directory -Path $targetPath -Force | Out-Null
            } else {
                $parent = Split-Path $targetPath
                if (-not (Test-Path $parent)) {
                    New-Item -ItemType Directory -Path $parent -Force | Out-Null
                }
                Copy-Item -Path $_.FullName -Destination $targetPath -Force
            }
        }

        Write-Host "✅ Reverse sync complete." -ForegroundColor Green
    } else {
        Write-Host "➡ Syncing FROM $src TO $dst..." -ForegroundColor Yellow

        if (Test-Path $dst) {
            Remove-Item -Recurse -Force $dst
        }

        Get-ChildItem -Path $src -Recurse | ForEach-Object {
            $relativePath = $_.FullName.Substring($src.Length)
            $translatedPath = $relativePath -replace '\\dot_', '\\.' -replace '^dot_','.'
            $translatedPath = ($translatedPath -replace '^\\', '')

            $targetPath = Join-Path $dst $translatedPath

            if ($_.PSIsContainer) {
                New-Item -ItemType Directory -Path $targetPath -Force | Out-Null
            } else {
                $parent = Split-Path $targetPath
                if (-not (Test-Path $parent)) {
                    New-Item -ItemType Directory -Path $parent -Force | Out-Null
                }
                Copy-Item -Path $_.FullName -Destination $targetPath -Force
            }
        }

        Write-Host "✅ Normal sync complete." -ForegroundColor Green
    }
}

Set-Alias nvim-sync Sync-NvimConfig

# cli software
Invoke-Expression (& { (zoxide init powershell | Out-String) })
Invoke-Expression (&starship init powershell)
