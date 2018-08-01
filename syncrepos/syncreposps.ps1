function execsync($sourcerepo) {
    foreach ($targetrepo in $targetrepos)
    {
        Write-Output "++++++++++++++++ $targetrepo +++++++++++++++++"
        git clone $targetrepo
        $path = $targetrepo.Split("/")[-1]
        Set-Location $path
        git pull $sourcerepo
        git push origin
        cd..
        Remove-Item $path -Force -Recurse
    }
}

Set-Location C:\ACR\callenTest\AzureTesting\syncrepos

# Set Log file
$FileName = "SyncRepos" + (Get-Date -Format yyMMdd) +".txt"
$logFile = Join-Path .\Log $FileName

Start-Transcript $logFile -Append -Force

$targetrepos = Get-Content -Path C:\ACR\callenTest\AzureTesting\syncrepos\distributionrepos.log
execsync("https://github.com/docker/distribution.git")

$targetrepos = Get-Content -Path C:\ACR\callenTest\AzureTesting\syncrepos\iisrepos.log
execsync("https://github.com/Microsoft/iis-docker.git", "iis")


Stop-Transcript