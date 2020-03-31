# docker-postgresql

Docker utilities for PostgreSQL

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

* Ubuntu, Debian or CentOS operating system
* A user account with sudo privileges
* Command-line/terminal (CTRL-ALT-T or Applications menu > Accessories > Terminal)
* Docker software repositories (optional)

The specific steps to installing Docker will differ depending on the host's operating system. Full instructions can be found on [Docker's installation documentation](https://docs.docker.com/install/overview/)


### Installing

Clone this repository on your local machine

```bash
git clone https://github.com/gdeignacio/docker-postgresql.git
```

## Deployment

1. Clone this repository on your local machine

    ```bash
    git clone https://github.com/gdeignacio/docker-postgresql.git
    cd docker-postgresql
    ```

2. Run [install.sh](./scripts/install.sh) script

    ```bash
    cd scripts
    ./install.sh
    ```
    or

    ```bash
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get remove docker docker-engine docker.io docker-compose
    sudo apt-get autoremove
    sudo apt-get install docker.io docker-compose
    sudo systemctl enable docker
    sudo systemctl start docker
    sudo systemctl status docker
    sudo useradd -p $(openssl passwd -1 docker) docker -g docker
    sudo mkdir -p /app/docker
    ```

3. Edit [setenv.sh](./scripts/setenv.sh) file

    * Set CODAPP by replacing *codapp* with your actual codapp long code
    * Set APP by replacing *app* with your actual app short code
    * Set BDPASSAPP by replacing *codapp* with a password of your choice
    * Set BDPORTAPP by replacing 5432 with another port if needed
    * Set VERSION to any available version from this repo

    ```bash
    export CODAPP=codapp
    export APP=app
    export BDPASSAPP=codapp
    export BDPORTAPP=5432

    export LONG_APP_NAME=$CODAPP
    export SHORT_APP_NAME=$APP
    export DB_PORT=$BDPORTAPP
    export PG_PASSWORD=$BDPASSAPP
    export DATA_PATH=/app/docker/postgresql/$LONG_APP_NAME/data
    export TABLESPACE_PATH=$DATA_PATH/tablespaces
    export PGTABLESPACES=/var/lib/postgresql/data/tablespaces
    export GIT_URL=https://github.com/gdeignacio/docker-postgresql.git
    export FOLDER_NAME=docker-postgresql
    export VERSION=9.5-alpine
    ```

4. Run your containerized database.

    Run ./fresh_build_and_run.sh to set a brand new database. This will be erase all previous existing data.

    ```bash
    ./fresh_build_and_run.sh
    ```
    or
    
    Run ./persistent_build_and_run.sh to set brand new container without erase existing data.

    ```bash
    ./persistent_build_and_run.sh
    ```
    or
    
    Run ./persistent_run.sh to launch container from existing built image

    ```bash
    ./persistent_run.sh
    ```
    
    All executions remove containers when finished.


## Also

* Stop your container

    ```bash
    sudo docker stop pg-docker-codapp
    ```

* List built images

    ```bash
    sudo docker image ls
    ```

* Delete existing images

    ```bash
    sudo docker image prune -a
    ```

* See [Docker reference](https://docs.docker.com/reference/) for more options






## Authors

* **gdeignacio** - *Initial work* - [gdeignacio](https://github.com/gdeignacio)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* https://github.com/docker-library/postgres


