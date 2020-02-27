# CS4365-db-setup
This project will set up a MySQL RDBMS in a Docker container, and run a schema migration using Flyway to create the database, tables, and insert the initial data. The schema defined here is copied from the database table sheet given to the Texas Tech CS4354 class in the Spring 2020 semester.

## Setup
You will need to follow the instructions for installing Docker on your operating system of choice. [Here is a link to get started.](https://www.docker.com/get-started)

Once Docker is installed, you will need to run the following commands in your operating system's terminal from this repository's root directory:

Linux | Mac OS X | Windows using Docker Toolbox
```
bash bootstrap.sh
docker-compose up
```

Windows 10 Powershell
```
start-process "C:\Path\To\Script\bootstrap.bat"
docker-compose up
```

## Interacting With the Database
In order to interact with the database, you will need to either open another terminal window or append the `-d` argument to the `docker-compose up` command shown above. The `-d` argument will run Docker Compose in a daemonized, backgrounded process. You can view all containers running by executing the `docker ps` command.

After you have a new terminal window open or have started up the database container with the `docker-compose up -d` command, you will be able to execute the following commandto log into the database running in the container:
```
docker exec -it cs4354-db mysql -u root cs4354
```

This command will log you into the MySQL RDBMS as the root user, and select the `cs4354` database to use. This can also be done with the command `use cs4354;`. If you would like to see the other databases available to query, you can do so with the command `show databases;`. Once you are logged in, you can view the tables with the `show tables;` command. You should now be able to query the information stored in the tables at will. In order to exit, use the `exit;` command.

## Feedback
If you have an issue with the setup or would like to request additional features, please create a GitHub issue under this repository. I will try to respond when I can.
