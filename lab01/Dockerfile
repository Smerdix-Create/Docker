FROM nginx:stable-alpine3.20-perl
RUN addgroup -S tech && adduser -S tech -G tech
RUN chown -R  tech:tech /run/ /var/cache/nginx /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
USER tech
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
EXPOSE 8080
