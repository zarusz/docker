# https://raw.githubusercontent.com/syncthing/docker/master/Dockerfile
FROM multiarch/alpine:arm64-v3.6

RUN addgroup -g 1000 syncthing \
    && echo 'syncthing:x:1000:1000::/var/syncthing:/sbin/nologin' >> /etc/passwd \    
    && mkdir /var/syncthing \
    && mkdir /var/syncthing/config \
    && chown -R syncthing /var/syncthing \
    && chgrp -R syncthing /var/syncthing

RUN apk add --update curl jq && \
    rm -rf /var/cache/apk/*

ENV release= \
    arch=arm64

RUN set -x \
    && mkdir /syncthing \
    && cd /syncthing \
    && release=${release:-$(curl -s https://api.github.com/repos/syncthing/syncthing/releases/latest | jq -r .tag_name )} \
    && curl -s -L https://github.com/syncthing/syncthing/releases/download/${release}/syncthing-linux-${arch}-${release}.tar.gz \
    | tar -zx \
    && mv syncthing-linux-${arch}-${release}/syncthing . \
    && rm -rf syncthing-linux-${arch}-${release}

#USER syncthing
ENV STNOUPGRADE=1
ENTRYPOINT ["/syncthing/syncthing", "-home", "/var/syncthing/config", "-gui-address", "0.0.0.0:8384"]
#CMD ["/bin/sh"]

