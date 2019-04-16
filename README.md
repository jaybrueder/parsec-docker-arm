# Parsec ARM Client inside Docker Container

## Build

Image must be built on ARM architecture:

```
$ git clone https://github.com/jaybrueder/parsec-docker-arm.git
$ cd parsec-docker
$ docker build -t jaybrueder/parsec-docker-arm .
```

## Run

```
$ ./run.sh
```
