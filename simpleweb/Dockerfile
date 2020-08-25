FROM node:alpine

WORKDIR /usr/app

COPY ./ ./ 
RUN npm install

CMD ["npm", "start"]

# docker run -p 8080:8080 siddhant777/simpleweb 


# for debugging
# docker run -it siddhant777/simpleweb sh
# docker exec -it a9bd20e07f1b sh