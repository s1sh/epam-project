FROM node:20-alpine3.16
#WORKDIR app
COPY . .
#RUN npm i -g npm@latest
RUN npm install
RUN npm run test
EXPOSE 8000
CMD ["node","app.js"]
