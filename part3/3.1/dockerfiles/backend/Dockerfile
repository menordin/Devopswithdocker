FROM node:10

RUN npm install

ENV LC_ALL=C.UTF-8 

WORKDIR /backend
COPY backend /backend

EXPOSE 8000

CMD [ "npm", "start" ]