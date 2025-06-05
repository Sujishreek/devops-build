# Use a minimal Nginx image
FROM nginx:alpine

# Clean default static files if needed (optional)
RUN rm -rf /usr/share/nginx/html/*

# Copy built static files into Nginx's html directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

