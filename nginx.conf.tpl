events {}

http {
    server {
        listen 80;
        server_name ${PUBLIC_IP};
        
        location / {
            proxy_pass http://frontend:3000; # Assuming your React frontend is running on port 3000
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection 'upgrade';
            proxy_set_header Host $host;
            proxy_cache_bypass $http_upgrade;
        }

        location /api {
            proxy_pass http://backend:3001/api; # Assuming your Express.js API is running on port 5000
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection 'upgrade';
            proxy_set_header Host $host;
            proxy_cache_bypass $http_upgrade;
        }

        # Add other configurations as needed
    }
}
