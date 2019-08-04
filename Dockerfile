FROM ubuntu:18.04

RUN apt-get update \
	&& apt-get upgrade \
	&& apt-get install -y vim \
	&& apt-get install -y build-essential \
	&& apt-get install -y wget \
	&& wget http://www.zlib.net/zlib-1.2.11.tar.gz \
	&& tar -xvf zlib-1.2.11.tar.gz \ 
	&& cd zlib-1.2.11 \
	&& ./configure --prefix=/usr/local \
	&& make \
	&& make install \
	&& apt-get install -y flex \
	&& apt-get install -y bison \
	&& wget http://mirror.23media.de/apache/httpd/httpd-2.2.32.tar.gz \
	&& tar -xvf httpd-2.2.32.tar.gz \
	&& cd httpd-2.2.32 \ 
	&& ./configure --prefix=/usr/local/apache2 --enable-so \
	&& make \
	&& make install \
	&& apt-get install -y mysql-client \
	&& apt-get install -y libicu-dev \
	&& apt-get install -y libxml2-dev \
	&& wget http://uk.php.net/distributions/php-4.4.9.tar.gz \
	&& tar xzvf php-4.4.9.tar.gz \
	&& cd php-4.4.9 \
	&& ./configure --prefix=/usr/local/php4 --with-apxs2=/usr/local/apache2/bin/apxs --with-mysql \
	&& make \ 
	&& make install \
	&& cp php.ini-recommended /usr/local/apache2/conf/php.ini

COPY httpd.conf /usr/local/apache2/conf/httpd.conf

EXPOSE 80

CMD ["/usr/local/apache2/bin/apachectl","-DFOREGROUND"]
