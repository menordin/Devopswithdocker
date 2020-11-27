1.1
```
CONTAINER ID        IMAGE               COMMAND                  CREATED              STATUS                          PORTS               NAMES
4204fb85e15b        nginx               "/docker-entrypoint.…"   34 seconds ago       Up 33 seconds                   80/tcp              practical_clarke
304304b4832a        hello-world         "/hello"                 About a minute ago   Exited (0) About a minute ago                       eloquent_noether
47d2b31d5e91        nginx               "/docker-entrypoint.…"   About a minute ago   Up About a minute               80/tcp              zen_mcnulty
```

1.2
```
Before: 
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS               NAMES
4204fb85e15b        nginx               "/docker-entrypoint.…"   2 minutes ago       Exited (0) 49 seconds ago                       practical_clarke
304304b4832a        hello-world         "/hello"                 3 minutes ago       Exited (0) 3 minutes ago                        eloquent_noether
47d2b31d5e91        nginx               "/docker-entrypoint.…"   3 minutes ago       Exited (0) 41 seconds ago                       zen_mcnulty
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
nginx               latest              daee903b4e43        2 days ago          133MB
hello-world         latest              bf756fb1ae65        10 months ago       13.3kB

After: 

CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
nginx               latest              daee903b4e43        2 days ago          133MB
hello-world         latest              bf756fb1ae65        10 months ago       13.3kB
```

## 1.3
```
~/code/Devopswithdocker/part1$ docker run -it devopsdockeruh/pull_exercise
Unable to find image 'devopsdockeruh/pull_exercise:latest' locally
latest: Pulling from devopsdockeruh/pull_exercise
8e402f1a9c57: Pull complete
5e2195587d10: Pull complete
6f595b2fc66d: Pull complete
165f32bf4e94: Pull complete
67c4f504c224: Pull complete
Digest: sha256:7c0635934049afb9ca0481fb6a58b16100f990a0d62c8665b9cfb5c9ada8a99f
Status: Downloaded newer image for devopsdockeruh/pull_exercise:latest
Give me the password: basics
You found the correct password. Secret message is:
"This is the secret message"
```

## 1.4
```
~/code/Devopswithdocker/part1$ docker run -d devopsdockeruh/exec_bash_exercise
Unable to find image 'devopsdockeruh/exec_bash_exercise:latest' locally
latest: Pulling from devopsdockeruh/exec_bash_exercise
1c6172af85ee: Pull complete
b194b0e3c928: Pull complete
1f5ec00f35d5: Pull complete
93b1353672b6: Pull complete
3d7f38db3cca: Pull complete
21e102f9fe89: Pull complete
d851ffed797c: Pull complete
a45031e28c68: Pull complete
ca3c1414856f: Pull complete
02c74c9936fd: Pull complete
ddb55f8ab0a8: Pull complete
Digest: sha256:d38b6f6b0eed2880e25c9eb7f83f1cd016ffe3a56c9a3fec6e7bee480bf1ed0f
Status: Downloaded newer image for devopsdockeruh/exec_bash_exercise:latest
b99c09c815660b07dddedcb07f3d47fd20b0834996db490b3882d8713e59d6fc
~/code/Devopswithdocker/part1$ docker exec -it b9 bash
root@b99c09c81566:/usr/app# tail -f ./logs.txt
"Docker is easy"
Fri, 20 Nov 2020 10:43:13 GMT
Fri, 20 Nov 2020 10:43:16 GMT
Fri, 20 Nov 2020 10:43:19 GMT
Fri, 20 Nov 2020 10:43:22 GMT
Secret message is:
"Docker is easy"
Fri, 20 Nov 2020 10:43:28 GMT
Fri, 20 Nov 2020 10:43:31 GMT
Fri, 20 Nov 2020 10:43:34 GMT
Fri, 20 Nov 2020 10:43:37 GMT
Secret message is:
"Docker is easy"
```

## 1.5
```
~/code/Devopswithdocker/part1$ docker run -it ubuntu:16.04 sh -c 'apt-get update; apt-get install curl -y; echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website;'
Get:1 http://archive.ubuntu.com/ubuntu xenial InRelease [247 kB]
Get:2 http://security.ubuntu.com/ubuntu xenial-security InRelease [109 kB]
Setting up librtmp1:amd64 (2.4+20151223.gitfa8646d-1ubuntu0.1) ...
Setting up libcurl3-gnutls:amd64 (7.47.0-1ubuntu2.16) ...
Setting up libsasl2-modules:amd64 (2.1.26.dfsg1-14ubuntu0.2) ...
Setting up curl (7.47.0-1ubuntu2.16) ...
Processing triggers for libc-bin (2.23-0ubuntu11.2) ...
Processing triggers for ca-certificates (20201027ubuntu0.16.04.1) ...
Updating certificates in /etc/ssl/certs...
138 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...
done.
Input website:
helsinki.fi
Searching..
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
<h1>Moved Permanently</h1>
<p>The document has moved <a href="http://www.helsinki.fi/">here</a>.</p>
</body></html>
```
## 1.6

:~/code/Devopswithdocker/part1/exer1.6$ cat Dockerfile
FROM devopsdockeruh/overwrite_cmd_exercise
CMD ["-c"]
:~/code/Devopswithdocker/part1/exer1.6$ docker build -t docker-clock .
Sending build context to Docker daemon  2.048kB
Step 1/2 : FROM devopsdockeruh/overwrite_cmd_exercise
latest: Pulling from devopsdockeruh/overwrite_cmd_exercise
092586df9206: Pull complete
ef599477fae0: Pull complete
4530c6472b5d: Pull complete
d34d61487075: Pull complete
87fc2710b63f: Pull complete
e83c771c5387: Pull complete
fef6195892ae: Pull complete
70e1a68db517: Pull complete
c2599bbef3cb: Pull complete
c5a7dd6f6ae1: Pull complete
446220381e79: Pull complete
27d5280e809c: Pull complete
Digest: sha256:02e38f4285d5cfaff5ed57ae67a8d99e041027da8f5c972329b46e2b7a47b7d2
Status: Downloaded newer image for devopsdockeruh/overwrite_cmd_exercise:latest
 ---> 3d2b622b1849
 Step 2/2 : CMD ["-c"]
  ---> Running in ec516cdbc408
  Removing intermediate container ec516cdbc408
   ---> 71a45b4deb73
   Successfully built 71a45b4deb73
   Successfully tagged docker-clock:latest
:~/code/Devopswithdocker/part1/exer1.6$ docker run docker-clock
1
2
3
4

## 1.7
:~/code/Devopswithdocker/part1/exer1.7$ cat Dockerfile >> ../answers.md
FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl

CMD echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website;
:~/code/Devopswithdocker/part1/exer1.7$ docker build -t curler .
Sending build context to Docker daemon  2.048kB
Step 1/3 : FROM ubuntu:16.04
---> dfeff22e96ae
Step 2/3 : RUN apt-get update && apt-get install -y curl
---> Running in 865d8ddc9274
done.
Removing intermediate container 865d8ddc9274
---> 693b345fcaab
Step 3/3 : CMD echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website;
---> Running in ec19b4c39319
Removing intermediate container ec19b4c39319
---> 276dc5370340
Successfully built 276dc5370340
Successfully tagged curler:latest
:~/code/Devopswithdocker/part1/exer1.7$ docker run -it curler
Input website:
helsinki.fi
Searching..
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
<h1>Moved Permanently</h1>
<p>The document has moved <a href="http://www.helsinki.fi/">here</a>.</p>
</body></html>

## 1.8

:~/code/Devopswithdocker/part1$ docker run devopsdockeruh/first_volume_exercise
Unable to find image 'devopsdockeruh/first_volume_exercise:latest' locally
latest: Pulling from devopsdockeruh/first_volume_exercise
1c6172af85ee: Already exists
b194b0e3c928: Already exists
1f5ec00f35d5: Already exists
93b1353672b6: Already exists
3d7f38db3cca: Already exists
21e102f9fe89: Already exists
d851ffed797c: Already exists
a45031e28c68: Already exists
ca3c1414856f: Already exists
f092ecebb4a6: Pull complete
b51567d0861f: Pull complete
Digest: sha256:38dd790d251fa970e338546f1cc698214dbdbfb13a0b6b057177c20f960f31b2
Status: Downloaded newer image for devopsdockeruh/first_volume_exercise:latest
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
^CClosing file

:~/code/Devopswithdocker/part1$ docker ps -a
CONTAINER ID        IMAGE                                  COMMAND                   CREATED             STATUS
     PORTS               NAMES
     c2b67dacf4d4        devopsdockeruh/first_volume_exercise   "docker-entrypoint.s…"    56 seconds ago      Exited (0) 44 seconds ago                         flamboyant_feistel

:~/code/Devopswithdocker/part1$ docker cp "c2b://usr/app/" .
:~/code/Devopswithdocker/part1$ docker run -v ./app:/usr/app devopsdockeruh/first_volume_exercise
docker: Error response from daemon: create ./app: "./app" includes invalid characters for a local volume name, only "[a-zA-Z0-9][a-zA-Z0-9_.-]" are allowed. If you intended to pass a host directory, use absolute path.
See 'docker run --help'.
:~/code/Devopswithdocker/part1$ docker run -v ~/code/Devopswithdocker/part1/app:/usr/app devopsdockeruh/first_volume_e
xercise
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
^CClosing file
:~/code/Devopswithdocker/part1$ cat app/logs.txt
Sat, 21 Nov 2020 17:36:47 GMT
Sat, 21 Nov 2020 17:36:50 GMT
Sat, 21 Nov 2020 17:36:53 GMT
Sat, 21 Nov 2020 17:36:56 GMT
Secret message is:
"Volume bind mount is easy"

## 1.9
```
:~/code/Devopswithdocker/part1$ docker run -p 3000:80 devopsdockeruh/ports_exercise
Unable to find image 'devopsdockeruh/ports_exercise:latest' locally
latest: Pulling from devopsdockeruh/ports_exercise
cbdbe7a5bc2a: Pull complete
fb0e3739aee1: Pull complete
738de7869598: Pull complete
ffd68be3d86c: Pull complete
d6a92ac5065d: Pull complete
8deb0960be38: Pull complete
aec7a3bd83e0: Pull complete
8f73392c117e: Pull complete
Digest: sha256:9779e303353ef47da9ea0223bfbb9fbdb8f8fe39178e2e06153027e28e9e5400
Status: Downloaded newer image for devopsdockeruh/ports_exercise:latest

> ports_exercise@1.0.0 start /usr/app
> node index.js

Listening on port 80, this means inside of the container. Use -p to map the port to a port of your local machine.

:~$ curl localhost:3000
Ports configured correctly!!
```

## 1.10
:~/code/Devopswithdocker/part1$ cat exer1.10/Dockerfile >> answers.md
FROM ubuntu:16.04

WORKDIR /softa
COPY frontend-example-docker frontend-example-docker
RUN apt update && apt install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && apt install -y nodejs
RUN node -v && npm -v

RUN cd frontend-example-docker && npm install

CMD cd frontend-example-docker && npm start

:~/code/Devopswithdocker/part1$ docker build exer1.10/
Sending build context to Docker daemon  974.3kB
Step 1/7 : FROM ubuntu:16.04
---> dfeff22e96ae
---> Running in 8d6dc6a76ba3
Removing intermediate container 8d6dc6a76ba3
---> 4f851bed1236
Successfully built 4f851bed1236
:~/code/Devopswithdocker/part1$ docker run -p 5000:5000 4f851

> frontend-example-docker@1.0.0 start /softa/frontend-example-docker
> webpack --mode production && serve -s -l 5000 dist
Browserslist: caniuse-lite is outdated. Please run:
npx browserslist@latest --update-db
Browserslist: caniuse-lite is outdated. Please run:
npx browserslist@latest --update-db
Hash: 9a4d23964a0815fedb61
...
...
...
INFO: Accepting connections at http://localhost:5000

## 1.11
:~/code/Devopswithdocker/part1$ cat exer1.11/Dockerfile >> answers.md
FROM ubuntu:16.04

WORKDIR /softa
COPY backend-example-docker backend-example-docker
RUN apt update && apt install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && apt install -y nodejs
RUN node -v && npm -v

CMD cd backend-example-docker && npm install && npm start

:~/code/Devopswithdocker/part1$ docker build exer1.11/
Sending build context to Docker daemon  270.3kB
Step 1/6 : FROM ubuntu:16.04
---> dfeff22e96ae
Step 2/6 : WORKDIR /softa
Removing intermediate container c1a5df9063e3
---> 9fac41f33e11
Successfully built 9fac41f33e11

:~/code/Devopswithdocker/part1$ docker run -it -p 8000:8000 -v ~/code/Devopswithdocker/part1/exer1.11/backend-example-
docker:/softa/backend-example-docker 9fac

> nodemon@2.0.4 postinstall /softa/backend-example-docker/node_modules/nodemon
> node bin/postinstall || exit 0

Love nodemon? You can now support the project via the open collective:
> https://opencollective.com/nodemon/donate

 npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@2.1.3 (node_modules/fsevents):
 npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@2.1.3: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})

added 210 packages from 176 contributors and audited 211 packages in 6.351s

10 packages are looking for funding
 run `npm fund` for details

found 0 vulnerabilities


> backend-example-docker@1.0.0 start /softa/backend-example-docker
> node index.js

ENV values set as follows: { DB:
   { username: undefined,
     password: undefined,
     database: undefined,
     host: 'localhost' },
   PORT: 8000,
   FRONT_URL: '',
   REDIS: undefined,
   REDIS_PORT: 6379 }
[Exercise 2.6+] DB_USERNAME and/or DB_PASSWORD are not defined, skipping db connection
[Exercise 2.5+] REDIS is not defined, skipping redis connection
Started on port 8000

## 1.12
:~/code/Devopswithdocker/part1$ cat exer1.11/Dockerfile
FROM ubuntu:16.04

WORKDIR /softa
COPY backend-example-docker backend-example-docker
RUN apt update && apt install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && apt install -y nodejs
RUN node -v && npm -v

ENV FRONT_URL=http://localhost:5000

CMD cd backend-example-docker && npm install && npm start

:~/code/Devopswithdocker/part1$ docker build exer1.11/
Sending build context to Docker daemon  17.69MB
Step 1/6 : FROM ubuntu:16.04
Step 6/6 : CMD cd backend-example-docker && npm install && npm start
---> Running in d7ea93b0e4d0
Removing intermediate container d7ea93b0e4d0
---> ec84ca6115fc
Successfully built ec84ca6115fc

:~/code/Devopswithdocker/part1$ docker run -it -p 8000:8000 -v ~/code/Devopswithdocker/part1/exer1.11/backend-example-docker/:/softa/backend-example-docker ec84
[Exercise 2.5+] REDIS is not defined, skipping redis connection
Started on port 8000


:~/code/Devopswithdocker/part1$ cat exer1.10/Dockerfile >> answers.md
FROM ubuntu:16.04

WORKDIR /softa
COPY frontend-example-docker frontend-example-docker
RUN apt update && apt install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && apt install -y nodejs
RUN node -v && npm -v

ENV API_URL=http://localhost:8000

RUN cd frontend-example-docker && npm install

CMD cd frontend-example-docker && npm start

:~/code/Devopswithdocker/part1$ docker build exer1.10/
Step 8/8 : CMD cd frontend-example-docker && npm start
---> Running in 2ec71f83798a
Removing intermediate container 2ec71f83798a
---> 1676b99ae791
Successfully built 1676b99ae791

mats@Mats-PC:~/code/Devopswithdocker/part1$ docker run -it -p 5000:5000 1676b

> frontend-example-docker@1.0.0 start /softa/frontend-example-docker
> webpack --mode production && serve -s -l 5000 dist

Browserslist: caniuse-lite is outdated. Please run:
npx browserslist@latest --update-db
+ 1 hidden module
UPDATE AVAILABLE The latest version of `serve` is 11.3.2
ERROR: Cannot copy to clipboard: write EPIPE
   ┌────────────────────────────────────────────────┐
   │                                                │
   │   Serving!                                     │
   │                                                │
   │   - Local:            http://localhost:5000    │
   │   - On Your Network:  http://172.17.0.4:5000   │
   │                                                │
   └────────────────────────────────────────────────┘

^C
INFO: Gracefully shutting down. Please wait...

## 1.13
:~/code/Devopswithdocker/part1$ cat exer1.13/Dockerfile
FROM openjdk:8-slim
WORKDIR /javatin
COPY spring-example-project .
RUN ./mvnw package
CMD java -jar ./target/docker-example-1.1.3.jar
EXPOSE 8080

## 1.14
:~/code/Devopswithdocker/part1$ cat exer1.14/Dockerfile
FROM ruby:2.6.0
WORKDIR /rubytin
COPY rails-example-project .
RUN apt-get update && apt-get install -y nodejs
RUN gem install bundler
RUN bundle install
RUN rails db:migrate
CMD rails s

Step 11/11 : CMD rails s
---> Running in 9192652500c6
Removing intermediate container 9192652500c6
---> e73df57e4228
Successfully built e73df57e4228

## 1.15

https://hub.docker.com/r/matseric/nodet.js

## 1.16
https://matsdocker.herokuapp.com/