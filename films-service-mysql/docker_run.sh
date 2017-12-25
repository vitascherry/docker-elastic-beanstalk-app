docker run --name=films-service \
-p 8080:8080 \
--network=films-private-network \
-d blackcherry/films-service-jpa:0.0.1-SNAPSHOT
