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


## NOTE
The React app does not reload when indices are submitted. You must reload page manually. 
In future updates of the project I'll try to use websockets to setup polling between react and express server.  
