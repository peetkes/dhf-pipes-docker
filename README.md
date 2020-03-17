# dhf-pipes-docker

This project can be used as a git submodule for a project that needs docker containers for MarkLogic DHF. MarkLogic DHF QuickStart and MarkLogic Pipes.
(it is based on the work Stuart Moorhouse did in this repo: https://gitlab.com/stuartmoorhouse/marklogic-dhf_quickstart )

## Usage

Inside the git project you can execute the following command to add this project as a submodule:

````
git submodule add git@github.com:peetkes/dhf-pipes-docker.git docker
````

This will add this project as submodule into folder 'docker' to your own project

In the root of your own project you can create a file named .env with the following properties:

````
admin=admin
password=yourPasswrd
mlVersion=10.0-3-dev-centos
DHFversion=5.2
quickStartURL=https://github.com/marklogic/marklogic-data-hub/releases/download/v5.2/marklogic-datahub-5.0.3.war
pipesURL=https://github.com/marklogic-community/pipes/releases/download/1.0-beta.4/marklogic-pipes-1.0-beta.4.jar
stackName=yourStack
markLogicPortMapping=7997-8025
quickStartPortMapping=9080
pipesPortMapping=9081
mlAdminPort=8000
mlAppServicesPort=8001
mlManagePort=8002
mlStagingPort=8010
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