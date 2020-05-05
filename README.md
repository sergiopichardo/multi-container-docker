# Multi Container Docker 
Containerizing multiple React and Node application with Docker, and Docker-compose (for learning purposes)

![alt Project Architecture](https://github.com/sergiopichardo/multi-containter-docker/blob/master/diagrams/app-architecture.png)


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
The React app does will update when indices are submitted, 
to achieve this, I'll try to use websockets in future updates of the project to setup polling between react and express server. 
