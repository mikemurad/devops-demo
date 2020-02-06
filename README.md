# DevOps Demo 
> Django web app with a MySQL DB

> Uses Docker Compose to create a multi container Docker Application

## Before you begin

Because the Docker daemon always runs as the root user, we need the ability to manage it as a non-root user. Trying to accomplish this within one script, by changing the group membership, proved to be problematic. As did running docker commands with sudo (which I do not encourage). 

So, before you begin you'll need to run these commands on your Linux Server then log out/log back in:

```bash
sudo groupadd docker
sudo usermod -aG docker $USER
```
*Group membership requires a restart or logout/login to be re-evaluated*


## Usage

```bash
sh startup.sh
```

Running startup.sh will: 
1. Install Dependencies 
1. Build and prepare the Django Web App & MySQL DB containers
1. Spin up the docker application
1. Run migrations

Server will start at http://0.0.0.0:8000/

**Note**
- Dependencies will not install properly on an "Amazon Linux" dristro of Linux
- Known issue with the MySQL 5.7 docker not initializing the database properly

	**Problem:** Django does not connect to MySQL server on startup -- randomly

	**Demo Solution:** Run "$docker-compose up" if the server does not start initially. May take one or two times.

[Reference 1](https://github.com/docker-library/mysql/issues/69)


## Changes:
- *added* Dockerfile
- *added* docker-compose.yml
- *added* startup.sh
- *edited* ALLOWED_HOSTS in settings.py