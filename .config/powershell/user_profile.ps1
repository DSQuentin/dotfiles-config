# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

#Prompt
Import-Module posh-git
Import-Module oh-my-posh

#Load Prompt Config
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'quentin.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

#Icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History


#Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

#Alias
Set-Alias ll ls
Set-Alias grep findstring
Set-Alias tig 'F:\Programs\Git\usr\bin\tig.exe'
Set-Alias less 'F:\Programs\Git\usr\bin\less.exe'

#Utilities
function cddev {
  set-location "F:\Quentin\Personnal\Dev"
}

function cddata {
  set-location "F:\"
}

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}