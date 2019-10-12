To customise this image first [download](https://github.com/modalitysystems/modalitysoftware-docs/releases/download/Latest/vsts-agent-ltsc2016.zip) the docker file package and extract

Make appropriate adjustments but leave start.ps1 script unchanged

Open PowerShell from the extraction location and run the following command:-

docker build -t vsts-agent:ltsc2016-1.0 -m 2GB .
