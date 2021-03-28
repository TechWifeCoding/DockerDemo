docker container stop flask-hello-service
docker container rm flask-hello-service
#docker run -p 5000:5000 -v `pwd`:`pwd` --name flask-hello-service flask-hello:v1
srcPath=`pwd`/src
docker run -p 5000:5000 -v $srcPath:/app/src --name flask-hello-service flask-hello:v1
