# Deploying Digituz Gateway

## Creating Digituz Network

First, we need to create a Docker network for Digituz microservices:

```bash
DIGITUZ_NETWORK=digituz

docker network create $DIGITUZ_NETWORK
```

## Bootstrapping Microservices

Then we have to bootstrap all Digituz microservices. To do so, we can follow instructions on their own repositories:

- [Deploying React Client on Digituz](https://github.com/brunokrebs/react-auth0/blob/master/docs/deploy-digituz.md)
- [Deploying RestFlex on Digituz](https://github.com/auth0-blog/auth0-rest-server/blob/master/docs/deploy-digituz.md)
- [Deploying Auth0 Generic Client on Digituz](https://github.com/brunokrebs/angular-auth0-generic-client/blob/master/docs/deploy-digituz.md)
- [Deploying Bang-Bang React Game](https://github.com/auth0-blog/bang-bang-react-game/blob/master/docs/deploy-digituz.md)

## Bootstrapping Digituz Gateway

We have to leave bootstrapping Digituz Gateway as the last thing because NGINX uses the other microservices as upstreams:

```bash
# clone
git clone https://github.com/Digituz/docker.git ~/git/digituz-gateway
cd ~/git/digituz-gateway

# build the nginx image
docker build -t digituz-gateway .

# run an instance based on this image
docker run --network digituz --name digituz-gateway -d -p 80:80 digituz-gateway
```
