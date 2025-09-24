# Use Nginx as the base image
FROM nginx:alpine

# Set working directory inside container
WORKDIR /usr/share/nginx/html

# Remove default nginx static files
RUN rm -rf ./*

# Copy your static site files into nginx's web directory
COPY index.html ./

# Expose port 10000 because Render expects apps to listen on $PORT
EXPOSE 10000

# Override nginx default command to use $PORT
CMD ["sh", "-c", "nginx -g 'daemon off;' -c /etc/nginx/nginx.conf -p /usr/share/nginx/html -e /dev/stderr -g 'daemon off;' -g 'error_log /dev/stderr info;'"]
