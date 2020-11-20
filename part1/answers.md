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
