# Login Azure
function azrun() {
az login -u $username -p $password
az account set -s $subscription
az acr login -n $registryname -u $registryuser -p $registrypwd
docker pull hello-world:latest
}

# Images with different repositories name but same manifest
function pushimagessamemain($testregistry) {
    for ($i=1; $i -le 210; $i++){
    $targetregistry1=$testregistry + "/hello-world" + $i + ":v" + $i
    docker tag "hello-world:latest" $targetregistry1
    docker push $targetregistry1
    }
}

# Images with different tags but same manifest
function addtags($testregistry) {
    for ($q=1; $q -le 210; $q++){
    $targetregistry2=$testregistry + "/hello-world:v" + $q
    docker tag "hello-world:latest" $targetregistry2
    docker push $targetregistry2
    }
}

# Images with different manifests
function pushimagesdiffmain($testregistry) {
    for ($x=1; $x -le 210; $x++){
    $targetregistry3=$testregistry + "/hellox:v" + $x
    echo $x >> test.txt
    docker build -t $targetregistry3 -f .\Dockerfile.dockerfile C:\ACR\callenTest\AzureTestingLocal\pushimages
    docker push $targetregistry3
    }
}


Set-Location C:\ACR\callenTest\AzureTestingLocal\pushimages
# Set Log file
$FileName = "PushImages" + (Get-Date -Format yyMMdd) +".txt"
$logFile = Join-Path .\Log $FileName

Start-Transcript $logFile -Append -Force

$testregistry="$registryname.azurecr.io"
azrun
addtags($testregistry)
pushimagessamemain($testregistry)
pushimagesdiffmain($testregistry)

Stop-Transcript