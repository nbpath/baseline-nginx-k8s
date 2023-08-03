FROM nginx:1.25.1

RUN set -eux; \
  usermod -u 10001 nginx \
  && groupmod -g 10001 nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

RUN set -eux; \
  chown -R nginx:nginx /etc/nginx \
  && chown -R nginx:nginx /usr/share/nginx/html \
  && chown -R nginx:nginx /var/log/nginx \
  && chown -R nginx:nginx /var/cache/nginx \
  && chown -R nginx:nginx /var/log/nginx/ \
  && chown -R nginx:nginx /usr/local/bin/

RUN set -eux; \
  touch /var/run/nginx.pid \
  && chown nginx:nginx /var/run/nginx.pid

USER nginx