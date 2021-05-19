# Spacecookie Docker

[Spacecookie](https://github.com/sternenseemann/spacecookie) is a [Gopher protocol server](https://en.wikipedia.org/wiki/Gopher_(protocol)).

I like to run this behind my host's Tor:

```bash
docker network create --subnet=172.18.0.0/16 servicenet
docker build -t spacecookie .
docker run -d -v $(pwd)/gopher-content/:/srv/gopher --restart=always --net servicenet --hostname=spacecookie --ip=172.18.0.68 spacecookie
```

Sometimes when you update the files you may need to use this:

```
docker exec -t b72 bash -c "chown -R spacecookie:spacecookie /srv/gopher"
```

It's very important to set your host to the domain you'll be using for the
gopherhole (not localhost). For me it was my `.onion` address.

## Spacecookie version

This repo is setup so the latest GitHub main branch from Spacecookie is always
used. If you want to upgrade to the latest version simply rebuild the image
like this:

```
docker build --no-cache -t spacecookie .
```
