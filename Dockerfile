#FROM node:14.19-alpine
FROM node:14-alpine
WORKDIR /home/app
#copy the files needed to the app
COPY *.json ./
COPY tools ./tools
COPY src ./src
COPY node_modules ./node_modules
#COPY .env ./

ENV port=8080
EXPOSE 8080

#Init DB
#RUN npm run initdb

#Start the app
CMD ["npm", "run","dev"]