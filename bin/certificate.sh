#!/bin/sh

docker pull palobo/certbot

GetCert() {
  docker run -it \
    --rm \
    -v /docker/storage/digituz/letsencrypt/etc:/etc/letsencrypt \
    -v /docker/storage/digituz/letsencrypt/lib:/var/lib/letsencrypt \
    -v /docker/storage/digituz/letsencrypt/www:/var/www/.well-known \
    palobo/certbot -t certonly --webroot -w /var/www \
    --keep-until-expiring \
    $@
}

echo "Getting certificates..."
GetCert -d digituz.com.br

echo "Restarting Web Frontend..."
cd ~/git/digituz
docker-compose down
docker-compose up -d
cd -

echo "Done"
