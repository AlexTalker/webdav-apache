ARG APACHE_TAG="2.4.65-trixie"

FROM httpd:${APACHE_TAG}

RUN mkdir "/usr/local/apache2/ssl/"

RUN chown www-data:www-data /usr/local/apache2/ssl/

VOLUME [ "/usr/local/apache2/ssl/" ]

RUN mkdir "/usr/local/apache2/auth/"

RUN chown www-data:www-data /usr/local/apache2/auth/

VOLUME [ "/usr/local/apache2/auth/" ]

RUN mkdir "/usr/local/apache2/webdav/"

RUN chown www-data:www-data /usr/local/apache2/webdav/

VOLUME [ "/usr/local/apache2/webdav/" ]

RUN mkdir "/usr/local/apache2/var/"

RUN chown www-data:www-data /usr/local/apache2/var/

VOLUME [ "/usr/local/apache2/var/" ]

COPY "conf/httpd.conf" "/usr/local/apache2/conf/httpd.conf"
COPY "conf/VirtualHostSSLOn.conf" "/usr/local/apache2/conf/VirtualHostSSLOn.conf"
COPY "conf/VirtualHostSSLOff.conf" "/usr/local/apache2/conf/VirtualHostSSLOff.conf"

# Domain-related optons,
ENV WEBDAV_HOST=localhost WEBDAV_PORT=443 WEBDAV_SSL=On

# Path prefix for webdav storage
ENV WEBDAV_PATH=/webdav

ENV WEBDAV_AUTH_NAME="Authorization required"

ENV WEBDAV_AUTH_RO_GROUP="webdav-ro"

ENV WEBDAV_AUTH_RW_GROUP="webdav-rw"

