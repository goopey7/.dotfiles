oh-my-posh init pwsh --config "~/.config/themes/powerlevel10k.json" | Invoke-Expression
$env:EDITOR = "nvim"

$script:NS = "~/.config/nvim-sessionizer/target/release/ns"

$script:IsWin = $IsWindows
$script:TmpDir = if ($IsWin) { [System.IO.Path]::GetTempPath().TrimEnd('\') } else { "/tmp" }
$script:NsExeName = if ($IsWin) { "$NS.exe" } else { "$NS" }

Remove-Alias cd -Force -ErrorAction SilentlyContinue
function global:cd {
    try {
        Set-Location @args -ErrorAction Stop
    } catch {
        Write-Host $_.Exception.Message -ForegroundColor Red
        return
    }
    if ($env:NVIM) {
        $pwdFixed = ($PWD.Path -replace '\\', '/')
        Set-Content -Path (Join-Path $script:TmpDir "nvim-pwd-$pid") -Value $PWD.Path -Force
        Get-Job -Name nvim-cd -ErrorAction SilentlyContinue | Remove-Job -Force
        $null = Start-Job -Name nvim-cd -ArgumentList $env:NVIM, $pwdFixed -ScriptBlock {
            param($s, $d)
            nvim --server $s --remote-expr "chdir('$d')" *> $null
        }
    }
}

if (Test-Path $NsExeName) { Set-Alias ns $NsExeName }

function global:vi {
    if ($env:NVIM) {
        foreach ($arg in $args) {
            if ($arg -ne '-n' -and $arg -notmatch '^-') {
                $resolved = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($arg)
                nvim --server $env:NVIM --remote $resolved
            }
        }
        return
    }
    if (Test-Path $NsExeName) { & $NsExeName @args }
}

if (-not $env:NVIM) {
    if (Test-Path $NsExeName) {
        & $NsExeName
    }
    [System.Environment]::Exit(0)
}

if ($env:NVIM) {
    Set-Content -Path (Join-Path $script:TmpDir "nvim-profile-ready-$pid") -Value "1" -Force
}
