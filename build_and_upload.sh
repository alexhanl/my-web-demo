mvn clean package
docker build -t my-web-demo:1.0.0 .
docker tag my-web-demo:1.0.0 ghcr.io/alexhanl/my-web-demo:1.0.0
echo ${CR_PAT}| docker login ghcr.io -u liang.han@gmail.com --password-stdin
docker push ghcr.io/alexhanl/my-web-demo:1.0.0