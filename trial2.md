```
# Console1
$ docker-compose up

# Console2
$ docker-compose exec mysql_input mysql -u root -p
Enter password: root

# Console3
$ docker-compose exec embulk sh
$ embulk preview config.yml
$ embulk run config.yml

# Console4
$ docker-compose exec mysql_output mysql -u root -p
Enter password: root
```
