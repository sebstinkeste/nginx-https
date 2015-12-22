FROM nginx

MAINTAINER  Sébastien.Stinkeste (sebastien.stinkeste@alterway.fr)

RUN apt-get update && apt-get -y install openssl
RUN mkdir /etc/nginx/ssl && cd /etc/nginx/ssl && \
	openssl genrsa -out /etc/nginx/ssl/ssl.key 2048 && \
	openssl req -new -sha256 -key /etc/nginx/ssl/ssl.key -out /etc/nginx/ssl/ssl.csr

COPY nginx.conf /etc/nginx/conf.d/default.conf
#COPY nginx.conf /etc/nginx/sites-available/nginx.conf
#RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled

COPY entrypoint.sh /entrypoint.sh


EXPOSE 80 443


WORKDIR /var/www

CMD ["/entrypoint.sh"]

