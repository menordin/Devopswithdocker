FROM ubuntu:16.04 

ENV LC_ALL=C.UTF-8 

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash && \
    apt-get install -y nodejs && \
	apt-get purge -y --auto-remove curl && \ 
    rm -rf /var/lib/apt/lists/* 

RUN npm install && \
    npm install -g serve

WORKDIR /web
COPY web /web

EXPOSE 5000
CMD ["npm", "start"]