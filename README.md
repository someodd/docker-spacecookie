# Spacecookie Docker

[Spacecookie](https://github.com/sternenseemann/spacecookie) is a [Gopher protocol server](https://en.wikipedia.org/wiki/Gopher_(protocol)).

I like to run this behind my host's Tor:

```bash
docker network create --subnet=172.18.0.0/16 servicenet
docker build -t spacecookie .
docker run -d -v $(pwd)/gopher-content/:/srv/gopher --restart=always --net servicenet --hostname=spacecookie --ip=172.18.0.68 spacecookie
```
