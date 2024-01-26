all: build

.PHONY: build
build: lw1 lw2 lw3

.PHONY: lw1
lw1:
	cd lw1/mushkin && make
	cd lw1/ermakov && make
	cd lw1/zamyatin && make

.PHONY: lw2
lw2:
	cd lw2/mushkin && make

.PHONY: lw3
lw3:
	cd lw3/mushkin && make

clean:
	cd lw1/mushkin && make clean
	cd lw1/ermakov && make clean
	cd lw1/zamyatin && make clean
