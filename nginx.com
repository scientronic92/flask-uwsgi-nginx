pstream app{
    server  unix:/home/user/react_server/flaskProject/app.sock;
    }
server {
    location / {
       proxy_redirect off;
       #proxy_pass http://app;
       uwsgi_pass  app;
       include /etc/nginx/uwsgi_params;
    }
}
