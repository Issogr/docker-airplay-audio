# Raspberry Pi version of kevineye/docker-shairport-sync.

[shairport-sync](https://github.com/mikebrady/shairport-sync) is an Apple AirPlay receiver. It can receive audio directly from iOS devices, iTunes, etc. Multiple instances of shairport-sync will stay in sync with each other and other AirPlay devices when used with a compatible multi-room player, such as iTunes or [forked-daapd](https://github.com/jasonmc/forked-daapd).

In this fork:

- Removed Jenkinsfile
- /etc/shairport-sync.conf is changed with ```volume_range_db=40``` to get better volume on the RPi
- docker-compose file (from https://github.com/protenhan/rpi-docker-shairport-sync) to have shairport-sync automatically restarted
- base images "alpine" and removed cross-build.

## Build

```
docker build -t kexkey/shairport-sync-rpi .
```

## Configure

```
vi docker-compose.yml
```

## Run

```
docker-compose up -d
```

```
docker run -d \
    --net host \
    --device /dev/snd \
    -e AIRPLAY_NAME=Docker \
    -v /path/to/custom/shairport-sync.conf:/etc/shairport-sync.conf
    kexkey/shairport-sync-rpi
```

### Parameters

* `--net host` must be run in host mode
* `--device /dev/snd` share host alsa system with container. Does not require `--privileged` as `-v /dev/snd:/dev/snd` would
* `-e AIRPLAY_NAME=Docker` set the AirPlay device name. Defaults to Docker
* extra arguments will be passed to shairplay-sync (try `-- help`)

## More examples

Send output to a named pipe:

    mkfifo /some/pipe
    docker run -d \
        --net host \
        -v /some/pipe:/output \
        kexkey/shairport-sync-rpi \
            -o pipe \
            -- /output
