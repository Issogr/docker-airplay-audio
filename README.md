# Simple Airplay Audio Receiver
[![GitHub Repo stars](https://img.shields.io/github/stars/issogr/docker-airplay-audio?style=social)](https://github.com/Issogr/docker-airplay-audio)
[![Pulls](https://shields.beevelop.com/docker/pulls/issogr/airplay-audio.svg?style=flat-square)](https://hub.docker.com/r/issogr/airplay-audio)
[![Size](https://shields.beevelop.com/docker/image/image-size/issogr/airplay-audio/latest.svg?style=flat-square)](https://hub.docker.com/r/issogr/airplay-audio)

This is a simple Apple AirPlay receiver based on [shairport-sync](https://github.com/mikebrady/shairport-sync). It can receive audio directly from Apple compatible devices.

## Parameters

* `--net host` must be run in host mode
* `--device /dev/snd` share host alsa system with container.  
  Does not require `--privileged` as `-v /dev/snd:/dev/snd` would
* `-e AIRPLAY_NAME=Docker` set the AirPlay device name. Defaults to Docker
* extra arguments will be passed to shairplay-sync (try `-- help`)

## docker-compose
```docker
version: '3'
services:
  airplay:
    image: issogr/airplay-audio
    restart: always
    network_mode: host
    devices:
      - /dev/snd
    environment:
      - AIRPLAY_NAME=<custom name>
```
