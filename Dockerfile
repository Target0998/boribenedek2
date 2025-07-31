# site/Dockerfile
FROM nginx:alpine
# (optional) remove default site
RUN rm -rf /usr/share/nginx/html/*
# copy everything in the folder into nginx html root
COPY . /usr/share/nginx/html
# Nginx listens on 80 by default; Cloud Run will route traffic to it