```bash
mkdir ~/git/
cd ~/git/
git clone https://github.com/brunokrebs/angular-auth0-aside.git
cd angular-auth0-aside
docker build -t angular-auth0 .
docker run --name angular-auth0 --network digituz -d angular-auth0
```

```bash
docker network create digituz
```

```bash
# build the image
docker build -t digituz-docker .

# run an instance based on this image
docker run --network digituz --name digituz-docker -d -p 8888:80 digituz-docker
```
