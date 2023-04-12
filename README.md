## Wordpress Deployment with Nginx Reverse Proxy, Log Rotation, Wordpress Admin IP restriction. Automating The Process With Terraform and Docker-Compose.


- #### Terraform Configuration Files = [`wordpress-deploy.tf`](wordpress-deploy.tf)

- #### Docker-Compose File = [`docker-compose.yml`](docker-compose.yml)

- #### Docker & Docker-Compose Installtion Script = [`docker.sh`](docker.sh)

- #### Nginx Config File = [`nginx.conf`](nginx.conf)

- #### Logrotation Config File = [`nginx-logrotate.conf`](nginx-logrotate.conf)

- #### Script to Analyze the logs = [`analyze-logs.sh`](analyze-logs.sh)

## Screenshots

- Sample Wordpress Site :

![Screenshot (157)](https://user-images.githubusercontent.com/86839948/231408721-49dc1df4-b6aa-4814-a59e-3635cc266464.jpg)

- Accessing Admin Panel On Allowed IP :

![Screenshot (162)](https://user-images.githubusercontent.com/86839948/231410176-a3b7c8e2-c818-45b7-8c8d-4fe11fb7f43c.jpg)

![Screenshot (163)](https://user-images.githubusercontent.com/86839948/231409473-85db6770-4c77-44da-84a7-293be04f9dfc.jpg)

- Trying to access Admin Login From The IP Address That is Not Allowed :

![Screenshot (164)](https://user-images.githubusercontent.com/86839948/231409611-e4263e33-b5d0-413e-951c-ac62aa34140c.jpg)

- Log Analysis Script Result :

![Screenshot (161)](https://user-images.githubusercontent.com/86839948/231410771-aca3f575-7977-4b79-ae3f-4edd12c270fa.jpg)

