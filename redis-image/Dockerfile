# use an existing docker as a image
FROM alpine




# Download and install a Dependency

RUN apk add --update redis
RUN apk add --update gcc


# Tell the image what to do when it starts as a container

CMD ["redis-server"]

# 1. TO tag a image run this docker build -t siddhant777/redis:latest .