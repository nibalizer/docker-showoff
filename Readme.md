## Docker-showoff

A docker image for running showoff

In case you didn't want to keep a ruby around


## Quickstart

```shell
docker pull nibalizer/docker-showoff
docker run -it --rm  -p 9090:9090 --mount type=bind,source="$(pwd)",target=/srv/showoff  nibalizer/docker-showoff serve
```

Replace 'serve' above with 'help' to explore showoff functionality.


