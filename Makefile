all: build

.PHONY: build
build: lw1

.PHONY: lw1
lw1:
	cd lw1/mushkin && make
	cd lw1/ermakov && make
	cd lw1/zamyatin && make

clean:
	cd lw1/mushkin && make clean
	cd lw1/ermakov && make clean
	cd lw1/zamyatin && make clean
