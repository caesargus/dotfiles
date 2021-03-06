# Setup Git for Powershell
# Import-Module posh-git
# Import-Module oh-my-posh

#Set-Theme Paradox
Set-PSReadlineOption -EditMode vi

# ahh yes... this would be so nice if it was a built in variable
$here = Split-Path -Parent $MyInvocation.MyCommand.Path

# Set so pip won't run without a virtualenv
$env:PIP_REQUIRE_VIRTUALENV=1

# Make the tab completion work like Bash
Set-PSReadlineKeyHandler -Key Tab -Function Complete

# Remove System PATH to OpenSSH to use my version
$remove = "C:\Windows\System32\OpenSSH\"
$env:Path = ($env:Path.Split(';') | Where-Object -FilterScript {$_ -ne $Remove}) -join ';'

$add = "~\scoop\modules"
$env:PSModulePath = $env:PSModulePath + ';' + $add

# Clean out so Curl works as expected
if (Test-Path Alias:curl) { remove-item alias:curl }

# $GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
# set-theme agnoster

# =================================================================
# Make emacs launch on the command line in powershell
# $emacs_wildcard = "${Env:ProgramFiles}\Emacs\*\bin\emacs.exe"
# if ($(Test-Path $emacs_wildcard)) {
    # $emacs_path = (Get-ChildItem $emacs_wildcard)[-1].FullName -replace ' ', '` '
      # function emacs { "$emacs_path -nw $args" | Invoke-Expression }
# }

# ===========================================================
# Helper functions
# ===========================================================
Get-ChildItem ${HOME}\code\dotfiles\powershell\functions\*.ps1 | %{. $_ }

# z directory fun
import-module zlocation

if (test-path alias:set) { remove-item alias:set }


# ================================================================

. ${HOME}/code/dotfiles/starship/init.ps1
# try { $null = gcm pshazz -ea stop; pshazz init 'default' } catch { }
