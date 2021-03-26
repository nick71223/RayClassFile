$testkeyurl = Test-Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\RestoreOnStartupURLs'
$testkeygoogle = Test-Path 'HKLM:\SOFTWARE\Policies\Google'
$testkeychrome = Test-Path 'HKLM:\SOFTWARE\Policies\Google\Chrome'
if(-not($testkeygoogle)){
    New-Item -Path 'HKLM:\SOFTWARE\Policies\Google'
    }
if(-not($testkeychrome)){
    New-Item -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome'
    New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name 'HomepageIsNewTabPage' -Value 0 -PropertyType DWORD -force
    New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name 'HomepageLocation' -Value 'www.111111111111111111111111111111111111111111111111111111111111.com' -PropertyType String -force
    }
#Making sure the user has the key before the process can continue
if(-not($testkeyurl)){
    New-Item -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\RestoreOnStartupURLs'
    New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome\RestoreOnStartupURLs' -Name  '1' -Value 'www.111111111111111111111111111111111111111111111111111111111111.com' -PropertyType String  –Force
    }
 