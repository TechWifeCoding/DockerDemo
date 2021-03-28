docker build -t flask-hello:v1 .
docker container rm $(docker container ls -a |awk '{print $1}'|grep -v CONTAINER)
docker rmi -f $(docker images|awk '/none/{print $3}')
