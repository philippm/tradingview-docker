# README

## Installation

```bash
docker build -t tradingview .

# allow docker to access x server
xhost +local:docker

# this should launch the docker instance
docker run -it --rm \
    --env="DISPLAY" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    tradingview

# now in the docker instance console
tradingview --no-sandbox
```
