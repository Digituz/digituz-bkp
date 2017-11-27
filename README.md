```bash
# build the image
docker build -t digituz-docker .

# run an instance based on this image
docker run --name digituz-docker -d -p 8888:80 digituz-docker
```
