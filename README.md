# Multi Container Docker 
Containerizing multiple React and Node application with Docker, and Docker-compose (for learning purposes)

![alt Project Architecture](https://github.com/sergiopichardo/multi-container-docker/blob/master/diagrams/app-architecture.png)



## How to start up the application 

Build for the first time
```sh
$ docker-compose up --build
```

Consequent start up
```sh
$ docker-compose up
```

## `Dockerrun.aws.json`
This file is used by Elastic Beanstalk to delegate the setup of Docker containers to 
ECS (Elastic Container Service). You'll need to create a **container definition**. 

[alt Container Definitions Documentation](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html)


### Example
```json
{
    "AWSEBDockerrunVersion" : 2, 
    "containerDefinitions" : [
        {
            "name": "client", 
            "image": "sergiopichardo/multi-client",
            "hostName": "client",
            "essential": false
        }
    ]  
}
```

## Lint your `Dockerrun.aws.json` file 
Install JSON Lint
```sh
$ npm install -g jsonlint-mod 
```

Run JSON Lint
```sh
$ jsonlint Dockerrun.aws.json
```














## NOTE
The React app does not reload when indices are submitted. You must reload page manually. 
In future updates of the project I'll try to use websockets to setup polling between react and express server.  



