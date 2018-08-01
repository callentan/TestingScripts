@echo off
IF "%GIT_TOKEN%"=="" ( ECHO "GIT_TOKEN Not defined" & GOTO USAGE)
IF "%VSTS_TOKEN%"=="" ( ECHO "GIT_TOKEN Not defined" & GOTO USAGE)

set IMAGE_NAME="syncrepos"

GOTO BUILD
:USAGE
exit /b

:BUILD
pushd %~dp0

docker build --pull -t %IMAGE_NAME% -f ./Dockerfile ^
    --build-arg GIT_TOKEN="%GIT_TOKEN%" ^
    --build-arg VSTS_TOKEN="%VSTS_TOKEN%" ^
    ../

set /p id="Push the generated image to kraterdevci.azurecr-test.io:455/%IMAGE_NAME%  (Y/N): "

IF /I "%id%"=="Y" (
    docker login -u citest -p %KRATERDEV_PASSWORD% kraterdevci.azurecr-test.io:455
    docker tag %IMAGE_NAME% kraterdevci.azurecr-test.io:455/%IMAGE_NAME% 
    docker push kraterdevci.azurecr-test.io:455/%IMAGE_NAME% 
)

popd