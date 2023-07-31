VERSION := $(shell git log --pretty=format:'' | wc -l)

build:
	docker build -t reference-cn:$(VERSION) . -f ./web/Dockerfile

run:
	docker-compose up --build

stop:
	docker compose --file 'docker-compose.yml' --project-name 'utils-reference-cn' stop

clean: stop
	docker compose --file 'docker-compose.yml' --project-name 'utils-reference-cn' down

status:
	@if docker images | grep -q reference-cn; then \
        echo "Reference-cn Builded"; \
	else \
		echo "No Image Builded"; \
    fi