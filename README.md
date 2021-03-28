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
docker run -p 5000:5000 -v $srcPath:/app/src -e FLASK_ENV=development --name flask-hello-service flask-hello:v1
```



# 进入 容器
```shell
docker exec -it flask-hello-service /bin/bash
```

# github action 
这是github默认的类似Jenkins Pipeline的工具, 具体参考[git Action 语法](https://docs.github.com/en/actions/reference/environment-variables).

整个部署过程其实就两个操作:
1. [docker build and push](https://github.com/docker/build-push-action)
2. [ssh remote executaion](https://github.com/marketplace/actions/remote-bash)

其中:
1. 在这个项目中通过 docker buildx + qemu 让这份代码可以在  ARM、Power-PC 和 RISC-V 等多种CPU架构上执行,参考[buildx & qemu](https://my.oschina.net/u/4148359/blog/3136278)

2. 如果本地测试, 需要安装 [act](https://github.com/nektos/act), 可以直接在本机执行

参考:




