# Welcome

vsts-agent is a Docker image that includes many build tools for use with Azure DevOps pipelines. When a container is started it will download and register as an Azure agent based on given parameters. This is highly scalable and repeatable.

To get started [Install](https://docs.docker.com/install/windows/docker-ee/) Docker on Windows Server

Create a Docker [Swarm](https://docs.docker.com/engine/swarm/swarm-tutorial/create-swarm/) on 1, 3 or 5 Windows Servers

From an administrative powershell run the following command:

docker service create --name ? --replicas ? -e AZP_URL=? -e AZP_TOKEN=? -e AZP_POOL=? -d modalitysystems/vsts-agent:ltsc2016-3.5

To scale the service run the following command:

docker service scale ?=16

To update the service run the following command:

docker service update ? --replicas ? --update-parallelism ? --env-add AZP_URL=? --env-add AZP_TOKEN=? --env-add AZP_POOL=? --image modalitysystems/vsts-agent:ltsc2016-3.6

>[Click here for notes on how to customise the image](vsts-agent/customise.md)
