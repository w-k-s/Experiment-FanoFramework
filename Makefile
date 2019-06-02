docker-build:
	docker build --build-arg BUILD_TYPE=dev -t fano .

docker-run: docker-stop
	docker run --name fano -d -p 80:80 fano

docker-stop:
	docker stop fano || true && docker rm fano || true