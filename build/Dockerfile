# Use a simple nginx image
FROM nginx:alpine

# Remove default nginx html
RUN rm -rf /usr/share/nginx/html/*

# Copy website files to nginx
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80
