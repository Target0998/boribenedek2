# site/Dockerfile
FROM nginx:alpine
# (optional) remove default site
RUN rm -rf /usr/share/nginx/html/*
# copy everything in the folder into nginx html root
COPY . /usr/share/nginx/html
# Nginx listens on 80 by default; Cloud Run will route traffic to it
# Add new config that listens on $PORT
RUN printf 'server { listen 8080; root /usr/share/nginx/html; index index.html; }' > /etc/nginx/conf.d/default.conf

# Expose 8080 for Cloud Run
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]