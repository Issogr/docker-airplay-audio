# Simple Airplay Audio Receiver

This is a simple Apple AirPlay receiver based on [shairport-sync](https://github.com/mikebrady/shairport-sync). It can receive audio directly from Apple compatible devices.

## Parameters

* `--net host` must be run in host mode
* `--device /dev/snd` share host alsa system with container. Does not require `--privileged` as `-v /dev/snd:/dev/snd` would
* `-e AIRPLAY_NAME=Docker` set the AirPlay device name. Defaults to Docker
* extra arguments will be passed to shairplay-sync (try `-- help`)
