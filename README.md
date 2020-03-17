# dhf-pipes-docker

This project can be used as a git submodule for a project that needs docker containers for MarkLogic DHF. MarkLogic DHF QuickStart and MarkLogic Pipes.
(it is based on the work Stuart Moorhouse did in this repo: https://gitlab.com/stuartmoorhouse/marklogic-dhf_quickstart )

## Usage:Standalone

Create a file named '.env' 

````
stackName=test

# MarkLogic properties
DHFversion=5.2.0
mlAdmin=admin
mlPassword=admin
mlVersion=10.0-3-dev-centos
mlAdminPort=8000
mlAppServicesPort=8001
mlManagePort=8002
mlStagingPort=8010
mlPortRange=7997-8025

# Download urls
quickStartURL=https://github.com/marklogic/marklogic-data-hub/releases/download/v5.2.0/marklogic-datahub-5.2.0.war
pipesURL=https://github.com/marklogic-community/pipes/releases/download/1.0-beta.4/marklogic-pipes-1.0-beta.4.jar

# Port mappings
markLogicPortMapping=7997-8025
quickStartPortMapping=9080
pipesPortMapping=9081

# quick_start properties (inside container)
quickstartPort=8080

# pipes properties (inside container)
pipesPort=8081
````

(This file wil be .gitignored)

Then you can build and run your stack by executing this command in your root project folder:
````
docker-compose up
````
Go to the QuickStart application on your browser by default this will be at http://localhost:9080 unless you've change the quickStartPortMapping value in your .env file.
Set the MarkLogic host to ${stackName}.dhf.local. For example, if you set stackName to be "test" in the .env file, set it to test.dhf.local

If you have a DHF configuration deployed on MarkLogic you can fire up the MarkLogic Pipes

````
docker exec -it test.pipes java -jar app.jar
````

## Usage:Embedded as gitmodule

Inside the git project you can execute the following command to add this project as a submodule:

````
git submodule add git@github.com:peetkes/dhf-pipes-docker.git docker
````

This will add this project as submodule into folder 'docker' to your own project

In the root of your own project you can create a file named .env with the following properties:

````
stackName=sccss

# MarkLogic properties
DHFversion=5.2.0
mlAdmin=admin
mlPassword=admin
mlVersion=10.0-3-dev-centos
mlAdminPort=8000
mlAppServicesPort=8001
mlManagePort=8002
mlStagingPort=8010
mlPortRange=7997-8025

# Download urls
quickStartURL=https://github.com/marklogic/marklogic-data-hub/releases/download/v5.2.0/marklogic-datahub-5.2.0.war
pipesURL=https://github.com/marklogic-community/pipes/releases/download/1.0-beta.4/marklogic-pipes-1.0-beta.4.jar

# Port mappings
markLogicPortMapping=7997-8025
quickStartPortMapping=9080
pipesPortMapping=9081

# quick_start properties (inside container)
quickstartPort=8080

# pipes properties (inside container)
pipesPort=8081
````

(This file wil be .gitignored)

Then you can build and run your stack by executing this command in your root project folder:
````
docker-compose -f docker/docker-compose.yml up
````

Go to the QuickStart application on your browser by default this will be at http://localhost:9080 unless you've change the quickStartPortMapping value in your .env file.

Set the MarkLogic host to ${stackName}.dhf.local. For example, if you set stackName to be "test" in the .env file, set it to test.dhf.local

As soon as the MarkLogic application is deployed you can also start the pipes application

````
docker exec -it test.pipes java -jar app.jar
````