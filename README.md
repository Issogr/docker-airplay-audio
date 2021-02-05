# Simple Airplay Audio Receiver
[![GitHub Repo stars](https://img.shields.io/github/stars/issogr/docker-airplay-audio?style=social)](https://github.com/Issogr/docker-airplay-audio)
[![Pulls](https://shields.beevelop.com/docker/pulls/issogr/airplay-audio.svg?style=flat-square)](https://hub.docker.com/r/issogr/airplay-audio)
[![Size](https://shields.beevelop.com/docker/image/image-size/issogr/airplay-audio/latest.svg?style=flat-square)](https://hub.docker.com/r/issogr/airplay-audio)

This is a simple Apple AirPlay receiver based on [shairport-sync](https://github.com/mikebrady/shairport-sync). It can receive audio directly from Apple compatible devices.

## Use
### Parameters

* `--net host` must be run in host mode
* `--device /dev/snd` share host alsa system with container.  
  Does not require `--privileged` as `-v /dev/snd:/dev/snd` would
* `-e AIRPLAY_NAME=Docker` set the AirPlay device name. Defaults to Docker
* extra arguments will be passed to shairplay-sync (try `-- help`)

### docker-compose
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
## Raspberry

If the sound from the speakers is disturbed, you need to add `audio_pwm_mode=2` to the bottom of `/boot/config.txt`  
To activate the changes you must reboot

# Problem reporting
If you find any problems report them to me  

[![Issue](https://img.shields.io/badge/-Add%20Issue-red?style=for-the-badge&logo=github)](https://github.com/Issogr/docker-airplay-audio/issues)

# Donate
Feed my coding hours, any help will be invested in the best possible fuel: pizza during the day and coffee and energy drinks at night.  

![bitcoin](https://res.cloudinary.com/noyon/image/upload/v1612492950/bitcoinqr_gnzju1.png)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [![paypal](https://res.cloudinary.com/noyon/image/upload/v1612494557/pp_cc_mark_111x69_fpuigq.jpg)](https://www.paypal.com/donate/?hosted_button_id=XJ2PUMBPM3ATG)
