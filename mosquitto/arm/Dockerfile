FROM multiarch/alpine:armhf-v3.10

RUN addgroup -g 1000 mosquitto \
    && echo 'mosquitto:x:1000:1000::/mosquitto:/sbin/nologin' >> /etc/passwd \  
	&& apk --no-cache add mosquitto \
	&& mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log \
	&& chown -R mosquitto:mosquitto /mosquitto \
	&& cp /etc/mosquitto/mosquitto.conf /mosquitto/config
	
VOLUME ["/mosquitto/config", "/mosquitto/data", "/mosquitto/log"]	

USER mosquitto

#ENTRYPOINT ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
