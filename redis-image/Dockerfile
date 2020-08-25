# use an existing docker as a image
FROM alpine




# Download and install a Dependency

RUN apk add --update redis


# Tell the image what to do when it starts as a container

CMD ["redis-server"]