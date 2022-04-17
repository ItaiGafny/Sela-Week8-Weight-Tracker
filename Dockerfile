#FROM node:14.19-alpine
FROM node:14-alpine
WORKDIR /home/app
#RUN mkdir -p /home/app
#copy the files needed to the app
COPY *.json ./
COPY tools ./tools
COPY src ./src
COPY node_modules ./node_modules
COPY .env ./

#install node and dependencies
# RUN npm install @hapi/hapi@19 @hapi/bell@12 @hapi/boom@9 @hapi/cookie@11 @hapi/inert@6 @hapi/joi@17 @hapi/vision@6 dotenv@8 ejs@3 postgres@1
# RUN npm install --save-dev nodemon@2

ENV port=8080
EXPOSE 8080

#Init DB
#RUN npm run initdb

#Start the app
CMD ["npm", "run","dev"]