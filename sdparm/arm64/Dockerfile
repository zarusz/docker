FROM arm64v8/debian

RUN apt-get update \
	&& apt-get install sdparm -y

# Sleep after 1.5h = 54000 * 0.1s
CMD ["/usr/bin/sdparm", "--flexible", "-6", "-l",  "--save", "--set", "SCT=54000", "--set", "STANDBY=1", "/dev/sda"]
