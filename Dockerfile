# Use Nginx to serve static files
FROM nginx:alpine

# Remove default Nginx static content (optional but clean)
RUN rm -rf /usr/share/nginx/html/*

# Copy pre-built static files into Nginx web directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]

