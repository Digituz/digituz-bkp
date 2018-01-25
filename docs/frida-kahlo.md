# Deploying Frida Kahlo Store on Digituz

## Cloning the Repository

```bash
git clone https://github.com/Digituz/frida-kahlo-store ~/git/frida-kahlo-store
cd ~/git/frida-kahlo-store
```

## Creating Docker Instances

First, if not already existent, you need to create a Docker network:

```bash
DIGITUZ_NETWORK=digituz

docker network create $DIGITUZ_NETWORK
```

After that, you can bootstrap Frida Kahlo Store:

```bash
docker build -t frida-kahlo-store .

docker run --name frida-kahlo-store --network digituz -d frida-kahlo-store
```
