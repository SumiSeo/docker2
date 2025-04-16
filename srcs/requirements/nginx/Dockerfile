FROM debian:bullseye

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install nginx -y
RUN apt-get install openssl -y
RUN apt-get install vim -y
    

COPY default /etc/nginx/sites-available/.

RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=FR/ST=France/L=Paris/O=Paris42/CN=sumseo.42.fr" \
	-keyout /etc/ssl/private/sumseo.key \
	-out /etc/ssl/certs/sumseo.crt

# RUN	rm -rf /etc/nginx/sites-enabled/* && \
# 	mv tmp/nginx.conf /etc/nginx/sites-available/nginx.conf && \
# 	ln -fs /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
