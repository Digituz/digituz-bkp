## Instructions

To configure a new [Droplet](https://www.digitalocean.com/products/droplets/), simply use the [Docker One-Click App](https://www.digitalocean.com/products/one-click-apps/docker/) to create a new server.

Then, you will need to update the DNS to point `digituz.com.br` to the public IP address of this server. When finished, you can login into your droplet and clone this repo.

```bash
# log into your server
ssh root@digituz.com.br

# clone this repo
mkdir git
cd git
git clone https://github.com/Digituz/digituz.git ./

# move into it
cd digituz

# run it
bin/run.sh &
```
