#!/bin/bash

# colors
MAGENTA='\033[1;35m'
NC='\033[0m' # No Color

printDescription() {
	printf "${MAGENTA}$1\n${NC}"
}

prestartMySQL() {
	printDescription "Pre-start mysql"
	docker-compose up -d mysql
	sleep 10
}

printDescription "Install Docker Dependencies"
wget -qO- https://get.docker.com/ | sh

printDescription "Install docker-compose Dependency"
sudo sh -c "curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose

printDescription "Start Docker"
sudo systemctl start docker

printDescription "Pull and build containers"
docker-compose pull
docker-compose build

prestartMySQL

printDescription "Start containers"
docker-compose up -d

prestartMySQL

printDescription "Run Migrations"
docker-compose run web python manage.py migrate

