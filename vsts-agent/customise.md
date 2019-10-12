# Customise

To customise this image first [download](https://github.com/modalitysystems/modalitysoftware-docs/releases/download/Latest/vsts-agent-ltsc2016.zip) the docker file package and extract

Make appropriate adjustments but leave start.ps1 script unchanged

Open PowerShell from the extraction location and run the following command:

docker build -t vsts-agent:ltsc2016-1.0 -m 2GB .

To create a container from this image and access a powershell prompt run the following command:

docker run --rm -it vsts-agent:ltsc2016-1.0 powershell.exe

To create an Azure DevOps Agent from this image run the following command:

docker run -e AZP_URL=? -e AZP_TOKEN=? -e AZP_POOL=? -d vsts-agent:ltsc2016-1.0
