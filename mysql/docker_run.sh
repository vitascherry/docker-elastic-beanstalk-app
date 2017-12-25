docker run --name=films_films-mysql-db_1 \
-p 3306:3306 \
--network=films_films-private-network \
--volume=films_mysql-data:/var/lib/mysql/ \
--env MYSQL_ROOT_PASSWORD=newpassword \
-d blackcherry/films-mysql-db
