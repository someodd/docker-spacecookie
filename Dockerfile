FROM haskell:8.10.2-buster
MAINTAINER hyperrealgopher, https://github.com/hyperrealgopher

RUN apt-get update
RUN apt-get install -y git
RUN git clone https://github.com/sternenseemann/spacecookie
Run cabal update
RUN cd spacecookie && cabal v2-install .
#RUN cabal update
#RUN cabal v2-install spacecookie
RUN useradd spacecookie
ADD spacecookie.json /etc/spacecookie.json
RUN mkdir -p /srv/gopher

EXPOSE 70

ADD ./launch.sh /launch.sh
RUN chmod +x /launch.sh
ENTRYPOINT ["/launch.sh"]
