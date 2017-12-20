Preparing environment:

```bash
mkdir ~/git/
cd ~/git/
```

Preparing Docker:

```bash
# create a network
docker network create digituz
```

Cloning and starting Angular Auth0 Generic App:

```bash
git clone https://github.com/brunokrebs/angular-auth0-aside.git
cd angular-auth0-aside
docker build -t angular-auth0 .
docker run --name angular-auth0 --network digituz -d angular-auth0
```

Cloning and starting React Auth0:

```bash
git clone https://github.com/brunokrebs/react-auth0.git
cd react-auth0
docker build -t react-auth0 .
docker run --name react-auth0 --network digituz -d react-auth0
```

Starting Auth0 Blog with design proposal:

```bash
docker run --name blog-new-layout --network digituz -d brunokrebs/auth0-blog-design
```

Starting Digituz Docker (last command as it depends on everything else):

```bash
# build the nginx image
docker build -t digituz-docker .

# run an instance based on this image
docker run --network digituz --name digituz-docker -d -p 80:80 digituz-docker
```
