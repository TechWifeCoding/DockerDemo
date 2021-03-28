# DockerDemo

# Build
```shell
docker build -t flask-hello:v1 .
```
## remove images
```shell
# remove containers stopped
docker container rm $(docker container ls -a |awk '{print $1}'|grep -v CONTAINER)

# remove
docker rmi -f $(docker images|awk '/none/{print $3}')
```
## bash 脚本
```shell
./scripts/rebuild.sh
```

# Run
```shell 
docker run -p 5000:5000  --name flask-hello-service flask-hello:v1
```

##  Run background
```shell
docker run -p 5000:5000  --name flask-hello-service flask-hello:v1
```

##  Restart Run
```shell
# clear stop container
docker container stop flask-hello-service
docker container rm flask-hello-service
docker run -p 5000:5000  --name flask-hello-service flask-hello:v1
```

bash 脚本
```shell
./scripts/restart.sh
```

## dev run
```shell
srcPath=`pwd`/src
docker run -p 5000:5000 -v $srcPath:/app/src --name flask-hello-service flask-hello:v1
```

## change env
```shell
docker run -p 5000:8000 -e FLASK_RUN_PORT=8000 --name flask-hello-service flask-hello:v1

```


# 进入 容器
```shell
docker exec -it flask-hello-service /bin/bash
```