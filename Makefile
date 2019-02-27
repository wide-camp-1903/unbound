vlan4000 = ens192
vlan4020 = ens160

.PHONY: default
default: run log

.PHONY: init
init: clean
	docker network create --driver bridge -o parent=$(vlan4000) vlan4000
	docker network create --driver bridge -o parent=$(vlan4020) vlan4020
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
	docker network rm vlan4000 || true
	docker network rm vlan4020 || true
