## Instructions

To configure a new [Droplet](https://www.digitalocean.com/products/droplets/), simply use the [Docker One-Click App](https://www.digitalocean.com/products/one-click-apps/docker/) to create a new server.

Then, you will need to update the DNS to point `digituz.com.br` to the public IP address of this server. When finished, you can login into your droplet and clone this repo.

```bash
# log into your server
ssh root@digituz.com.br

# clone this repo
mkdir git
cd git
git clone https://github.com/Digituz/digituz.git ./digituz

# move into it
cd digituz

# run it
bin/run.sh &
```

### Generating Wildcard Certificates

```bash
cd ~/git/
git clone https://github.com/certbot/certbot ./certbot
cd certbot
./certbot-auto certonly --manual \
  -d *.digituz.com.br \
  --agree-tos \
  --manual-public-ip-logging-ok \
  --preferred-challenges dns-01 \
  --server https://acme-v02.api.letsencrypt.org/directory


-------------------------------------------------------------------------------
Please deploy a DNS TXT record under the name
_acme-challenge.example.com with the following value:

qqiR_lsa2AjMfoVR16mH4UDbOxy_E02l0K1CNyz1RdI

Before continuing, verify the record is deployed.
-------------------------------------------------------------------------------
Press Enter to Continue
```

Then, add the TXT record to your DNS and press _Enter_ twice. This will (hopefully) show:

```bash
Waiting for verification...
Cleaning up challenges

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/example.com/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/example.com/privkey.pem
   Your cert will expire on 2018-06-11. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot-auto
   again. To non-interactively renew *all* of your certificates, run
   "certbot-auto renew"
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
```

The `docker-gateway` service is using `/etc/letsencrypt` through a volume defined in [the `docker-compose.yml` file](./docker-compose.yml).
