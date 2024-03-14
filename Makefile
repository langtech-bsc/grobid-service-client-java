deploy:
	docker compose up -d
undeploy:
	docker compose down
stop:
	docker compose stop
build-docker:
	docker build -t projecteaina/grobid-client-java:latest --build-arg GROBID_CLIENT_PROPIERTIES_FILE=grobid-client.docker.properties .
	docker push projecteaina/grobid-client-java:latest
build-singularity:
	docker build -t projecteaina/grobid-client-java:latest --build-arg GROBID_CLIENT_PROPIERTIES_FILE=grobid-client.properties .
	docker push projecteaina/grobid-client-java:latest
	singularity pull docker://projecteaina/grobid-client-java:latest  && mv grobid-client-java_latest.sif grobid-client-java.sif
