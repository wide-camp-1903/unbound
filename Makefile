interface = ens160

.PHONY: default
default: run log

.PHONY: init
init: clean
	docker network create --driver bridge -o parent=$(interface) vlan4020
	docker-compose build

.PHONY: run
run:
	docker-compose up --build -d

.PHONY: log
log:
	docker-compose logs -f

.PHONY: clean
clean:
	docker-compose kill
	docker-compose rm -f
