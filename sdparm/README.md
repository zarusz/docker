## What

Enable power saving mode of the external USB HDD disk after 1.5 hours.

Useful for OS where you cannot install sdparm, but docker is available (LibreELEC).

## Usage

Power saving mode for disk `/dev/sda`:
```
docker run --rm --privileged --device=/dev/sda:/dev/sda -it zarusz/sdparm:arm64
```

Power saving mode for disk by UUID:
```
docker run --rm --privileged --device=/dev/disk/by-uuid/FA59-8F03:/dev/sda -it zarusz/sdparm:arm64
```

## sdparm

The container uses `sdparm` in this way:
```
sdparm --flexible -6 -l --save --set SCT=54000 --set STANDBY=1 /dev/sda
```

1.5 hours is calculates from 54000 * 0.1s

The `--save` option will store the power management settings between machine restarts.

## Tweaking

Enter the container into shell:
```
docker run --rm --privileged --device=/dev/sda:/dev/sda -it zarusz/sdparm:arm64 /bin/sh
```

Then play with the settings:

```
sdparm --flexible -6 -l --set SCT=54000  /dev/sda
sdparm --flexible -6 -l --set STANDBY=1 /dev/sda
sdparm --flexible -6 -l --save --set SCT=54000 /dev/sda
sdparm --flexible -6 -l --save --set STANDBY=1 /dev/sda

sdparm --flexible -6 -l --get SCT /dev/sda
sdparm --flexible -6 -l --get STANDBY /dev/sda

sdparm --flexible -6 -l --save --set SCT=54000 --set STANDBY=1 /dev/sda
sdparm --flexible -6 -l --set SCT=54000 --set STANDBY=1 /dev/sda
```

More details see:
https://lists.debian.org/debian-user/2015/08/msg00125.html
