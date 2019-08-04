# Vulnerable-Web-Server
It is Installing vulnerable web server for penetration testing

Blog: [https://mitny.github.io/articles/2019-08/Setting-Vulnerable-Server](https://mitny.github.io/articles/2019-08/Setting-Vulnerable-Server)

### Environment
1. Ubuntu 18:04
2. docker version: 18.09.5
3. Apache version: 2.2.32
4. PHP version: 4.4.9

### Dockerfile Build and Run
1. `docker build -t [image name]`  in the folder where the Dockerfile is located
2. `docker run -it -d -p [port]:[port] --name [container name] [image name]` <br>EX) docker run -it -d -p 3333:80 --name web vulnerable-web
3. docker exec -it [container ID] /bin/bash

### Check index.html and phpinfo()

1. index.html (path: /usr/local/apache2/htdocs)
![](https://mitny.github.io/assets/posts/web/docker-apache-run.png)

2. <?php phpinfo(); ?>
![](https://mitny.github.io/assets/posts/web/phpinfo-check.png)
