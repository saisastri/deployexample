FROM docker.ceterainternal.com/base-nginx:latest

MAINTAINER Kevin Choate <kevin.choate@firstallied.com>

WORKDIR /tmp

# Substitute project specific server.xml
#ADD ./nginx.conf.d/* /etc/nginx/conf.d/

ADD ./html/ /usr/share/nginx/html/

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
