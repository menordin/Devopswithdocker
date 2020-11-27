FROM docker
WORKDIR /app
COPY build.sh .
RUN apk add --no-cache git
CMD ["/bin/bash", "/app/build.sh"]