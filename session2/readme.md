Tareas

Crear o utilizar una vpc y subnet para poder levantar el ambiente ejemplo https://github.com/AxelMonroyX/nginx-custom-vpc-private-public-subnets/tree/master/modules/aws_vpc

Crear en terraform o subir por la consola de aws la key pair

Levantar las instancias utilizando 
```
cd environments/develop
terraform init 
terraform plan
terraform apply
```

# Questions

EBs Volumes live inside the instance?
elastic beanstalk for provisionning??

cual es la diferencia entre usar s3 bucket o el hdd en la instancia EBS? 
Elastic File storage (EFS) permite tener un hdd compartido por varias instancias.

- what is a placement group?? 
- how it connects to the auto scaling group??

Devops concept - in place vs blue deployment

# Homework Session 3

- Modify cooldown time? what is for? 

This is for terraform documentation.
default_cooldown - (Optional) The amount of time, in seconds, after a scaling activity completes before another scaling activity can start.

- Open port 80, create node app and hit port 80. Add dockerfile and run node server in docker.

- Add ELB to the project. try classic load balancer.
- Application load balancer vs classic load balancer.

- (optional) investigate a bastion architecture. how it works and how you'd implement.

Status 14-21 May: continue to work on devops career path.

Last week: Finished the aws cloud practioner course by freecode camp.(4 hours video + hands on exp)
This week (maybe next too): Started the aws developer associate (11 hours course).
Advances on the devops classes project can be found here: https://github.com/alexkilla/devops_sessions

# Homework session 4

- Refactor subnets to export all the subnet instead of just the ids.

- Open port 80, create node app and hit port 80. Add dockerfile and run node server in docker.

---------------------------

- Add ELB to the project. try classic load balancer.
- Application load balancer vs classic load balancer.

- (optional) investigate a bastion architecture. how it works and how you'd implement.









    