# Pre-requisiste
1. docker installation
2. jq installation - brew install jq

# 1 Launch docker-registry
docker run -d -p 5000:5000 --restart=always --name registry registry:2 

# 2 Build the docker image for the application 
docker build -t my-app:v1 .

# 3 Test the image by running it locally 

docker run -it --rm --name my-running-app my-app:v1

# 4 Tag the image- keeping it simple app-name:N where N is major release version number

docker tag my-app:v1 localhost:5000/my-app:v1

# 5 Push the image to registry
docker push localhost:5000/my-app:v1


# 6 Pull docker image from registry

docker pull localhost:5000/my-app:v1


Make changes to the java code and follow step 2 , 3 ,4 & 5. Get the latest tag as below<br/>

curl http://localhost:5000/v2/my-app/tags/list 


# Cleardown - remove locally cached images and stop registry

docker image remove my-app:v1<br/>
docker image remove localhost:5000/my-app:v1<br/>
docker container stop registry && docker container rm -v registry<br/>


