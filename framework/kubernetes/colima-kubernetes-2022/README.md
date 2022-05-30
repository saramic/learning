# Colima + Kubernetes for 2022

based on:
- https://mrsauravsahu.medium.com/containers-and-kubernetes-on-macos-a-setup-for-2022-2bbba491f644
- and using docker over containerd
  https://mrsauravsahu.medium.com/docker-and-kubernetes-on-macos-a-setup-for-2022-aa01819920b6

```
make setup
make demo
make clean
```

```
# can start colima with kubernetes with
colima start --with-kubernetes -r docker
# or simply
colima start --with-kubernetes

# simple JS endpoing based on index.js
docker build -t simple-node-server .
docker run -d -p 8081:80 -e HOST=0.0.0.0 -e PORT=80 simple-node-server

curl http://localhost:8081 | jq
  {
    "message": "ping"
  }
```

fire up kubernetes

```
# create a namespace
kubectl create ns simple-app

# deploy the app
kubectl apply -f deployment.yaml -n simple-app

# check which port it is running on
kubectl get svc -n simple-app simple-node-server -o json | jq '.spec.ports[0].nodePort'
32079
✅ works

# Originally failed as running colima ... -r containerd (as initially indicated
# in above blog post) meant it always ran that way which means docker command
# was actually interacting with running docker-desktop so it could not actually
# find the image to run. Now running everything through colima and resetting to
# -r docker makes it work.
curl http://localhost:32079
curl: (56) Recv failure: Connection reset by peer
```

## Protainer UI

tried it but was not impressed

```
docker volume create portainer_data
docker run -d -p 9000:9000 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    cr.portainer.io/portainer/portainer-ce:2.9.3

open http://localhost:9000
```

