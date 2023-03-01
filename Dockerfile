FROM nginx:alpine AS final
COPY ./nginx.conf /etc/nginx/nginx.conf