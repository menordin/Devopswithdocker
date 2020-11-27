## 2.1
```
version: '3.5'

services:
        first_volume_exercise:
                image: devopsdockeruh/first_volume_exercise
                build: .
                volumes:
                        - ./logs.txt:/usr/app/logs.txt
                container_name: exer2.1
		``` 

## 2.2
```
:~/code/Devopswithdocker/part2$ cd 2.2/ && docker-compose up
Creating network "22_default" with the default driver
Creating 22_portti_1 ... done
Attaching to 22_portti_1
portti_1  |
portti_1  | > ports_exercise@1.0.0 start /usr/app
portti_1  | > node index.js
portti_1  |
portti_1  | Listening on port 80, this means inside of the container. Use -p to map the port to a port of your local machine.
^CGracefully stopping... (press Ctrl+C again to force)
Stopping 22_portti_1 ... done

:~/code/Devopswithdocker/part2/2.2$ cat docker-compose.yml >> ../answers.md
version: '3'

services:
        portti:
                image: devopsdockeruh/ports_exercise
                ports:
                        - 8080:80
```

## 2.3
```
version: '3'
        
services:
        backend:
                ports:
                - 5000:5000
                build: ~/code/Devopswithdocker/part1/exer1.11
        frontend:
                ports:
                - 8000:8000
                build: ~/code/Devopswithdocker/part1/exer1.10
```

## 2.4
```
:~/code/Devopswithdocker/part2/2.4$ docker-compose up
:~/code/Devopswithdocker/part2/2.4$ docker-compose scale compute=3
```

## 2.5
```
version: '3'

services:
        backend:
                ports:
                        - 5000:5000
                build: ~/code/Devopswithdocker/part1/exer1.11
                environment:
                        - REDIS=redis
        frontend:
                ports:
                        - 8000:8000
                build: ~/code/Devopswithdocker/part1/exer1.10
        redis:
                image: redis
                ports:
                        - 6379:6379

```

## 2.6
```
version: '3'

services:
        backend:
                ports:
                        - 5000:5000
                build: ~/code/Devopswithdocker/part1/exer1.11
                environment:
                        - REDIS=redis
                        - DB_USERNAME=postgres
                        - DB_PASSWORD=boot
                        - DB_NAME=postgres
                        - DB_NAME=db1
                depends_on:
                        - norsu
        frontend:
                ports:
                        - 8000:8000
                build: ~/code/Devopswithdocker/part1/exer1.10
        redis:
                image: redis
                ports:
                        - 6379:6379
        norsu:
                image: postgres
                restart: always
                environment:
                        POSTGRES_PASSWORD: boot

```

## 2.7
```
version: '3'

services:
  backend:
    ports:
      - 5000:5000
    build: ./backend
    volumes:
      - model:/src/model
    depends_on:
      - training
  frontend:
    ports:
      - 8000:8000
    build: ./frontend
    depends_on:
      - backend
  training:
    build: ./training
    volumes:
      - model:/src/model
      - images:/src/imgs
volumes:
  model:
  images:
```
## 2.8
```
version: '3'

services:
  backend:
    ports:
      - 5000:5000
    build: ~/code/Devopswithdocker/part1/exer1.11
    environment:
      - REDIS=redis
      - DB_USERNAME=postgres
      - DB_PASSWORD=boot
      - DB_NAME=db1
      - DB_HOST=postgres
    depends_on:
      - norsu
  frontend:
    ports:
      - 8000:8000
    build: ~/code/Devopswithdocker/part1/exer1.10
  redis:
    image: redis
    ports:
      - 6379:6379
  norsu:
    image: postgres
    restart: always
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=boot
      - POSTGRES_DB=db1
  nginx:
    depends_on:
      - frontend
      - backend
    image: nginx
    restart: always
    ports:
      - 80:80
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
```

## 2.9
```
version: '3'

services:
  backend:
    ports:
      - 5000:5000
    build: 
      context: ~/code/Devopswithdocker/part1/exer1.11
    volumes:
      - ./logs.txt:/usr/app/logs.txt
    environment:
      - REDIS=redis
      - DB_USERNAME=postgres
      - DB_PASSWORD=boot
      - DB_NAME=db1
      - DB_HOST=postgres
  frontend:
    ports:
      - 8000:8000
    build: 
      context: ~/code/Devopswithdocker/part1/exer1.10
      args:
        API_URL: '/api'
    environment: 
      - API_URL=http://localhost:8080
  redis:
    image: redis
  norsu:
    image: postgres
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=boot
      - POSTGRES_DB=db1
  nginx:
    image: nginx
    ports:
      - 8080:80
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf

volumes:
  postgres_data:
```