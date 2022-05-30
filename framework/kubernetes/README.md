# Kubernetes

## Kubernetes in action

### ch 2

up and running with docker

```
docker run busybox echo "Hello World"
docker run redis:alpine
# but how to connect?
# using colima so can
# colima ssh to get into the VM and list IP's
# seems to run on 192.168.5.15 based on ifconfig in VM
# but ...
redis-cli -h 192.168.5.15 ping
# seems to timeout?
# even with
docker run -p 6379:6379 redis:5.0.7-alpine
redis-cli -h 192.168.5.15 ping
# ? - TODO [ ]
# run specific redis alpine version (latest is default)
docker run redis:5.0.7-alpine
```

up and running with demo app kiada

```
git clone git@github.com:luksa/kubernetes-in-action-2nd-edition.git
cd kubernetes-in-action-2nd-edition/Chapter02/kiada-0.1
docker build -t kiada:latest .

# show the images on this machine
docker images
  REPOSITORY               TAG            IMAGE ID       CREATED         SIZE
  kiada                    latest         b1b701f64424   4 seconds ago   853MB

# show the layers of the image
docker history kiada:latest

# run and view it
docker run --name kiada-container -p 1234:8080 -d kiada
http://localhost:1234/
  Kiada version 0.1. Request processed by 2fa0f0b4dbc5. Client IP: ::ffff:172.17.0.1
curl localhost:1234
  Kiada version 0.1. Request processed by "2fa0f0b4dbc5". Client IP: ::ffff:172.17.0.1

# list state, config, and network settings, including its IP address.
docker inspect kiada-container
# or
docker inspect kiada-container | jq
```

push to docker hub

```
docker tag kiada saramic/kiada:0.1
docker images
  REPOSITORY               TAG            IMAGE ID       CREATED         SIZE
  kiada                    latest         b1b701f64424   5 minutes ago   853MB
  saramic/kiada            0.1            b1b701f64424   5 minutes ago   853MB

docker login -u saramic docker.io
  Password:
  Login Succeeded

docker push saramic/kiada:0.1
  The push refers to repository [docker.io/saramic/kiada]

# remove image locally to see it runs from docker.io
docker stop 2fa0f0b4dbc5
docker image remove -f b1b701f64424

# now run and download from docker.io
docker run --name kiada-container -p 1234:8080 -d saramic/kiada:0.1
  Unable to find image 'saramic/kiada:0.1' locally
  ...
  docker: Error response from daemon: Conflict. The container name
  "/kiada-container" is already in use by container
  "2fa0f0b4dbc58577340b2cda4a4588bf7d57384f0317d7fa569faad430f360ab". You have
  to remove (or rename) that container to be able to reuse that name.

docker container ls -a
  CONTAINER ID IMAGE        COMMAND       CREATED          STATUS                       PORTS     NAMES
  2fa0f0b4dbc5 b1b701f64424 "node app.js" 10 minutes ago   Exited (137) 3 minutes ago             kiada-container

docker container rm 2fa0f0b4dbc5
  2fa0f0b4dbc5

docker run --name kiada-container -p 1234:8080 -d saramic/kiada:0.1
  74b88382390f0430f547c93920df18ecff12167f186b26913fbab2c3e97b37d1

# easier way to stop
docker stop kiada-container

# should be able to remove image or prune all images
docker rmi kiada:latest
docker image prune
```

access the image

```
# assuming it is running
docker run --name kiada-container -p 1234:8080 -d saramic/kiada:0.1
docker exec -it kiada-container bash

# process inside image
docker exec -it kiada-container bash
ps aux | grep app.js
root         1  0.0  1.5 316540 32020 ?        Ssl  May29   0:00 node app.js

# process inside VM hosting docker
colima ssh
ps aux | grep app.js
30276 root      0:00 node app.js
```

