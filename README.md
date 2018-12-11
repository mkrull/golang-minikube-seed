# Golang Minikube Seed

This is a seed to showcase how to easily build and run Go applitions in
Minikube.

## Prerequisites

To be able to use this project working local installations of `kubectl`,
`minikube`, and `docker` are required.

## Run

Check out this repository:

    $ git clone https://github.com/mkrull/golang-minikube-seed
    $ cd golang-minikube-seed
    
Start minikube if it is not yet running:

    $ minikube start

Once minikube is up and running make sure to use the cluster internal docker
server so the images built are available within the cluster. On UNIX-like
systems run:

    $ eval $(minikube docker-env)
    
On Windows follow the official documentation on how to make the docker
environment available.

Now build the container image:

    $ docker build -t hello:v1 .

And run it with some replicas:

    $ kubectl run --image hello:v1 --replicas 4 hello
    $ kubectl get pods
    
This will return a list of starting or running pods using the image built
before.

To reach the pods a service is required:

    $ kubectl expose deployment hello --type NodePort --port 3000

To get the URL the service is using to expose the group of pods use:

    $ minikube service hello --url
    http://192.168.39.56:30194
    
The url might differ. Point a browser there and `Hello world` will be shown.
Alternatively use `curl` on the command line:

    $ curl $(minikube service hello --url)
