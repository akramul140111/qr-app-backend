events { }

http {
    server {
        listen 80;
#        server_name localhost;

        root /var/www;

        location / {
            try_files $uri /index.php$is_args$args;
        }

        location ~ \.php$ {
            include fastcgi_params;
            fastcgi_pass php:9000;
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }

        location ~ /\.ht {
            deny all;
        }
    }
}
