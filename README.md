# Multi Container Docker 
Containerizing multiple React and Node application with Docker, and Docker-compose (for learning purposes)

![alt Project Architecture](https://github.com/sergiopichardo/multi-container-docker/blob/master/diagrams/app-architecture.png)



## How to start up the application development using docker-compose

Build for the first time
```sh
docker-compose up --build
```

Consequent start up
```sh
docker-compose up
```

## Dockerrun.aws.json
This file is used by Elastic Beanstalk to delegate the setup of Docker containers to 
ECS (Elastic Container Service). You'll need to create a **container definition**. 

[Container Definitions Documentation](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html)


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

## Lint your Dockerrun.aws.json file 
Install JSON Lint
```sh
npm install -g jsonlint-mod 
```

Run JSON Lint
```sh
jsonlint Dockerrun.aws.json
```

## Instance Profile

### What is an instance profile? 
An instance profile is a container for an *IAM role* that you can use to *pass role information to an EC2 instance* when the instance starts.

### Setting up an instance profile 
Setting up an instance profile to allow your EC2 instances to communicate 
with ECS (Elastic Container Server) which is the service that manages Docker containers.
This happens through the ECS Agent running inside your EC2 instance, but for this to 
happen you need to attach a role to your instances. But before that, you need to attach
another managed policy that let's your instances assume the role through STS (Securty Token Service). 

### Create a new role with the assume role policy
```sh
aws iam create-role --role-name <YOUR_ROLE_NAME> \
                    --assume-role-policy-document file://Role-Trust-policy.json
```

### Create an instance profile
```sh
aws iam create-instance-profile --instance-profile-name <YOUR_INSTANCE_PROFILE_NAME>
```

### Attach the role to the instance profile
```sh
aws iam add-role-to-instance-profile --role-name <YOUR_ROLE_NAME> \
                                     --instance-profile-name <YOUR_INSTANCE_PROFILE_NAME>
```

### Attach policy to role 
```sh
aws iam attach-role-policy --role-name <YOUR_ROLE_NAME> \
                           --policy-arn <POLICY_ARN>
```

This is the ARN of the `AWSElasticBeanstalkMulticontainerDocker` policy you'd need to attach to your Role 
```sh
arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker
```


### Check if your role was create by listing the profile
```sh
aws iam list-instance-profiles 
```

## Setup Elastic Beanstalk 
NOTE: I'm assuming you already installed elastic beanstalk CLI. 

### Create a new Elastic Beanstalk Application 
```sh 
eb init <YOUR_EB_APPLICATION_NAME>
```

### Create a new Elastic Beanstalk Environment 
```sh 
eb create <YOUR_EB_ENVIRONMENT_NAME> -ip <YOUR_INSTANCE_PROFILE_NAME> 
```

### Check your environment status
```sh 
eb status
```

### List your running environments
```sh 
eb list
```

### Check your environment logs
```sh 
eb logs
```

### Open Application URL in browser
```sh 
eb open
```

### Terminate your environment (along with application)
```sh 
eb terminate <YOUR_EB_ENVIRONMENT_NAME>
```



#### TODOS (for myself)
- [ ] Autome instance profile configuration using ansible
- [ ] Automate entire application architecture using cloudformation
- [ ] Create Jenkins CI/CD Pipeline using Jenkins in Docker 



## NOTE
The React app does not reload when indices are submitted. You must reload page manually. 
In future updates of the project I'll try to use websockets to setup polling between react and express server.  



