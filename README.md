```bash
mkdir ~/git/
cd ~/git/
git clone https://github.com/brunokrebs/angular-auth0-aside.git
cd angular-auth0-aside
docker build -t angular-auth0 .
docker run --name angular-auth0 --network digituz -d angular-auth0
docker run --name blog-new-layout --network digituz -d brunokrebs/auth0-blog-design

# create a network
docker network create digituz

# build the nginx image
docker build -t digituz-docker .

# run an instance based on this image
docker run --network digituz --name digituz-docker -d -p 80:80 digituz-docker
```
